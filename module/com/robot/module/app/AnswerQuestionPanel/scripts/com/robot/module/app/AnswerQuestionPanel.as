package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.answer.AnswerQuestionModel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.clearInterval;
   import flash.utils.setInterval;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class AnswerQuestionPanel extends Sprite implements IModule
   {
      
      private var c_uint:uint = 0;
      
      private var loop1:uint;
      
      private var bg_mc:Sprite;
      
      private var close_btn:SimpleButton;
      
      private var main_mc:MovieClip;
      
      private var info_a:Array;
      
      private var loop:uint;
      
      private var power_mc:*;
      
      private var currentObj:Object;
      
      public function AnswerQuestionPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(main_mc);
      }
      
      public function setup() : void
      {
         main_mc = new UIAnswerPanel();
         close_btn = main_mc["close_btn"];
         bg_mc = main_mc["bg_mc"];
         bg_mc.buttonMode = true;
      }
      
      private function setError(b1:Boolean) : void
      {
         main_mc["error_mc"].visible = b1;
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(main_mc))
         {
            return;
         }
         c_uint = 0;
         info_a = AnswerQuestionModel.getAnswers();
         currentObj = info_a[0];
         setTitle(currentObj);
         if(main_mc["face_mc"].currentFrame != 1)
         {
            main_mc["face_mc"].gotoAndStop(1);
         }
         main_mc["c_mc"].visible = false;
         main_mc["error_mc"].visible = false;
         LevelManager.appLevel.addChild(main_mc);
         DisplayUtil.align(main_mc,null,AlignType.MIDDLE_CENTER);
         main_mc["face_mc"].play();
         addEvent();
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      private function setTiHandler() : void
      {
         clearInterval(loop1);
         addEvent();
         setTitle(currentObj);
         main_mc["c_mc"].visible = false;
      }
      
      private function setTitle(obj:Object) : void
      {
         main_mc["title_txt"].text = "问题 " + obj.index;
         main_mc["con_txt"].text = obj.title;
         for(var i1:int = 1; i1 < 4; i1++)
         {
            main_mc["mc" + i1]["txt"].text = i1 + "." + obj.que[i1 - 1];
         }
      }
      
      private function onUpHandler(e:MouseEvent) : void
      {
         main_mc.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function setVisiblehandler() : void
      {
         clearInterval(loop);
         addEvent();
         power_mc["mask_mc"].visible = false;
         setError(false);
         power_mc = null;
      }
      
      private function onBgDownHandler(e:MouseEvent) : void
      {
         main_mc.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         close_btn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         bg_mc.removeEventListener(MouseEvent.MOUSE_DOWN,onBgDownHandler);
         for(var i1:int = 1; i1 < 4; i1++)
         {
            (main_mc["mc" + i1] as MovieClip).buttonMode = false;
            main_mc["mc" + i1].removeEventListener(MouseEvent.CLICK,onTitleClickHandler);
         }
      }
      
      private function addEvent() : void
      {
         close_btn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         bg_mc.addEventListener(MouseEvent.MOUSE_DOWN,onBgDownHandler);
         for(var i1:int = 1; i1 < 4; i1++)
         {
            main_mc["mc" + i1].buttonMode = true;
            main_mc["mc" + i1]["mask_mc"].visible = false;
            main_mc["mc" + i1].addEventListener(MouseEvent.CLICK,onTitleClickHandler);
         }
      }
      
      public function destroy() : void
      {
         hide();
         main_mc = null;
         bg_mc = null;
         close_btn = null;
         currentObj = null;
         info_a = null;
         if(power_mc)
         {
            power_mc = null;
         }
      }
      
      private function onTitleClickHandler(e:MouseEvent) : void
      {
         var ind:uint = 0;
         var index:String = e.currentTarget.name.slice(2,e.currentTarget.name.length);
         var ss:String = String(currentObj.correct).slice(0,1);
         if(index == ss)
         {
            setError(false);
            if(currentObj.index == "3")
            {
               loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
               Alarm.show("身份验证通过,屏障解除");
            }
            else
            {
               ind = uint(currentObj.index);
               currentObj = info_a[ind];
               main_mc["c_mc"].visible = true;
               removeEvent();
               loop1 = setInterval(setTiHandler,1000);
            }
         }
         else
         {
            ++c_uint;
            setError(true);
            if(c_uint >= 2)
            {
               hide();
               Alarm.show("累积两次回答错误，无法进入");
               return;
            }
            power_mc = e.currentTarget as MovieClip;
            power_mc["mask_mc"].visible = true;
            removeEvent();
            loop = setInterval(setVisiblehandler,1000);
         }
      }
   }
}


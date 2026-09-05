package com.robot.module.task
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NewNoviceTaskChoicePetPanel extends Sprite implements IModule
   {
      
      private var _grassMC:MovieClip;
      
      private const NAME_A:Array = ["waterMC","fireMC","grassMC"];
      
      private const ID:uint = 86;
      
      private const PET_ID_A:Array = [7,1,4];
      
      private var _closeBtn:SimpleButton;
      
      private var _fireMC:MovieClip;
      
      private var _mainUI:NewNoviceChoicePet_MC;
      
      private var _waterMC:MovieClip;
      
      public function NewNoviceTaskChoicePetPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
         _closeBtn = null;
         _grassMC = null;
         _fireMC = null;
         _waterMC = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnHandler);
         DragManager.remove(_mainUI["dragMc"]);
         _grassMC.removeEventListener(MouseEvent.CLICK,onSelGrass);
         _fireMC.removeEventListener(MouseEvent.CLICK,onSelFireMC);
         _waterMC.removeEventListener(MouseEvent.CLICK,onSelWaterMC);
         for(var i1:int = 0; i1 < NAME_A.length; i1++)
         {
            _mainUI[NAME_A[i1]].removeEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
            _mainUI[NAME_A[i1]].removeEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
         }
      }
      
      private function onCloseBtnHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function onOutHandler(e:MouseEvent) : void
      {
         var mc:MovieClip = e.currentTarget as MovieClip;
         mc.gotoAndStop(1);
      }
      
      private function onSelFireMC(e:MouseEvent) : void
      {
         hide();
         SocketConnection.send(CommandID.COMPLETE_TASK,ID,2);
      }
      
      private function onSelWaterMC(e:MouseEvent) : void
      {
         hide();
         SocketConnection.send(CommandID.COMPLETE_TASK,ID,3);
      }
      
      private function onOverHandler(e:MouseEvent) : void
      {
         var mc:MovieClip = null;
         mc = e.currentTarget as MovieClip;
         mc.addEventListener(Event.ENTER_FRAME,function(e:Event):void
         {
            if(mc.totalFrames == mc.currentFrame)
            {
               mc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               mc.gotoAndStop(mc.totalFrames);
            }
         });
         mc.gotoAndPlay(2);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnHandler);
         DragManager.add(_mainUI["dragMc"],_mainUI);
         _grassMC.addEventListener(MouseEvent.CLICK,onSelGrass);
         _fireMC.addEventListener(MouseEvent.CLICK,onSelFireMC);
         _waterMC.addEventListener(MouseEvent.CLICK,onSelWaterMC);
         for(var i1:int = 0; i1 < NAME_A.length; i1++)
         {
            _mainUI[NAME_A[i1]].addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
            _mainUI[NAME_A[i1]].addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
         }
      }
      
      private function onSelGrass(e:MouseEvent) : void
      {
         hide();
         SocketConnection.send(CommandID.COMPLETE_TASK,ID,1);
      }
      
      public function setup() : void
      {
         _mainUI = new NewNoviceChoicePet_MC();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.visible = false;
         _grassMC = _mainUI["grassMC"];
         _grassMC.buttonMode = true;
         _grassMC.gotoAndStop(1);
         _fireMC = _mainUI["fireMC"];
         _fireMC.buttonMode = true;
         _fireMC.gotoAndStop(1);
         _waterMC = _mainUI["waterMC"];
         _waterMC.buttonMode = true;
         _waterMC.gotoAndStop(1);
      }
   }
}


package com.robot.module.app
{
   import com.robot.app.mapProcess.MapProcess_10036;
   import com.robot.core.manager.LevelManager;
   import com.robot.module.app.fortuneWheel.FrameDebug;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class WheelAnimateBoss extends Sprite implements IModule
   {
      
      private var _xmlClass:Class = WheelAnimateBoss__xmlClass;
      
      private var _panel:MainFortuneAnimate_boss;
      
      private var _type:int;
      
      private var _wheelXml:XML;
      
      private var _stage:int;
      
      public function WheelAnimateBoss()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panel);
         loaderInfo.sharedEvents.dispatchEvent(new Event("TURN_COMPLETE"));
      }
      
      public function show() : void
      {
         LevelManager.topLevel.addChild(_panel);
      }
      
      private function onButtonEnterFrame(e:Event) : void
      {
         FrameDebug.debug(_panel["button_mc"],[1]);
         var frame:int = int(_panel["button_mc"].currentFrame);
         if(frame == 13 || frame == 25 || frame == 37)
         {
            _panel["button_mc"]["cardResult"].addChild(getCard(_type));
            _panel["button_mc"]["cardResult"].width *= 1.2;
            _panel["button_mc"]["cardResult"].height *= 1.2;
            _panel["button_mc"].gotoAndPlay(38);
         }
         if(frame == 97)
         {
            _panel["button_mc"].removeEventListener(Event.ENTER_FRAME,onButtonEnterFrame);
            hide();
         }
      }
      
      private function getCard(index:int) : MovieClip
      {
         var mc:MovieClip = null;
         switch(index)
         {
            case 1:
               if(_stage == 9)
               {
                  mc = new card_boss_11();
               }
               else if(_stage == 19)
               {
                  mc = new card_boss_21();
               }
               else if(_stage == 29)
               {
                  mc = new card_boss_31();
               }
               else if(_stage == 39)
               {
                  mc = new card_boss_41();
               }
               return mc;
            case 2:
               if(_stage == 9)
               {
                  mc = new card_boss_12();
               }
               else if(_stage == 19)
               {
                  mc = new card_boss_22();
               }
               else if(_stage == 29)
               {
                  mc = new card_boss_32();
               }
               else if(_stage == 39)
               {
                  mc = new card_boss_42();
               }
               return mc;
            case 3:
               if(_stage == 9)
               {
                  mc = new card_boss_13();
               }
               else if(_stage == 19)
               {
                  mc = new card_boss_23();
               }
               else if(_stage == 29)
               {
                  mc = new card_boss_33();
               }
               else if(_stage == 39)
               {
                  mc = new card_boss_43();
               }
               return mc;
            default:
               return null;
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _stage = MapProcess_10036._stage;
         _type = MapProcess_10036._difficult;
         _wheelXml = XML(new _xmlClass()).children()[_stage];
         _panel = new MainFortuneAnimate_boss();
         _panel["normal_mc"].addEventListener(Event.ENTER_FRAME,onNormalEnterFrame);
      }
      
      private function removeEvent() : void
      {
         _panel["button_mc"]["btn_1"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_2"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_3"].removeEventListener(MouseEvent.CLICK,onCardClick);
      }
      
      private function onCardClick(e:MouseEvent) : void
      {
         switch(e.currentTarget.name)
         {
            case "btn_1":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(2);
               break;
            case "btn_2":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(14);
               break;
            case "btn_3":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(26);
         }
      }
      
      private function onPanelEnterFrame(e:Event) : void
      {
         if(_panel.currentFrame == 2)
         {
            _panel["button_mc"].gotoAndStop(1);
            _panel.removeEventListener(Event.ENTER_FRAME,onPanelEnterFrame);
            _panel["button_mc"].addEventListener(Event.ENTER_FRAME,onButtonEnterFrame);
            _panel["button_mc"]["btn_1"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_2"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_3"].addEventListener(MouseEvent.CLICK,onCardClick);
         }
      }
      
      private function onNormalEnterFrame(e:Event) : void
      {
         var len:int = 0;
         var i:int = 0;
         FrameDebug.debug(_panel["normal_mc"]);
         if(_panel["normal_mc"].currentFrame == 49)
         {
            _panel["normal_mc"]["cardContainer"].addChild(getCard(_wheelXml.@one));
            _panel["normal_mc"]["cardContainer"].addChild(getCard(_wheelXml.@two));
            _panel["normal_mc"]["cardContainer"].addChild(getCard(_wheelXml.@three));
            for(len = int(_panel["normal_mc"]["cardContainer"].numChildren); i < len; )
            {
               _panel["normal_mc"]["cardContainer"].getChildAt(i).x = i * 200;
               i++;
            }
         }
         if(_panel["normal_mc"].currentFrame == _panel["normal_mc"].totalFrames)
         {
            _panel["normal_mc"].removeEventListener(Event.ENTER_FRAME,onNormalEnterFrame);
            _panel.addEventListener(Event.ENTER_FRAME,onPanelEnterFrame);
            _panel.gotoAndStop(2);
         }
      }
   }
}


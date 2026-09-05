package com.robot.module.app
{
   import com.robot.app.mapProcess.MapProcess_10037;
   import com.robot.core.manager.LevelManager;
   import com.robot.module.app.fortuneWheel.FrameDebug;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class WheelAnimateMystery extends Sprite implements IModule
   {
      
      private var _panel:MainFortuneAnimate_mystery;
      
      private var _type:int;
      
      public function WheelAnimateMystery()
      {
         super();
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
               break;
            case "btn_4":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(38);
               break;
            case "btn_5":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(50);
               break;
            case "btn_6":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(62);
               break;
            case "btn_7":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(74);
               break;
            case "btn_8":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(86);
               break;
            case "btn_9":
               removeEvent();
               _panel["button_mc"].gotoAndPlay(98);
         }
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
      
      public function setup() : void
      {
         _panel = new MainFortuneAnimate_mystery();
         _panel["normal_mc"].addEventListener(Event.ENTER_FRAME,onNormalEnterFrame);
      }
      
      private function onButtonEnterFrame(e:Event) : void
      {
         FrameDebug.debug(_panel["button_mc"],[1]);
         var frame:int = int(_panel["button_mc"].currentFrame);
         if(frame == 13 || frame == 25 || frame == 37 || frame == 49 || frame == 61 || frame == 73 || frame == 85 || frame == 97 || frame == 109)
         {
            if(MapProcess_10037._type == 2)
            {
               switch(MapProcess_10037._monID[0])
               {
                  case 409:
                     _panel["button_mc"]["cardResult"].addChild(getCard(1));
                     break;
                  case 442:
                     _panel["button_mc"]["cardResult"].addChild(getCard(2));
                     break;
                  case 164:
                     _panel["button_mc"]["cardResult"].addChild(getCard(3));
                     break;
                  case 284:
                     _panel["button_mc"]["cardResult"].addChild(getCard(4));
               }
            }
            else if(MapProcess_10037._type == 3)
            {
               _panel["button_mc"]["cardResult"].addChild(getCard(5));
            }
            _panel["button_mc"]["cardResult"].width *= 1.4;
            _panel["button_mc"]["cardResult"].height *= 1.4;
            _panel["button_mc"].gotoAndPlay(110);
         }
         if(frame == 169)
         {
            _panel["button_mc"].removeEventListener(Event.ENTER_FRAME,onButtonEnterFrame);
            hide();
         }
      }
      
      public function show() : void
      {
         LevelManager.topLevel.addChild(_panel);
      }
      
      private function getCard(index:int) : MovieClip
      {
         var mc:MovieClip = null;
         switch(index)
         {
            case 1:
               return new card_mystery_1();
            case 2:
               return new card_mystery_2();
            case 3:
               return new card_mystery_3();
            case 4:
               return new card_mystery_4();
            case 5:
               return new card_mystery_5();
            default:
               return null;
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         _panel["button_mc"]["btn_1"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_2"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_3"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_4"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_5"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_6"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_7"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_8"].removeEventListener(MouseEvent.CLICK,onCardClick);
         _panel["button_mc"]["btn_9"].removeEventListener(MouseEvent.CLICK,onCardClick);
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
            _panel["button_mc"]["btn_4"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_5"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_6"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_7"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_8"].addEventListener(MouseEvent.CLICK,onCardClick);
            _panel["button_mc"]["btn_9"].addEventListener(MouseEvent.CLICK,onCardClick);
         }
      }
      
      private function onNormalEnterFrame(e:Event) : void
      {
         FrameDebug.debug(_panel["normal_mc"]);
         if(_panel["normal_mc"].currentFrame == _panel["normal_mc"].totalFrames)
         {
            _panel["normal_mc"].removeEventListener(Event.ENTER_FRAME,onNormalEnterFrame);
            _panel.addEventListener(Event.ENTER_FRAME,onPanelEnterFrame);
            _panel.gotoAndStop(2);
         }
      }
   }
}


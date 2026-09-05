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
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class WheelAnimate extends Sprite implements IModule
   {
      
      private var _type:int;
      
      private var _panel:MainFortuneAnimate;
      
      public function WheelAnimate()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         this._type = MapProcess_10036._type;
         this._panel = new MainFortuneAnimate();
         this._panel["normal_mc"].addEventListener(Event.ENTER_FRAME,this.onNormalEnterFrame);
      }
      
      private function onNormalEnterFrame(e:Event) : void
      {
         var j:int = 0;
         var len:int = 0;
         var i:int = 0;
         FrameDebug.debug(this._panel["normal_mc"]);
         if(this._panel["normal_mc"].currentFrame == 49)
         {
            for(j = 0; j < 6; j++)
            {
               this._panel["normal_mc"]["cardContainer"].addChild(this.getCard(MapProcess_10036._cards[j]));
            }
            for(len = int(this._panel["normal_mc"]["cardContainer"].numChildren); i < len; )
            {
               this._panel["normal_mc"]["cardContainer"].getChildAt(i).x = i * 140;
               i++;
            }
         }
         if(this._panel["normal_mc"].currentFrame == this._panel["normal_mc"].totalFrames)
         {
            this._panel["normal_mc"].removeEventListener(Event.ENTER_FRAME,this.onNormalEnterFrame);
            this._panel.addEventListener(Event.ENTER_FRAME,this.onPanelEnterFrame);
            this._panel.gotoAndStop(2);
         }
      }
      
      private function onPanelEnterFrame(e:Event) : void
      {
         if(this._panel.currentFrame == 2)
         {
            this._panel["button_mc"].gotoAndStop(1);
            this._panel.removeEventListener(Event.ENTER_FRAME,this.onPanelEnterFrame);
            this._panel["button_mc"].addEventListener(Event.ENTER_FRAME,this.onButtonEnterFrame);
            this._panel["button_mc"]["btn_1"].addEventListener(MouseEvent.CLICK,this.onCardClick);
            this._panel["button_mc"]["btn_2"].addEventListener(MouseEvent.CLICK,this.onCardClick);
            this._panel["button_mc"]["btn_3"].addEventListener(MouseEvent.CLICK,this.onCardClick);
            this._panel["button_mc"]["btn_4"].addEventListener(MouseEvent.CLICK,this.onCardClick);
            this._panel["button_mc"]["btn_5"].addEventListener(MouseEvent.CLICK,this.onCardClick);
            this._panel["button_mc"]["btn_6"].addEventListener(MouseEvent.CLICK,this.onCardClick);
         }
      }
      
      private function onButtonEnterFrame(e:Event) : void
      {
         FrameDebug.debug(this._panel["button_mc"],[1]);
         var frame:int = int(this._panel["button_mc"].currentFrame);
         if(frame == 13 || frame == 25 || frame == 37 || frame == 49 || frame == 61 || frame == 73)
         {
            this._panel["button_mc"]["cardResult"].addChild(this.getCard(this._type));
            this._panel["button_mc"]["cardResult"].width *= 1.2;
            this._panel["button_mc"]["cardResult"].height *= 1.2;
            this._panel["button_mc"].gotoAndPlay(74);
         }
         if(frame == 133)
         {
            this._panel["button_mc"].removeEventListener(Event.ENTER_FRAME,this.onButtonEnterFrame);
            this.hide();
         }
      }
      
      private function onCardClick(e:MouseEvent) : void
      {
         switch(e.currentTarget.name)
         {
            case "btn_1":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(2);
               break;
            case "btn_2":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(14);
               break;
            case "btn_3":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(26);
               break;
            case "btn_4":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(38);
               break;
            case "btn_5":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(50);
               break;
            case "btn_6":
               this.removeEvent();
               this._panel["button_mc"].gotoAndPlay(62);
         }
      }
      
      private function removeEvent() : void
      {
         this._panel["button_mc"]["btn_1"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
         this._panel["button_mc"]["btn_2"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
         this._panel["button_mc"]["btn_3"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
         this._panel["button_mc"]["btn_4"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
         this._panel["button_mc"]["btn_5"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
         this._panel["button_mc"]["btn_6"].removeEventListener(MouseEvent.CLICK,this.onCardClick);
      }
      
      private function getCard(index:int) : MovieClip
      {
         var mc:MovieClip = null;
         switch(index)
         {
            case 1:
               return new card_1();
            case 2:
               return new card_2();
            case 3:
               return new card_3();
            case 4:
               return new card_4();
            case 5:
               return new card_5();
            case 6:
               return new card_6();
            case 7:
               return new card_7();
            case 8:
               return new card_8();
            case 9:
               return new card_9();
            case 10:
               return new card_10();
            case 11:
               return new card_11();
            case 12:
               return new card_12();
            default:
               return new card_12();
         }
      }
      
      public function show() : void
      {
         LevelManager.topLevel.addChild(this._panel);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._panel);
         loaderInfo.sharedEvents.dispatchEvent(new Event("TURN_COMPLETE"));
      }
      
      public function destroy() : void
      {
         this.hide();
      }
   }
}


package com.game
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class Game extends MovieClip
   {
      
      private var boat:Boat;
      
      public var life_mc:MovieClip;
      
      private var time:Timer;
      
      private var ok_btn:SimpleButton;
      
      private var help_mc:MovieClip;
      
      private var close_btn:SimpleButton;
      
      private var downMc:DownMc;
      
      private var timeNum:int = 90;
      
      private var text:TextField;
      
      private var gameBack:MovieClip;
      
      public function Game()
      {
         super();
         this.addEventListener(Event.ADDED_TO_STAGE,init);
      }
      
      private function hitBoat(e:Event) : void
      {
         life_mc.nextFrame();
         if(life_mc.currentFrame == 11)
         {
            gameLost();
         }
      }
      
      public function destroy() : void
      {
         time.removeEventListener(TimerEvent.TIMER,timeEventHandler);
         time = null;
         close_btn.removeEventListener(MouseEvent.CLICK,closeClickHandler);
         stage.removeEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         stage.removeEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
         if(downMc)
         {
            downMc.destroy();
         }
         if(boat)
         {
            boat.destroy();
         }
         close_btn = null;
         ok_btn = null;
         life_mc = null;
         help_mc = null;
         gameBack = null;
         downMc = null;
         boat = null;
      }
      
      private function init(e:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,init);
         gameBack = new GameUI_game();
         addChild(gameBack);
         help_mc = gameBack["help_mc"];
         ok_btn = help_mc["ok_btn"];
         life_mc = gameBack["life_mc"];
         close_btn = gameBack["close_btn"];
         text = gameBack["time_txt"];
         text.text = String(timeNum);
         life_mc.gotoAndStop(1);
         time = new Timer(1000,91);
         ok_btn.addEventListener(MouseEvent.CLICK,okClickHandler);
         close_btn.addEventListener(MouseEvent.CLICK,closeClickHandler);
      }
      
      private function keyUpHandler(e:KeyboardEvent) : void
      {
         switch(e.keyCode)
         {
            case 37:
               boat.isRight = false;
               break;
            case 38:
               boat.isUp = false;
               break;
            case 39:
               boat.isLeft = false;
               break;
            case 40:
               boat.isDown = false;
               break;
            case 32:
               boat.isDown = false;
         }
      }
      
      private function timeOver(e:Event) : void
      {
         time.stop();
      }
      
      public function enterFrameHandler() : void
      {
         if(boat)
         {
            boat.enterFrameHandler();
         }
      }
      
      private function okClickHandler(e:MouseEvent) : void
      {
         ok_btn.removeEventListener(MouseEvent.CLICK,okClickHandler);
         help_mc.visible = false;
         time.start();
         time.addEventListener(TimerEvent.TIMER,timeEventHandler);
         startG();
      }
      
      private function gameWin(e:Event) : void
      {
         this.dispatchEvent(new Event("gamewin"));
         time.stop();
      }
      
      private function startG() : void
      {
         downMc = new DownMc();
         addChild(downMc);
         boat = new Boat(downMc.getArray());
         addChild(boat);
         stage.addEventListener(KeyboardEvent.KEY_DOWN,keyDownHandler);
         stage.addEventListener(KeyboardEvent.KEY_UP,keyUpHandler);
         boat.addEventListener("gameover",gameWin);
         boat.addEventListener("hitboat",hitBoat);
         boat.addEventListener("timeover",timeOver);
      }
      
      private function keyDownHandler(e:KeyboardEvent) : void
      {
         switch(e.keyCode)
         {
            case 37:
               boat.isRight = true;
               break;
            case 38:
               boat.isUp = true;
               break;
            case 39:
               boat.isLeft = true;
               break;
            case 40:
               boat.isDown = true;
               break;
            case 32:
               boat.isDown = true;
         }
      }
      
      private function gameLost() : void
      {
         this.dispatchEvent(new Event("gameLost"));
         time.stop();
      }
      
      private function closeClickHandler(e:MouseEvent = null) : void
      {
         this.dispatchEvent(new Event("closegame"));
         time.stop();
      }
      
      private function timeEventHandler(e:TimerEvent) : void
      {
         if(timeNum == 0)
         {
            gameLost();
            return;
         }
         --timeNum;
         text.text = String(timeNum);
      }
   }
}


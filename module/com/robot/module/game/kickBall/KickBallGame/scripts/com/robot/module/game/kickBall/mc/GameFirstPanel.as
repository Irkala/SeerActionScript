package com.robot.module.game.kickBall.mc
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class GameFirstPanel extends MovieClip
   {
      
      public static const GAME_START:String = "gameStart";
      
      public static const GAME_OUT:String = "gameOut";
      
      private var panel:MovieClip;
      
      private var out_btn:SimpleButton;
      
      private var start_btn:SimpleButton;
      
      public function GameFirstPanel()
      {
         super();
         initPanel();
      }
      
      private function clickStartHandler(e:MouseEvent) : void
      {
         dispatchEvent(new Event(GAME_START));
      }
      
      private function clickOutHandler(e:MouseEvent) : void
      {
         dispatchEvent(new Event(GAME_OUT));
      }
      
      public function destroy() : void
      {
         removeChild(panel);
         start_btn.removeEventListener(MouseEvent.CLICK,clickStartHandler);
         out_btn.removeEventListener(MouseEvent.CLICK,clickOutHandler);
         start_btn = null;
         out_btn = null;
         panel = null;
      }
      
      private function initPanel() : void
      {
         panel = new KickBallGame_start();
         addChild(panel);
         start_btn = panel["start_btn"];
         out_btn = panel["out_btn"];
         start_btn.addEventListener(MouseEvent.CLICK,clickStartHandler);
         out_btn.addEventListener(MouseEvent.CLICK,clickOutHandler);
      }
   }
}


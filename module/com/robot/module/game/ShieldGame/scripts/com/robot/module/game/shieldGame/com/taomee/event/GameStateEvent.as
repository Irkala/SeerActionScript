package com.robot.module.game.shieldGame.com.taomee.event
{
   import flash.events.Event;
   
   public class GameStateEvent extends Event
   {
      
      public var gameScore:uint;
      
      public var finishState:Number;
      
      public function GameStateEvent(type:String, state:Number, score:uint, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         this.finishState = state;
         this.gameScore = score;
         super(type,bubbles,cancelable);
      }
   }
}


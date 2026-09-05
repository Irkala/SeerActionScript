package com.robot.module.game.plantsVsZombies.event
{
   import flash.events.Event;
   
   public class SunshineEvent extends Event
   {
      
      public static const COLLECT:String = "collect";
      
      private var _power:uint;
      
      public function SunshineEvent(type:String, power:int = 25, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         this._power = power;
      }
      
      public function get power() : int
      {
         return _power;
      }
   }
}


package com.robot.module.game.plantsVsZombies.event
{
   import flash.events.Event;
   
   public class PlantsEvent extends Event
   {
      
      public static const DIE:String = "die";
      
      public function PlantsEvent(type:String, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
      }
   }
}


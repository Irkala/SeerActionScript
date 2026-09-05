package com.robot.module.game.plantsVsZombies.event
{
   import com.robot.module.game.plantsVsZombies.card.BasePlantsCard;
   import flash.events.Event;
   
   public class DragEvent extends Event
   {
      
      public static const DRAG_OVER:String = "dragOver";
      
      private var _card:BasePlantsCard;
      
      public function DragEvent(type:String, card:BasePlantsCard, bubbles:Boolean = false, cancelable:Boolean = false)
      {
         super(type,bubbles,cancelable);
         _card = card;
      }
      
      public function get card() : BasePlantsCard
      {
         return _card;
      }
   }
}


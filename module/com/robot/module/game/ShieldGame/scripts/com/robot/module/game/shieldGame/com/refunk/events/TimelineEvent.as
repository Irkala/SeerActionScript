package com.robot.module.game.shieldGame.com.refunk.events
{
   import flash.events.Event;
   
   public class TimelineEvent extends Event
   {
      
      public static const LABEL_REACHED:String = "labelReached";
      
      public static const END_REACHED:String = "endReached";
      
      private var _currentFrame:int;
      
      private var _currentLabel:String;
      
      public function TimelineEvent(type:String, currentFrame:int = 0, currentLabel:String = null)
      {
         super(type);
         _currentFrame = currentFrame;
         _currentLabel = currentLabel;
      }
      
      public function get currentLabel() : String
      {
         return _currentLabel;
      }
      
      public function get currentFrame() : int
      {
         return _currentFrame;
      }
      
      override public function toString() : String
      {
         return formatToString("TimelineEvent","type","bubbles","cancelable","eventPhase","currentFrame","currentLabel");
      }
      
      override public function clone() : Event
      {
         return new TimelineEvent(type,_currentFrame,_currentLabel);
      }
   }
}


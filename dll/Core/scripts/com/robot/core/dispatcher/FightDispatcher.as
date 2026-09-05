package com.robot.core.dispatcher
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class FightDispatcher
   {
      
      private static var _dispatcher:EventDispatcher = new EventDispatcher();
      
      public function FightDispatcher()
      {
         super();
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         _dispatcher.addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         _dispatcher.removeEventListener(type,listener,useCapture);
      }
      
      public static function dispatchEvent(event:Event) : Boolean
      {
         return _dispatcher.dispatchEvent(event);
      }
   }
}


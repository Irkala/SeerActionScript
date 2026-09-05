package
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class EventManager
   {
      
      private static var instance:EventDispatcher;
      
      public static const CREATE_COMPLETE:String = "createComplete";
      
      private static var isSingle:Boolean = false;
      
      public function EventManager()
      {
         super();
         if(!isSingle)
         {
            throw new Error("EventManager为单例模式，不能直接创建");
         }
      }
      
      public static function dispatchEvent(event:Event) : void
      {
         getInstance().dispatchEvent(event);
      }
      
      public static function willTrigger(type:String) : Boolean
      {
         return getInstance().willTrigger(type);
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         getInstance().removeEventListener(type,listener,useCapture);
      }
      
      private static function getInstance() : EventDispatcher
      {
         if(instance == null)
         {
            isSingle = true;
            instance = new EventDispatcher();
         }
         isSingle = false;
         return instance;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         getInstance().addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return getInstance().hasEventListener(type);
      }
   }
}


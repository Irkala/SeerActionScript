package com.robot.core.utils
{
   import org.taomee.ds.HashMap;
   
   public class ObserverManager
   {
      
      private static var hashMap:HashMap;
      
      public function ObserverManager()
      {
         super();
      }
      
      public static function delObserver(subject:GameSubject, ob:IGameObserver) : void
      {
         var index:int = 0;
         var array:Array = hashMap.getValue(subject) as Array;
         if(array)
         {
            index = array.indexOf(ob);
            if(index != -1)
            {
               array.splice(index,1);
            }
         }
      }
      
      public static function getObserverAtIndex(subject:GameSubject, index:uint) : IGameObserver
      {
         var array:Array = hashMap.getValue(subject) as Array;
         if(array)
         {
            return array[index];
         }
         return null;
      }
      
      public static function addObserver(subject:GameSubject, ob:IGameObserver) : void
      {
         var array:Array = hashMap.getValue(subject) as Array;
         if(array)
         {
            array.push(ob);
         }
      }
      
      public static function destroyCollection(subject:GameSubject) : void
      {
         hashMap.remove(subject);
      }
      
      public static function createCollection(subject:GameSubject) : Array
      {
         if(!hashMap)
         {
            hashMap = new HashMap();
         }
         var array:Array = [];
         hashMap.add(subject,array);
         return array;
      }
   }
}


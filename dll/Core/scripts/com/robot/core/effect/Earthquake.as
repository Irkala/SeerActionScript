package com.robot.core.effect
{
   import flash.display.DisplayObject;
   
   public class Earthquake
   {
      
      public function Earthquake()
      {
         super();
      }
      
      public static function go(target:DisplayObject, offset:int = 20, repeat:int = 1, complete:Function = null) : void
      {
         if(complete != null)
         {
            complete();
         }
      }
   }
}


package com.robot.app2.mapProcess.control
{
   import com.robot.core.manager.map.config.BaseMapProcess;
   
   public class EarlSerraController
   {
      
      private static var _map:BaseMapProcess;
      
      public function EarlSerraController()
      {
         super();
      }
      
      public static function initMap(param1:BaseMapProcess) : void
      {
         _map = param1;
      }
      
      public static function clickEquip1() : void
      {
      }
      
      public static function clickEquip2() : void
      {
      }
      
      public static function destroy() : void
      {
         _map = null;
      }
   }
}


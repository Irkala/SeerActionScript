package com.robot.core
{
   internal class UIComponentGlobals
   {
      
      private static var _layoutManager:UILayoutManager;
      
      public function UIComponentGlobals()
      {
         super();
      }
      
      internal static function get layoutManager() : UILayoutManager
      {
         if(_layoutManager == null)
         {
            _layoutManager = new UILayoutManager();
         }
         return _layoutManager;
      }
   }
}


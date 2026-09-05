package com.robot.module.app.spriteFusion
{
   import com.robot.core.info.userItem.SingleItemInfo;
   
   public class ElementItemInfo
   {
      
      private var _num:int;
      
      private var _info:SingleItemInfo;
      
      public function ElementItemInfo()
      {
         super();
      }
      
      public function get num() : int
      {
         return _num;
      }
      
      public function set num(n:int) : void
      {
         _num = n;
      }
      
      public function set info(i:SingleItemInfo) : void
      {
         _info = i;
      }
      
      public function get info() : SingleItemInfo
      {
         return _info;
      }
   }
}


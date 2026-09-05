package com.robot.module.app.fightExchange.mode
{
   public class ExChangeItemSuccessInfo
   {
      
      private var _itemID:int;
      
      private var _itemCnt:int;
      
      private var _topHonor:int;
      
      public function ExChangeItemSuccessInfo(param1:int, param2:int, param3:int)
      {
         super();
         this._itemID = param1;
         this._itemCnt = param2;
         this._topHonor = param3;
      }
      
      public function get itemID() : int
      {
         return this._itemID;
      }
      
      public function set itemID(param1:int) : void
      {
         this._itemID = param1;
      }
      
      public function get itemCnt() : int
      {
         return this._itemCnt;
      }
      
      public function set itemCnt(param1:int) : void
      {
         this._itemCnt = param1;
      }
      
      public function get topHonor() : int
      {
         return this._topHonor;
      }
      
      public function set topHonor(param1:int) : void
      {
         this._topHonor = param1;
      }
   }
}


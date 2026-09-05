package com.robot.module.app.fightExchange.mode
{
   public class ExchangeCategoryData
   {
      
      private var _catoryName:String;
      
      private var _childrenItems:Array;
      
      public function ExchangeCategoryData()
      {
         super();
         this._catoryName = "";
         this._childrenItems = [];
      }
      
      public function get childrenItems() : Array
      {
         return this._childrenItems;
      }
      
      public function set childrenItems(param1:Array) : void
      {
         this._childrenItems = param1;
      }
      
      public function get catoryName() : String
      {
         return this._catoryName;
      }
      
      public function set catoryName(param1:String) : void
      {
         this._catoryName = param1;
      }
   }
}


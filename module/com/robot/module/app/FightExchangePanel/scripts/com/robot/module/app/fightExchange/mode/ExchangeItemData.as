package com.robot.module.app.fightExchange.mode
{
   public class ExchangeItemData
   {
      
      private var _exchangeID:uint;
      
      private var _itemID:uint;
      
      private var _price:uint;
      
      private var _type:uint;
      
      private var _isFitment:Boolean;
      
      private var _maxExchange:uint;
      
      private var _curExchange:uint = 0;
      
      public function ExchangeItemData(param1:XML)
      {
         super();
         if(Boolean(param1))
         {
            this._exchangeID = param1.@ID;
            this._itemID = param1.@ItemID;
            this._price = param1.@NeedHonour;
            this._type = param1.@type;
            if(Boolean(param1.hasOwnProperty("@isFitment")))
            {
               this._isFitment = Boolean(uint(param1.@isFitment));
            }
            else
            {
               this._isFitment = false;
            }
            this._maxExchange = param1.@MaxExchange;
         }
      }
      
      public function get curExchange() : uint
      {
         return this._curExchange;
      }
      
      public function set curExchange(param1:uint) : void
      {
         this._curExchange = param1;
      }
      
      public function get maxExchange() : uint
      {
         return this._maxExchange;
      }
      
      public function set maxExchange(param1:uint) : void
      {
         this._maxExchange = param1;
      }
      
      public function get isFitment() : Boolean
      {
         return this._isFitment;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function set type(param1:uint) : void
      {
         this._type = param1;
      }
      
      public function get price() : uint
      {
         return this._price;
      }
      
      public function set price(param1:uint) : void
      {
         this._price = param1;
      }
      
      public function get itemID() : uint
      {
         return this._itemID;
      }
      
      public function set itemID(param1:uint) : void
      {
         this._itemID = param1;
      }
      
      public function get exchangeID() : uint
      {
         return this._exchangeID;
      }
      
      public function set exchangeID(param1:uint) : void
      {
         this._exchangeID = param1;
      }
   }
}


package com.robot.core
{
   import flash.events.EventDispatcher;
   
   public class DataProvider extends EventDispatcher
   {
      
      private var array:Array = [];
      
      private var _data:Object;
      
      public function DataProvider(param1:Object = null)
      {
         super();
         this.data = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         if(this._data != param1)
         {
            this._data = param1;
            if(this._data is Array)
            {
               this.array = this._data as Array;
            }
         }
      }
      
      public function get rowCount() : int
      {
         return this.array.length;
      }
      
      public function GetData(param1:int, param2:int = 0) : Object
      {
         if(this.array[param1] is Array)
         {
            return this.array[param1][param2];
         }
         return this.array[param1];
      }
      
      public function GetDataHasValue(param1:String, param2:Object) : Object
      {
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.rowCount)
         {
            if(this.array[_loc3_][param1] == param2)
            {
               return this.array[_loc3_];
            }
            _loc3_++;
         }
         return null;
      }
      
      public function GetRowIndexByData(param1:Object) : int
      {
         var _loc2_:int = 0;
         _loc2_ = 0;
         while(_loc2_ < this.rowCount)
         {
            if(this.array[_loc2_] == param1)
            {
               return _loc2_;
            }
            _loc2_++;
         }
         return -1;
      }
      
      public function GetRow(param1:int) : Object
      {
         return this.array[param1];
      }
   }
}


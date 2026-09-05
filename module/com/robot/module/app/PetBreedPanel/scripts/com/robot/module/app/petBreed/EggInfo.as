package com.robot.module.app.petBreed
{
   import flash.utils.IDataInput;
   
   public class EggInfo
   {
      
      private var _ownerID:uint;
      
      private var _eggCatchTime:uint;
      
      private var _eggID:uint;
      
      public function EggInfo(param1:IDataInput)
      {
         super();
         this._ownerID = param1.readUnsignedInt();
         this._eggCatchTime = param1.readUnsignedInt();
         this._eggID = param1.readUnsignedInt();
      }
      
      public function get eggID() : uint
      {
         return this._eggID;
      }
      
      public function set eggID(param1:uint) : void
      {
         this._eggID = param1;
      }
      
      public function get ownerID() : uint
      {
         return this._ownerID;
      }
      
      public function set ownerID(param1:uint) : void
      {
         this._ownerID = param1;
      }
      
      public function get eggCatchTime() : uint
      {
         return this._eggCatchTime;
      }
      
      public function set eggCatchTime(param1:uint) : void
      {
         this._eggCatchTime = param1;
      }
   }
}


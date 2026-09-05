package com.robot.core.info.fightInfo
{
   import flash.utils.IDataInput;
   
   public class CatchPetInfo
   {
      
      private var _catchTime:uint;
      
      private var _petID:uint;
      
      private var _shiny:uint;
      
      public function CatchPetInfo(param1:IDataInput)
      {
         super();
         this._catchTime = param1.readUnsignedInt();
         this._petID = param1.readUnsignedInt();
         if(param1.bytesAvailable >= 4)
         {
            this._shiny = param1.readUnsignedInt();
         }
      }
      
      public function get catchTime() : uint
      {
         return this._catchTime;
      }
      
      public function get petID() : uint
      {
         return this._petID;
      }
      
      public function get shiny() : uint
      {
         return this._shiny;
      }
   }
}


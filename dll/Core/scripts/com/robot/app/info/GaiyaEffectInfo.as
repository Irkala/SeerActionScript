package com.robot.app.info
{
   import flash.utils.IDataInput;
   
   public class GaiyaEffectInfo
   {
      
      public var defEffectID:uint;
      
      public var effects:Array;
      
      public function GaiyaEffectInfo(param1:IDataInput = null)
      {
         super();
         this.effects = [];
         if(param1)
         {
            this.defEffectID = param1.readUnsignedInt();
            var _loc2_:uint = uint(param1.readUnsignedInt());
            var _loc3_:uint = 0;
            while(_loc3_ < _loc2_)
            {
               this.effects.push(param1.readUnsignedInt());
               _loc3_++;
            }
         }
      }
   }
}


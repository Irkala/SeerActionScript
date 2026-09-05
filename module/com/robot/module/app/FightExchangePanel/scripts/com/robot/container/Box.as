package com.robot.container
{
   import com.robot.core.Container;
   import flash.display.DisplayObject;
   
   public class Box extends Container
   {
      
      private var _horizontalGap:uint = 0;
      
      private var _verticalGap:uint = 0;
      
      private var _direction:String = "vertical";
      
      public function Box()
      {
         super();
      }
      
      public function get verticalGap() : uint
      {
         return this._verticalGap;
      }
      
      public function set verticalGap(param1:uint) : void
      {
         this._verticalGap = param1;
         InvalidateDisplayList();
      }
      
      public function get horizontalGap() : uint
      {
         return this._horizontalGap;
      }
      
      public function set horizontalGap(param1:uint) : void
      {
         this._horizontalGap = param1;
         InvalidateDisplayList();
      }
      
      public function set direction(param1:String) : void
      {
         if(this._direction == param1)
         {
            return;
         }
         this._direction = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         var _loc7_:Number = NaN;
         if(invalidateDisplayListFlag)
         {
            _loc2_ = 0;
            _loc3_ = int(this.horizontalGap);
            _loc4_ = int(this.verticalGap);
            _loc5_ = this.numChildren;
            if(this.direction == BoxDirection.VERTICAL)
            {
               _loc1_ = 0;
               while(_loc1_ < _loc5_)
               {
                  _loc6_ = this.getChildAt(_loc1_);
                  _loc6_.x = 0;
                  _loc6_.y = _loc2_ + _loc4_;
                  _loc2_ = _loc6_.y + _loc6_.height;
                  _loc1_++;
               }
            }
            else if(this.direction == BoxDirection.HORIZONTAL)
            {
               _loc7_ = this.width / _loc5_;
               _loc1_ = 0;
               while(_loc1_ < _loc5_)
               {
                  _loc6_ = this.getChildAt(_loc1_);
                  _loc6_.x = _loc2_ + _loc3_;
                  _loc6_.y = 0;
                  if(this.liquidLayout)
                  {
                     _loc6_.width = _loc7_;
                  }
                  _loc2_ = _loc6_.x + _loc6_.width;
                  trace(_loc6_.name + "\t" + _loc6_.width + "\t" + this.width + "\t******");
                  _loc1_++;
               }
               trace(this.width + "\t&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
            }
         }
         super.ValidateDisplayList();
      }
   }
}


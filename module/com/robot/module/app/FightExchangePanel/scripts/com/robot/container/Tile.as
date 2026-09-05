package com.robot.container
{
   import com.robot.core.Container;
   import flash.display.DisplayObject;
   
   public class Tile extends Container
   {
      
      private var _horizontalGap:uint = 10;
      
      private var _verticalGap:uint = 10;
      
      private var _direction:String = "horizontal";
      
      private var _tileHeight:int;
      
      protected var $tileHeight:int;
      
      private var _tileWidth:int;
      
      protected var $tileWidth:int;
      
      private var _rowCount:int;
      
      protected var $rowCount:int;
      
      private var _columnCount:int;
      
      protected var $columnCount:int;
      
      public function Tile()
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
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get tileHeight() : int
      {
         return this._tileHeight;
      }
      
      public function set tileHeight(param1:int) : void
      {
         if(this._tileHeight == param1)
         {
            return;
         }
         this._tileHeight = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get tileWidth() : int
      {
         return this._tileWidth;
      }
      
      public function set tileWidth(param1:int) : void
      {
         if(this._tileWidth == param1)
         {
            return;
         }
         this._tileWidth = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get rowCount() : int
      {
         return this._rowCount;
      }
      
      public function set rowCount(param1:int) : void
      {
         if(this._rowCount == param1)
         {
            return;
         }
         this._rowCount = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      public function get columnCount() : int
      {
         return this._columnCount;
      }
      
      public function set columnCount(param1:int) : void
      {
         if(this._columnCount == param1)
         {
            return;
         }
         this._columnCount = param1;
         InvalidateSize();
         InvalidateDisplayList();
      }
      
      override public function ValidateSize() : void
      {
         var _loc1_:Boolean = false;
         var _loc2_:Boolean = false;
         var _loc3_:Boolean = false;
         var _loc4_:Boolean = false;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:DisplayObject = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         if(invalidateSizeFlag)
         {
            _loc1_ = this.tileWidth > 0;
            _loc2_ = this.tileHeight > 0;
            if(_loc1_)
            {
               this.$tileWidth = this.tileWidth;
            }
            if(_loc2_)
            {
               this.$tileHeight = this.tileHeight;
            }
            if(!_loc1_ || !_loc2_)
            {
               _loc7_ = this.numChildren;
               _loc8_ = 0;
               while(_loc8_ < _loc7_)
               {
                  _loc9_ = this.getChildAt(_loc8_);
                  if(!_loc1_ && _loc9_.width > this.$tileWidth)
                  {
                     this.$tileWidth = _loc9_.width;
                  }
                  if(!_loc2_ && _loc9_.height > this.$tileHeight)
                  {
                     this.$tileHeight = _loc9_.height;
                  }
                  _loc8_++;
               }
            }
            _loc3_ = this.rowCount > 0;
            _loc4_ = this.columnCount > 0;
            _loc5_ = int(this.verticalGap);
            _loc6_ = int(this.horizontalGap);
            if(_loc3_)
            {
               this.$columnCount = this.rowCount;
            }
            else
            {
               _loc10_ = int((this.displayWidth + _loc5_) / (this.$tileWidth + _loc5_));
               this.$columnCount = _loc10_ > 1 ? _loc10_ : 1;
            }
            if(_loc4_)
            {
               this.$rowCount = this.columnCount;
            }
            else
            {
               _loc11_ = int((this.displayHeight + _loc6_) / (this.$tileHeight + _loc6_));
               this.$rowCount = _loc11_ > 1 ? _loc11_ : 1;
            }
         }
         super.ValidateSize();
      }
      
      override public function ValidateDisplayList() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:DisplayObject = null;
         if(invalidateDisplayListFlag)
         {
            _loc3_ = this.numChildren;
            _loc4_ = int(this.verticalGap);
            _loc5_ = int(this.horizontalGap);
            if(this.direction == TileDirection.HORIZONTAL)
            {
               _loc1_ = 0;
               _loc2_ = 0;
               while(_loc1_ * this.$columnCount + _loc2_ < _loc3_)
               {
                  _loc6_ = getChildAt(_loc1_ * this.$columnCount + _loc2_);
                  _loc6_.x = _loc2_ * (this.$tileWidth + _loc5_);
                  _loc6_.y = _loc1_ * (this.$tileHeight + _loc4_);
                  if(++_loc2_ == this.$columnCount)
                  {
                     _loc2_ = 0;
                     _loc1_++;
                  }
               }
            }
            else
            {
               _loc1_ = 0;
               _loc2_ = 0;
               while(_loc2_ * this.$rowCount + _loc1_ < _loc3_)
               {
                  _loc6_ = getChildAt(_loc2_ * this.$rowCount + _loc1_);
                  _loc6_.x = _loc2_ * (this.$tileWidth + _loc5_);
                  _loc6_.y = _loc1_ * (this.$tileHeight + _loc4_);
                  if(++_loc1_ == this.$rowCount)
                  {
                     _loc1_ = 0;
                     _loc2_++;
                  }
               }
            }
         }
         super.ValidateDisplayList();
      }
   }
}


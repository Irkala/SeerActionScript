package com.robot.container
{
   import com.robot.core.Container;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class ViewStack extends Container
   {
      
      private var _selectedIndex:int = -1;
      
      private var proposedSelectedIndex:int = -1;
      
      private var initialSelectedIndex:int = -1;
      
      public function ViewStack()
      {
         super();
      }
      
      public function get selectedChild() : Container
      {
         if(this.selectedIndex == -1)
         {
            return null;
         }
         return Container(getChildAt(this.selectedIndex));
      }
      
      public function set selectedChild(param1:Container) : void
      {
         var _loc2_:int = getChildIndex(DisplayObject(param1));
         if(_loc2_ >= 0 && _loc2_ < numChildren)
         {
            this.selectedIndex = _loc2_;
         }
      }
      
      public function get selectedIndex() : int
      {
         return this.proposedSelectedIndex == -1 ? this._selectedIndex : this.proposedSelectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(param1 == this.selectedIndex)
         {
            return;
         }
         this.proposedSelectedIndex = param1;
         InvalidateProperties();
         InvalidateDisplayList();
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(!(param1 is Container) || !(param1 is Sprite))
         {
            trace(this,"ViewStack只转载容器的类型组件");
         }
         var _loc3_:DisplayObject = super.addChildAt(param1,param2);
         this.CheckSelectedIndex();
         return _loc3_;
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         var _loc2_:DisplayObject = super.removeChild(param1);
         this.CheckSelectedIndex();
         return _loc2_;
      }
      
      private function CheckSelectedIndex() : void
      {
         if(this.selectedIndex == -1 && numChildren > 0)
         {
            this.selectedIndex = 0;
         }
         else if(this.selectedIndex > numChildren - 1)
         {
            this.selectedIndex = numChildren - 1;
         }
      }
      
      private function CommitSelectedIndex(param1:int) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.numChildren;
         if(param1 > _loc3_ - 1)
         {
            param1 = _loc3_ - 1;
         }
         if(param1 < 0 && _loc3_ > 0)
         {
            param1 = 0;
         }
         if(param1 >= 0)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc3_)
            {
               this.getChildAt(_loc2_).visible = _loc2_ == param1;
               _loc2_++;
            }
         }
         this._selectedIndex = param1;
      }
      
      override public function ValidateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            if(this.proposedSelectedIndex != -1)
            {
               this.CommitSelectedIndex(this.proposedSelectedIndex);
               this.proposedSelectedIndex = -1;
            }
         }
         super.ValidateProperties();
      }
   }
}


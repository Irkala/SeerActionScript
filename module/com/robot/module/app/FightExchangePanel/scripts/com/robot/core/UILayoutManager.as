package com.robot.core
{
   import flash.display.Sprite;
   import flash.events.Event;
   
   internal class UILayoutManager extends Sprite
   {
      
      private var invalidatedSkinList:Array = [];
      
      private var invalidateSizeList:Array = [];
      
      private var invalidateDisplayListList:Array = [];
      
      private var invalidatePropertiesList:Array = [];
      
      public function UILayoutManager()
      {
         super();
         this.addEventListener(Event.ENTER_FRAME,this.EnterFrameHandler);
      }
      
      public function InvalidateSkin(param1:UIComponent) : void
      {
         this.invalidatedSkinList.push(param1);
      }
      
      public function InvalidateSize(param1:UIComponent) : void
      {
         this.invalidateSizeList.push(param1);
      }
      
      public function InvalidateDisplayList(param1:UIComponent) : void
      {
         this.invalidateDisplayListList.push(param1);
      }
      
      public function InvalidateProperties(param1:UIComponent) : void
      {
         this.invalidatePropertiesList.push(param1);
      }
      
      public function ValidateNow() : void
      {
         var _loc1_:UIComponent = null;
         var _loc2_:* = undefined;
         var _loc3_:UIComponent = null;
         while(this.invalidatePropertiesList.length > 0)
         {
            _loc1_ = this.invalidatePropertiesList.pop() as UIComponent;
            if(_loc1_.root != null)
            {
               _loc1_.ValidateProperties();
            }
         }
         while(this.invalidateSizeList.length > 0)
         {
            _loc1_ = this.invalidateSizeList.pop() as UIComponent;
            if(_loc1_.root != null)
            {
               _loc1_.ValidateSize();
            }
         }
         while(this.invalidateDisplayListList.length > 0)
         {
            this.CheckInvalidateDisplayListListParent();
            _loc2_ = this.invalidateDisplayListList;
            _loc1_ = this.invalidateDisplayListList.pop() as UIComponent;
            if(_loc1_.root != null)
            {
               _loc1_.ValidateDisplayList();
               _loc3_ = Application.application;
               if(_loc1_.parent is UIComponent)
               {
                  _loc3_ = _loc1_.parent as UIComponent;
               }
               else if(_loc1_.parent.parent != null && _loc1_.parent.parent is UIComponent)
               {
                  _loc3_ = _loc1_.parent.parent as UIComponent;
               }
               if(_loc3_ != Application.application && !this.CheckInInvalidateDisplayList(_loc3_))
               {
                  _loc3_.InvalidateDisplayList();
               }
            }
         }
         while(this.invalidatedSkinList.length > 0)
         {
            _loc1_ = this.invalidatedSkinList.pop() as UIComponent;
            if(_loc1_.root != null)
            {
               _loc1_.ValidateSkin();
            }
         }
      }
      
      private function EnterFrameHandler(param1:Event) : void
      {
         this.ValidateNow();
      }
      
      private function CheckInInvalidateDisplayList(param1:UIComponent) : Boolean
      {
         var _loc2_:int = 0;
         var _loc3_:int = int(this.invalidateDisplayListList.length);
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            if(this.invalidateDisplayListList[_loc2_] == param1)
            {
               return true;
            }
            _loc2_++;
         }
         return false;
      }
      
      private function CheckInvalidateDisplayListListParent() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:Object = null;
         var _loc4_:int = int(this.invalidateDisplayListList.length);
         _loc1_ = 0;
         while(_loc1_ < _loc4_)
         {
            _loc2_ = 0;
            while(_loc2_ < _loc4_ - _loc1_ - 1)
            {
               if((this.invalidateDisplayListList[_loc1_] as UIComponent).parents < (this.invalidateDisplayListList[_loc2_] as UIComponent).parents)
               {
                  _loc3_ = this.invalidateDisplayListList[_loc1_];
                  this.invalidateDisplayListList[_loc1_] = this.invalidateDisplayListList[_loc2_];
                  this.invalidateDisplayListList[_loc2_] = _loc3_;
               }
               _loc2_++;
            }
            _loc1_++;
         }
      }
   }
}


package com.robot.container
{
   import com.robot.core.UIComponent;
   import flash.events.MouseEvent;
   
   public class TabBar extends ButtonBar
   {
      
      public function TabBar()
      {
         super();
      }
      
      override public function set selectedIndex(param1:int) : void
      {
         super.selectedIndex = param1;
         var _loc2_:Number = 0;
         while(_loc2_ < numChildren)
         {
            if(_loc2_ == param1)
            {
               (this.getChildAt(_loc2_) as Button).selected = true;
            }
            else
            {
               (this.getChildAt(_loc2_) as Button).selected = false;
            }
            _loc2_++;
         }
      }
      
      override public function Dispose() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.numChildren;
         _loc1_ = 0;
         while(_loc1_ < _loc2_)
         {
            (this.getChildAt(_loc1_) as UIComponent).removeEventListener(MouseEvent.CLICK,this.ClickHandler);
            _loc1_++;
         }
         super.Dispose();
      }
      
      override protected function CreateChild(param1:int) : UIComponent
      {
         var _loc2_:Button = null;
         if(itemClass != null)
         {
            _loc2_ = new itemClass();
         }
         else
         {
            _loc2_ = new Button();
            _loc2_.height = 100;
            _loc2_.width = 100;
         }
         _loc2_.id = param1.toString();
         _loc2_.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         _loc2_.selected = this.selectedIndex == param1;
         SetChild(_loc2_);
         return _loc2_;
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc3_)
         {
            (this.getChildAt(_loc2_) as Button).selected = param1.currentTarget == this.getChildAt(_loc2_);
            _loc2_++;
         }
         this.selectedIndex = int((param1.currentTarget as UIComponent).id);
      }
   }
}


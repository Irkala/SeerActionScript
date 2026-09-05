package com.robot.container
{
   import com.robot.core.UIComponent;
   import flash.events.MouseEvent;
   
   public class ButtonBar extends NavBar
   {
      
      public function ButtonBar()
      {
         super();
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
         var _loc2_:Button = new Button();
         _loc2_.id = param1.toString();
         _loc2_.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         _loc2_.enabled = this.selectedIndex != param1;
         SetChild(_loc2_);
         return _loc2_;
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         selectedIndex = int((param1.currentTarget as UIComponent).id);
      }
   }
}


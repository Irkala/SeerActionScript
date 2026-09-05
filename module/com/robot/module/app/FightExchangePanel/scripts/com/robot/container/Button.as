package com.robot.container
{
   import com.robot.core.UIComponent;
   import flash.display.DisplayObject;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class Button extends UIComponent
   {
      
      private var _item:DisplayObject;
      
      private var selectedChanged:Boolean;
      
      private var _selected:Boolean;
      
      private var _label:String;
      
      private var labelChanged:Boolean = false;
      
      public function Button()
      {
         this.mouseChildren = false;
         this.addEventListener(MouseEvent.CLICK,this.ClickHandler);
         super();
      }
      
      public function get item() : DisplayObject
      {
         return this._item;
      }
      
      public function set item(param1:DisplayObject) : void
      {
         this._item = param1;
      }
      
      override public function Dispose() : void
      {
         this.removeEventListener(MouseEvent.CLICK,this.ClickHandler);
         super.Dispose();
      }
      
      public function get selected() : Boolean
      {
         return this._selected;
      }
      
      public function set selected(param1:Boolean) : void
      {
         if(this._selected != param1)
         {
            this._selected = param1;
            this.selectedChanged = true;
            InvalidateProperties();
            InvalidateSkin();
            this.dispatchEvent(new Event(Event.CHANGE));
         }
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         if(this._label != param1)
         {
            if(param1 == null)
            {
               param1 = "";
            }
            this._label = param1;
            this.labelChanged = true;
            InvalidateProperties();
            InvalidateSize();
         }
      }
      
      override public function set data(param1:Object) : void
      {
         super.data = param1;
         if(_data.hasOwnProperty(dataField))
         {
            this.label = _data[dataField];
         }
      }
      
      protected function get lableX() : int
      {
         return (this.width - this._item.width) / 2;
      }
      
      protected function get lableY() : int
      {
         return (this.height - this._item.height) / 2;
      }
      
      private function ClickHandler(param1:MouseEvent) : void
      {
         this.OnClick(param1);
      }
      
      protected function OnClick(param1:MouseEvent) : void
      {
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            if(this._item != null)
            {
               this._item.x = this.lableX;
               this._item.y = this.lableY;
            }
         }
         super.ValidateSize();
      }
      
      override public function set itemClass(param1:Class) : void
      {
         super.itemClass = param1;
         this.labelChanged = true;
         InvalidateProperties();
      }
      
      override public function ValidateProperties() : void
      {
         if(this.labelChanged)
         {
            if(itemClass != null)
            {
               this._item = new itemClass();
            }
            else
            {
               this._item = new TextField();
               (this._item as TextField).text = this._label;
            }
            this.addChild(this._item);
            this.width = this._item.width;
            this.height = this._item.height;
            this.labelChanged = false;
            trace(this.$height);
         }
         super.ValidateProperties();
      }
      
      override protected function $DrawDisabled() : void
      {
         if(this._item != null)
         {
         }
      }
      
      override protected function $DrawDown() : void
      {
         if(this._item != null)
         {
         }
      }
      
      override protected function $DrawOver() : void
      {
         if(this._item != null)
         {
         }
      }
      
      override protected function $DrawNormal() : void
      {
         if(this._item != null)
         {
         }
      }
      
      override public function toString() : String
      {
         return "[Button cid:" + this.id + " id:" + id + ", label:" + this.label + "]";
      }
   }
}


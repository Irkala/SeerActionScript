package com.robot.core
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class UIComponent extends Sprite implements IUIComponent, IListItemRenderer
   {
      
      private static var cidCounter:uint = 0;
      
      protected var initialized:Boolean = false;
      
      protected var disposing:Boolean = false;
      
      private var _itemClass:Class = null;
      
      protected var liquidLayout:Boolean = false;
      
      private var _cid:uint;
      
      private var _id:String;
      
      private var _enabled:Boolean = true;
      
      protected var _width:Number;
      
      protected var $width:Number = 100;
      
      protected var _height:Number;
      
      protected var $height:Number = 100;
      
      protected var _dataEditable:Boolean;
      
      protected var _dataField:String = "label";
      
      protected var _data:Object;
      
      private var _parents:int = -1;
      
      protected var $listenMouseOver:Boolean = false;
      
      protected var $listenMouseDown:Boolean = false;
      
      private var _mouseDown:Boolean;
      
      private var _mouseOver:Boolean;
      
      protected var invalidateSkinFlag:Boolean;
      
      protected var invalidateSizeFlag:Boolean;
      
      protected var invalidateDisplayListFlag:Boolean;
      
      protected var invalidatePropertiesFlag:Boolean;
      
      public function UIComponent()
      {
         super();
         this._cid = cidCounter++;
         this.InitializeComponent();
         this.$StyleChanged();
      }
      
      public function get itemClass() : Class
      {
         return this._itemClass;
      }
      
      public function set itemClass(param1:Class) : void
      {
         this._itemClass = param1;
         this.InvalidateProperties();
      }
      
      public function InitializeComponent() : void
      {
         super.addEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         super.addEventListener(Event.REMOVED_FROM_STAGE,this.RemovedHandler);
      }
      
      protected function OnAddedToStage() : void
      {
         this.initialized = true;
         this.InvalidateDisplayList();
         this.InvalidateSize();
         this.InvalidateSkin();
         this.InvalidateProperties();
      }
      
      protected function OnRemovedFromStage() : void
      {
         this.initialized = false;
      }
      
      public function Dispose() : void
      {
         super.removeEventListener(Event.ADDED_TO_STAGE,this.AddedHandler);
         super.removeEventListener(Event.REMOVED_FROM_STAGE,this.RemovedHandler);
         this.RemoveListener();
         this.disposing = true;
      }
      
      protected function MeasureWidth() : void
      {
         if(isNaN(this.$width))
         {
            this.$width = 100;
         }
      }
      
      protected function MeasureHeight() : void
      {
         if(isNaN(this.$height))
         {
            this.$height = 100;
         }
      }
      
      public function get cid() : uint
      {
         return this._cid;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function set id(param1:String) : void
      {
         this._id = param1;
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         if(this._enabled != param1)
         {
            this._enabled = param1;
            this.$Render();
         }
      }
      
      override public function set width(param1:Number) : void
      {
         if(this._width != param1)
         {
            this._width = param1;
            this.InvalidateProperties();
            this.InvalidateDisplayList();
            this.InvalidateSize();
            this.InvalidateSkin();
         }
      }
      
      override public function get width() : Number
      {
         if(!isNaN(this._width))
         {
            return this._width;
         }
         if(isNaN(this.$width))
         {
            this.MeasureWidth();
         }
         return this.$width;
      }
      
      override public function set height(param1:Number) : void
      {
         if(this._height != param1)
         {
            this._height = param1;
            this.InvalidateProperties();
            this.InvalidateDisplayList();
            this.InvalidateSize();
            this.InvalidateSkin();
         }
      }
      
      override public function get height() : Number
      {
         if(!isNaN(this._height))
         {
            return this._height;
         }
         if(isNaN(this.$height))
         {
            this.MeasureHeight();
         }
         return this.$height;
      }
      
      public function get dataEditable() : Boolean
      {
         return this._dataEditable;
      }
      
      public function set dataEditable(param1:Boolean) : void
      {
         if(this._dataEditable == param1)
         {
            return;
         }
         this._dataEditable = param1;
      }
      
      public function get dataField() : String
      {
         return this._dataField;
      }
      
      public function set dataField(param1:String) : void
      {
         if(this._dataField == param1)
         {
            return;
         }
         this._dataField = param1;
      }
      
      public function get data() : Object
      {
         return this._data;
      }
      
      public function set data(param1:Object) : void
      {
         this._data = param1;
      }
      
      internal function get parents() : int
      {
         var _loc1_:DisplayObjectContainer = null;
         if(this._parents == -1)
         {
            if(this is Application)
            {
               return 0;
            }
            _loc1_ = this;
            this._parents = 0;
            while(_loc1_.parent != null && _loc1_.parent != Application.application)
            {
               _loc1_ = _loc1_.parent;
               ++this._parents;
            }
         }
         return this._parents;
      }
      
      private function AddListener() : void
      {
         this.RemoveListener();
         if(this.$listenMouseOver)
         {
            super.addEventListener(MouseEvent.MOUSE_OVER,this.MouseOverEventHandler);
            super.addEventListener(MouseEvent.MOUSE_OUT,this.MouseOutEventHandler);
         }
         if(this.$listenMouseDown)
         {
            super.addEventListener(MouseEvent.MOUSE_DOWN,this.MouseDownEventHandler);
            super.addEventListener(MouseEvent.MOUSE_UP,this.MouseUpEventHandler);
         }
      }
      
      private function RemoveListener() : void
      {
         this.removeEventListener(MouseEvent.MOUSE_OVER,this.MouseOverEventHandler);
         this.removeEventListener(MouseEvent.MOUSE_OUT,this.MouseOutEventHandler);
         this.removeEventListener(MouseEvent.MOUSE_DOWN,this.MouseDownEventHandler);
         this.removeEventListener(MouseEvent.MOUSE_UP,this.MouseUpEventHandler);
      }
      
      private function MouseOverEventHandler(param1:MouseEvent) : void
      {
         this.$SetOver(param1);
      }
      
      private function MouseOutEventHandler(param1:MouseEvent) : void
      {
         this.$SetOut(param1);
      }
      
      private function MouseDownEventHandler(param1:MouseEvent) : void
      {
         this.$SetDown(param1);
      }
      
      private function MouseUpEventHandler(param1:MouseEvent) : void
      {
         this.$SetUp(param1);
      }
      
      private function AddedHandler(param1:Event) : void
      {
         this.OnAddedToStage();
      }
      
      private function RemovedHandler(param1:Event) : void
      {
         this.OnRemovedFromStage();
      }
      
      protected function $SetNormal(param1:MouseEvent) : void
      {
         this._mouseDown = false;
         this._mouseOver = false;
         this.$Render();
      }
      
      protected function $SetOver(param1:MouseEvent) : void
      {
         this._mouseOver = true;
         this.$Render();
      }
      
      protected function $SetOut(param1:MouseEvent) : void
      {
         this._mouseOver = false;
         this._mouseDown = false;
         this.$Render();
      }
      
      protected function $SetDown(param1:MouseEvent) : void
      {
         this._mouseDown = true;
         this.$Render();
      }
      
      protected function $SetUp(param1:MouseEvent) : void
      {
         this._mouseDown = false;
         this.$Render();
      }
      
      protected function $StyleChanged() : void
      {
         this.InvalidateSkin();
         this.AddListener();
      }
      
      protected function $Render() : void
      {
         if(!this._enabled)
         {
            this.$DrawDisabled();
         }
         else if(this._mouseDown)
         {
            this.$DrawDown();
         }
         else if(this._mouseOver)
         {
            this.$DrawOver();
         }
         else
         {
            this.$DrawNormal();
         }
         this.$DrawSkin();
      }
      
      protected function $DrawDisabled() : void
      {
      }
      
      protected function $DrawDown() : void
      {
      }
      
      protected function $DrawOver() : void
      {
      }
      
      protected function $DrawNormal() : void
      {
      }
      
      protected function $DrawSkin() : void
      {
      }
      
      private function get isOnDisplayList() : Boolean
      {
         return this.root != null;
      }
      
      public function InvalidateSkin() : void
      {
         if(!this.invalidateSkinFlag && this.initialized)
         {
            this.invalidateSkinFlag = true;
            UIComponentGlobals.layoutManager.InvalidateSkin(this);
         }
      }
      
      public function ValidateSkin() : void
      {
      }
      
      public function InvalidateSize() : void
      {
         if(!this.invalidateSizeFlag && this.initialized)
         {
            this.invalidateSizeFlag = true;
            UIComponentGlobals.layoutManager.InvalidateSize(this);
         }
      }
      
      public function ValidateSize() : void
      {
         this.invalidateSizeFlag = false;
      }
      
      public function InvalidateDisplayList() : void
      {
         if(!this.invalidateDisplayListFlag && this.initialized)
         {
            this.invalidateDisplayListFlag = true;
            UIComponentGlobals.layoutManager.InvalidateDisplayList(this);
         }
      }
      
      public function ValidateDisplayList() : void
      {
         if(this.invalidateDisplayListFlag)
         {
            this.invalidateDisplayListFlag = false;
         }
      }
      
      public function InvalidateProperties() : void
      {
         if(!this.invalidatePropertiesFlag && this.initialized)
         {
            this.invalidatePropertiesFlag = true;
            UIComponentGlobals.layoutManager.InvalidateProperties(this);
         }
      }
      
      public function ValidateProperties() : void
      {
         this.invalidatePropertiesFlag = false;
      }
      
      public function SetTextFieldStyle(param1:TextField) : void
      {
         param1.multiline = false;
         param1.background = false;
         param1.mouseEnabled = false;
         param1.autoSize = TextFieldAutoSize.LEFT;
      }
   }
}


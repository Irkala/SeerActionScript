package com.robot.core
{
   import com.robot.container.TabBar;
   import com.robot.container.TabNavigator;
   import com.robot.container.Tile;
   import flash.display.DisplayObject;
   import flash.display.InteractiveObject;
   import flash.display.Sprite;
   
   public class Container extends UIComponent
   {
      
      protected var contentPane:Sprite;
      
      private var _firstChildIndex:int;
      
      private var _label:String = "";
      
      public function Container()
      {
         super();
      }
      
      override public function Dispose() : void
      {
         while(this.contentPane.numChildren > 0)
         {
            if(this.contentPane.getChildAt(0) is UIComponent)
            {
               (this.contentPane.getChildAt(0) as UIComponent).Dispose();
            }
            this.contentPane.removeChildAt(0);
         }
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.contentPane = new Sprite();
         this.$addChild(this.contentPane);
      }
      
      override protected function MeasureWidth() : void
      {
         super.MeasureWidth();
      }
      
      override protected function MeasureHeight() : void
      {
         super.MeasureWidth();
      }
      
      override public function set enabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         if(super.enabled != param1)
         {
            super.enabled = param1;
            _loc2_ = 0;
            while(_loc2_ < this.numChildren)
            {
               if(this.getChildAt(_loc2_) is IUIComponent)
               {
                  (this.getChildAt(_loc2_) as IUIComponent).enabled = param1;
               }
               _loc2_++;
            }
            _loc2_ = 0;
            while(_loc2_ < this.$numChildren)
            {
               if(this.$getChildAt(_loc2_) is IUIComponent)
               {
                  (this.$getChildAt(_loc2_) as IUIComponent).enabled = param1;
               }
               _loc2_++;
            }
         }
      }
      
      override public function set doubleClickEnabled(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:InteractiveObject = null;
         super.doubleClickEnabled = param1;
         if(Boolean(this.contentPane))
         {
            _loc2_ = this.contentPane.numChildren;
            _loc3_ = 0;
            while(_loc3_ < _loc2_)
            {
               _loc4_ = this.contentPane.getChildAt(_loc3_) as InteractiveObject;
               if(Boolean(_loc4_))
               {
                  _loc4_.doubleClickEnabled = param1;
               }
               _loc3_++;
            }
         }
      }
      
      public function get displayWidth() : int
      {
         return this.width;
      }
      
      public function get displayHeight() : int
      {
         return this.height;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      override public function addChild(param1:DisplayObject) : DisplayObject
      {
         return this.addChildAt(param1,this.numChildren);
      }
      
      override public function addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         if(this.contentPane != null)
         {
            this.ValidateDisplayList();
            return this.contentPane.addChildAt(param1,param2);
         }
         return super.addChildAt(param1,param2);
      }
      
      override public function getChildAt(param1:int) : DisplayObject
      {
         if(this.contentPane != null)
         {
            return this.contentPane.getChildAt(param1);
         }
         return super.getChildAt(this._firstChildIndex + param1);
      }
      
      override public function getChildByName(param1:String) : DisplayObject
      {
         if(this.contentPane != null)
         {
            return this.contentPane.getChildByName(param1);
         }
         return super.getChildByName(param1);
      }
      
      override public function getChildIndex(param1:DisplayObject) : int
      {
         if(this.contentPane != null)
         {
            return this.contentPane.getChildIndex(param1);
         }
         return super.getChildIndex(param1) - this._firstChildIndex;
      }
      
      override public function get numChildren() : int
      {
         if(this.contentPane != null)
         {
            return this.contentPane.numChildren;
         }
         return super.numChildren - this._firstChildIndex;
      }
      
      override public function contains(param1:DisplayObject) : Boolean
      {
         if(this.contentPane != null)
         {
            return this.contentPane.contains(param1);
         }
         return super.contains(param1);
      }
      
      override public function removeChildAt(param1:int) : DisplayObject
      {
         return this.removeChild(this.getChildAt(param1));
      }
      
      override public function removeChild(param1:DisplayObject) : DisplayObject
      {
         if(this.contentPane != null)
         {
            this.ValidateDisplayList();
            return this.contentPane.removeChild(param1);
         }
         return super.removeChild(param1);
      }
      
      protected function $addChildAt(param1:DisplayObject, param2:int) : DisplayObject
      {
         return super.addChildAt(param1,param2);
      }
      
      protected function $addChild(param1:DisplayObject) : DisplayObject
      {
         return super.addChildAt(param1,this.$numChildren);
      }
      
      protected function $getChildAt(param1:int) : DisplayObject
      {
         return super.getChildAt(param1);
      }
      
      protected function get $numChildren() : int
      {
         return super.numChildren;
      }
      
      protected function $contains(param1:DisplayObject) : Boolean
      {
         return super.contains(param1);
      }
      
      public function $removeChild(param1:DisplayObject) : DisplayObject
      {
         return super.removeChild(param1);
      }
      
      override public function ValidateSize() : void
      {
         if(this.contentPane != null)
         {
            this.contentPane.x = 0;
            this.contentPane.y = 0;
         }
         super.ValidateSize();
      }
      
      override public function ValidateDisplayList() : void
      {
         if(invalidateDisplayListFlag)
         {
            this.MeasureWidth();
            this.MeasureHeight();
            this.contentPane.graphics.clear();
            if(this is TabBar)
            {
               this.contentPane.graphics.beginFill(0,0);
            }
            else if(this is Tile)
            {
               this.contentPane.graphics.beginFill(16711680,0);
            }
            else if(this is TabNavigator)
            {
               this.contentPane.graphics.beginFill(65280,0);
            }
            else if(this is Container)
            {
               this.contentPane.graphics.beginFill(255,0);
            }
            else
            {
               this.contentPane.graphics.beginFill(16777215,0);
            }
            this.contentPane.graphics.drawRect(0,0,this.displayWidth,this.displayHeight);
            this.contentPane.graphics.endFill();
         }
         super.ValidateDisplayList();
      }
   }
}


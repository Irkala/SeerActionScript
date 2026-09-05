package com.robot.container
{
   import com.robot.core.DataProvider;
   import com.robot.core.IAsguiDisplayObject;
   import com.robot.core.UIComponent;
   import flash.display.DisplayObject;
   import flash.text.TextField;
   
   public class NavBar extends Box
   {
      
      protected var targetStack:ViewStack;
      
      private var _dataProvider:DataProvider;
      
      private var dataProviderChanged:Boolean = false;
      
      private var _labelField:String = "label";
      
      private var _selectedIndex:int = 0;
      
      public function NavBar()
      {
         super();
      }
      
      override public function Dispose() : void
      {
         this.targetStack = null;
         this._dataProvider = null;
         super.Dispose();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         direction = BoxDirection.HORIZONTAL;
      }
      
      public function get dataProvider() : Object
      {
         return Boolean(this._dataProvider) ? this._dataProvider.data : this.targetStack;
      }
      
      public function set dataProvider(param1:Object) : void
      {
         if(this.dataProvider == param1)
         {
            return;
         }
         if(param1 is Array)
         {
            this._dataProvider = new DataProvider(param1);
         }
         else if(param1 is ViewStack)
         {
            this.targetStack = param1 as ViewStack;
         }
      }
      
      public function get labelField() : String
      {
         return this._labelField;
      }
      
      public function set labelField(param1:String) : void
      {
         if(this._labelField == param1)
         {
            return;
         }
         this._labelField = param1;
         InvalidateProperties();
      }
      
      public function get selectedIndex() : int
      {
         return this._selectedIndex;
      }
      
      public function set selectedIndex(param1:int) : void
      {
         if(this._selectedIndex == param1)
         {
            return;
         }
         this._selectedIndex = param1;
         if(Boolean(this.targetStack))
         {
            this.targetStack.selectedIndex = param1;
         }
      }
      
      protected function CreateChild(param1:int) : UIComponent
      {
         return null;
      }
      
      protected function SetChild(param1:IAsguiDisplayObject) : void
      {
         param1.height = displayHeight;
      }
      
      protected function CheckChildren() : void
      {
         var _loc1_:UIComponent = null;
         var _loc2_:int = 0;
         if(Boolean(this.targetStack))
         {
            _loc2_ = this.targetStack.numChildren;
         }
         else if(Boolean(this._dataProvider))
         {
            _loc2_ = this._dataProvider.rowCount;
         }
         while(_loc2_ < this.numChildren)
         {
            (this.getChildAt(this.numChildren - 1) as UIComponent).Dispose();
            this.removeChildAt(this.numChildren - 1);
         }
         while(_loc2_ > this.numChildren)
         {
            _loc1_ = this.CreateChild(this.numChildren) as UIComponent;
            _loc1_.dataField = this.labelField;
            if(Boolean(this.targetStack))
            {
               _loc1_.data = this.targetStack.getChildAt(this.numChildren);
            }
            else if(Boolean(this._dataProvider))
            {
               _loc1_.data = this._dataProvider.GetRow(this.numChildren);
            }
            if(_loc1_ is TextField)
            {
               SetTextFieldStyle(_loc1_ as TextField);
            }
            this.addChild(_loc1_ as DisplayObject);
         }
      }
      
      override public function ValidateProperties() : void
      {
         if(invalidatePropertiesFlag)
         {
            this.CheckChildren();
         }
         super.ValidateProperties();
      }
   }
}


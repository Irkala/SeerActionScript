package com.robot.container
{
   public class TabNavigator extends ViewStack
   {
      
      private var _headerHeight:Number;
      
      public var tabBar:TabBar;
      
      public function TabNavigator(param1:Class = null)
      {
         this.itemClass = param1;
         super();
      }
      
      public function get headerHeight() : Number
      {
         return this._headerHeight;
      }
      
      public function set headerHeight(param1:Number) : void
      {
         this._headerHeight = param1;
         InvalidateSize();
      }
      
      override public function InitializeComponent() : void
      {
         super.InitializeComponent();
         this.tabBar = new TabBar();
         this.tabBar.dataProvider = this;
         this.tabBar.width = width;
         this.tabBar.height = this.headerHeight;
         if(itemClass != null)
         {
            this.tabBar.itemClass = itemClass;
         }
         this.$addChild(this.tabBar);
      }
      
      override public function ValidateSize() : void
      {
         if(invalidateSizeFlag)
         {
            this.tabBar.width = width;
            this.tabBar.height = this.headerHeight;
         }
         super.ValidateSize();
      }
   }
}


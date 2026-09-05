package com.robot.module.app.fightExchange.view
{
   import com.robot.container.TabNavigator;
   import com.robot.core.Application;
   import com.robot.module.app.fightExchange.control.ExchangeControl;
   import com.robot.module.app.fightExchange.mode.ExchangeCategoryData;
   
   public class MainView extends Application
   {
      
      private var tabNav:TabNavigator;
      
      public function MainView()
      {
         super();
      }
      
      public function setup() : void
      {
         ExchangeControl.setup(this);
         this.createTabNavigator();
      }
      
      public function updateTabNav() : void
      {
         this.removeChild(this.tabNav);
         this.createTabNavigator();
      }
      
      public function createTabNavigator() : void
      {
         var _loc1_:ExchangeCategoryData = null;
         var _loc2_:PageView1 = null;
         var _loc3_:PageView2 = null;
         var _loc4_:PageView = null;
         this.tabNav = new TabNavigator(TabView);
         this.tabNav.headerHeight = 40;
         this.tabNav.width = 420;
         this.tabNav.y = 28;
         var _loc5_:Array = ExchangeControl.categoryExchangeArr;
         var _loc6_:Number = 0;
         while(_loc6_ < _loc5_.length)
         {
            _loc1_ = _loc5_[_loc6_] as ExchangeCategoryData;
            if(_loc6_ == 0)
            {
               _loc4_ = new PageView(_loc1_.childrenItems);
               _loc4_.width = 420;
               _loc4_.height = 420;
               _loc4_.label = _loc1_.catoryName;
               _loc4_.data = _loc1_.catoryName;
               this.tabNav.addChild(_loc4_);
            }
            else if(_loc6_ == 1)
            {
               _loc4_ = new PageView(_loc1_.childrenItems);
               _loc4_.width = 420;
               _loc4_.height = 420;
               _loc4_.label = _loc1_.catoryName;
               _loc4_.data = _loc1_.catoryName;
               this.tabNav.addChild(_loc4_);
            }
            else if(_loc6_ == 2)
            {
               _loc4_ = new PageView(_loc1_.childrenItems);
               _loc4_.width = 420;
               _loc4_.height = 420;
               _loc4_.label = _loc1_.catoryName;
               _loc4_.data = _loc1_.catoryName;
               this.tabNav.addChild(_loc4_);
            }
            _loc6_++;
         }
         this.addChild(this.tabNav);
      }
   }
}


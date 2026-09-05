package com.robot.core
{
   import flash.events.Event;
   
   public class Application extends LayoutContainer
   {
      
      public static var _application:Application;
      
      public function Application()
      {
         super();
         _application = this;
      }
      
      public static function get application() : Application
      {
         return _application;
      }
      
      override public function Dispose() : void
      {
         super.Dispose();
      }
      
      override protected function OnAddedToStage() : void
      {
         super.OnAddedToStage();
      }
      
      private function StageResizeHandler(param1:Event) : void
      {
         this.CheckSize();
      }
      
      protected function CheckSize() : void
      {
         this.width = this.stage.stageWidth;
         this.height = this.stage.stageHeight;
      }
   }
}


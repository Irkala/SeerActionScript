package com.robot.core
{
   import flash.display.IBitmapDrawable;
   import flash.events.IEventDispatcher;
   
   public interface IAsguiDisplayObject extends IBitmapDrawable, IEventDispatcher
   {
      
      function get width() : Number;
      
      function set width(param1:Number) : void;
      
      function get height() : Number;
      
      function set height(param1:Number) : void;
      
      function get x() : Number;
      
      function set x(param1:Number) : void;
      
      function get y() : Number;
      
      function set y(param1:Number) : void;
      
      function get visible() : Boolean;
      
      function set visible(param1:Boolean) : void;
   }
}


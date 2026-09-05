package com.robot.core
{
   public interface IUIComponent extends IAsguiDisplayObject
   {
      
      function InitializeComponent() : void;
      
      function Dispose() : void;
      
      function get cid() : uint;
      
      function get id() : String;
      
      function set id(param1:String) : void;
      
      function get enabled() : Boolean;
      
      function set enabled(param1:Boolean) : void;
      
      function ValidateSkin() : void;
      
      function ValidateDisplayList() : void;
      
      function ValidateSize() : void;
      
      function ValidateProperties() : void;
      
      function InvalidateSkin() : void;
      
      function InvalidateDisplayList() : void;
      
      function InvalidateSize() : void;
      
      function InvalidateProperties() : void;
   }
}


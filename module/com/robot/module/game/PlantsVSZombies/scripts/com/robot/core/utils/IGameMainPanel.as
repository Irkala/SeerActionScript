package com.robot.core.utils
{
   import flash.display.Sprite;
   
   public interface IGameMainPanel
   {
      
      function destroy() : void;
      
      function hide() : void;
      
      function show() : void;
      
      function get sprite() : Sprite;
   }
}


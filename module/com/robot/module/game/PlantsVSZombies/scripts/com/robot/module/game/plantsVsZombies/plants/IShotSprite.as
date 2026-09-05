package com.robot.module.game.plantsVsZombies.plants
{
   import flash.display.Sprite;
   import flash.events.IEventDispatcher;
   
   public interface IShotSprite extends IEventDispatcher
   {
      
      function get row() : uint;
      
      function hit(param1:uint) : void;
      
      function set row(param1:uint) : void;
      
      function get sprite() : Sprite;
      
      function get xIndex() : uint;
      
      function destroy() : void;
      
      function set xIndex(param1:uint) : void;
   }
}


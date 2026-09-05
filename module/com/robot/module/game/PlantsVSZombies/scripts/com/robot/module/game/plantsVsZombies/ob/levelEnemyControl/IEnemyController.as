package com.robot.module.game.plantsVsZombies.ob.levelEnemyControl
{
   import flash.events.IEventDispatcher;
   
   public interface IEnemyController extends IEventDispatcher
   {
      
      function start() : void;
      
      function stop() : void;
      
      function complete() : void;
      
      function destroy() : void;
      
      function setup() : void;
   }
}


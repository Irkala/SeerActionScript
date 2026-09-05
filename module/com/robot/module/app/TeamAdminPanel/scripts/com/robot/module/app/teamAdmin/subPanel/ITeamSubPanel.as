package com.robot.module.app.teamAdmin.subPanel
{
   import flash.events.IEventDispatcher;
   
   public interface ITeamSubPanel extends IEventDispatcher
   {
      
      function destroy() : void;
      
      function hide() : void;
      
      function setup(param1:uint) : void;
   }
}


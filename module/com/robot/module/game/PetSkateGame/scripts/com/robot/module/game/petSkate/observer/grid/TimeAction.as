package com.robot.module.game.petSkate.observer.grid
{
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class TimeAction implements IGridAction
   {
      
      private var timer:Timer;
      
      private var grid:BaseGrid;
      
      public function TimeAction(grid:BaseGrid)
      {
         super();
         this.grid = grid;
         timer = new Timer(5000,1);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.start();
      }
      
      public function destroy() : void
      {
         grid = null;
         timer.stop();
         timer.removeEventListener(TimerEvent.TIMER,onTimer);
      }
      
      public function hit() : void
      {
      }
      
      private function onTimer(event:TimerEvent) : void
      {
         grid.status = BaseGrid.NORMAL;
      }
   }
}


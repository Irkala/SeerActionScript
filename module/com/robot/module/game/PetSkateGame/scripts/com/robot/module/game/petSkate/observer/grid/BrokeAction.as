package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.observer.GridFactory;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   
   public class BrokeAction implements IGridAction
   {
      
      private var grid:BaseGrid;
      
      public function BrokeAction(grid:BaseGrid)
      {
         super();
         this.grid = grid;
         grid.stoneMC.gotoAndStop(1);
      }
      
      public function hit() : void
      {
         grid.stoneMC.gotoAndStop(2);
         setTimeout(function():void
         {
            var s:MovieClip = GridFactory.getGrid(BaseGrid.NORMAL);
            if(grid)
            {
               grid.addChild(s);
               grid.status = BaseGrid.NORMAL;
            }
         },400);
      }
      
      public function destroy() : void
      {
         grid = null;
      }
   }
}


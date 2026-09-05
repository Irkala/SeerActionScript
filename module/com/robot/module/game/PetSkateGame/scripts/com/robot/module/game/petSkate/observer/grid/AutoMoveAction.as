package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.PlayerObserver;
   
   public class AutoMoveAction implements IGridAction
   {
      
      private var grid:BaseGrid;
      
      private var dir:uint;
      
      private var playerObs:PlayerObserver;
      
      public function AutoMoveAction(grid:BaseGrid, dir:uint)
      {
         super();
         this.grid = grid;
         this.dir = dir;
         grid.stoneMC.gotoAndStop(dir);
         playerObs = PetSkateMainPanel.getObserver("PlayerObserver") as PlayerObserver;
      }
      
      public function destroy() : void
      {
         playerObs = null;
      }
      
      public function hit() : void
      {
         PlayerObserver.player.xIndex = grid.posIndex.x;
         PlayerObserver.player.yIndex = grid.posIndex.y;
         if(grid.direction == GridDirection.UP)
         {
            playerObs.setXYDir(0,-1);
         }
         else if(grid.direction == GridDirection.RIGHT)
         {
            playerObs.setXYDir(1,0);
         }
         else if(grid.direction == GridDirection.DOWN)
         {
            playerObs.setXYDir(0,1);
         }
         else if(grid.direction == GridDirection.LEFT)
         {
            playerObs.setXYDir(-1,0);
         }
         playerObs.find();
      }
   }
}


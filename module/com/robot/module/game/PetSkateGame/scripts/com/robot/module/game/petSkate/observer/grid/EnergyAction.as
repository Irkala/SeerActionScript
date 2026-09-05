package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.EnergyController;
   import com.robot.module.game.petSkate.observer.PlayerObserver;
   import org.taomee.utils.DisplayUtil;
   
   public class EnergyAction implements IGridAction
   {
      
      private var grid:BaseGrid;
      
      public function EnergyAction(grid:BaseGrid)
      {
         super();
         this.grid = grid;
      }
      
      public function hit() : void
      {
         DisplayUtil.removeForParent(grid);
         grid.status = BaseGrid.NORMAL;
         EnergyController.catchEnergy();
         var playerObs:PlayerObserver = PetSkateMainPanel.getObserver("PlayerObserver") as PlayerObserver;
         playerObs.find();
      }
      
      public function destroy() : void
      {
         grid = null;
      }
   }
}


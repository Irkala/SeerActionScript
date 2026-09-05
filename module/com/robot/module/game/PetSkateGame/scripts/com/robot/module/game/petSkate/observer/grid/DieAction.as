package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.LevelObserver;
   
   public class DieAction implements IGridAction
   {
      
      public function DieAction()
      {
         super();
      }
      
      public function destroy() : void
      {
      }
      
      public function hit() : void
      {
         var levelObs:LevelObserver = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         levelObs.lost();
      }
   }
}


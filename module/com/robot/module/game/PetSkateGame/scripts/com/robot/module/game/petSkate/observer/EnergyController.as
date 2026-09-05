package com.robot.module.game.petSkate.observer
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.grid.DoorGrid;
   
   public class EnergyController
   {
      
      private static var current:uint = 0;
      
      private static var countArray:Array = [1,1,1,2,1];
      
      public function EnergyController()
      {
         super();
      }
      
      public static function catchEnergy() : void
      {
         ++current;
         var levelObs:LevelObserver = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         if(current == countArray[levelObs.level])
         {
            DoorGrid.instance.open();
         }
      }
      
      public static function reset() : void
      {
         current = 0;
      }
   }
}


package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   
   public class Plant_4 extends BasePlants implements IPlants
   {
      
      public function Plant_4()
      {
         super();
         life = 30;
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10011,10012]);
      }
   }
}


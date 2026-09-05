package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   import com.robot.module.game.plantsVsZombies.shotBehavior.Shot_3;
   
   public class Plant_3 extends BasePlants implements IPlants
   {
      
      public function Plant_3()
      {
         super();
         life = 6;
         shotDis = 100;
      }
      
      override protected function getShot() : IShotBehavior
      {
         attack = 1;
         return new Shot_3(this,attack);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10002,10003,10004]);
      }
   }
}


package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   import com.robot.module.game.plantsVsZombies.shotBehavior.Shot_2;
   
   public class Plant_2 extends BasePlants implements IPlants
   {
      
      public function Plant_2()
      {
         super();
         life = 8;
         shotDis = 4;
      }
      
      override protected function getShot() : IShotBehavior
      {
         attack = 2;
         return new Shot_2(this,attack);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10005,10006,10007]);
      }
   }
}


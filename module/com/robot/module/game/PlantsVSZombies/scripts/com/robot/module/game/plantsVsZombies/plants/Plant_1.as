package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   import com.robot.module.game.plantsVsZombies.shotBehavior.Shot_1;
   
   public class Plant_1 extends BasePlants implements IPlants
   {
      
      public function Plant_1()
      {
         super();
         life = 12;
         shotDis = 100;
      }
      
      override protected function getShot() : IShotBehavior
      {
         attack = 2;
         return new Shot_1(this,attack);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10008,10009,10010]);
      }
   }
}


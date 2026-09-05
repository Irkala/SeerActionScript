package com.robot.module.game.plantsVsZombies.enemy
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import flash.geom.Point;
   
   public class Enemy_1 extends BaseEnemy
   {
      
      public function Enemy_1()
      {
         super();
         life = 15;
         attack = 1;
         hitPoint = new Point(0,-30);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10013]);
      }
   }
}


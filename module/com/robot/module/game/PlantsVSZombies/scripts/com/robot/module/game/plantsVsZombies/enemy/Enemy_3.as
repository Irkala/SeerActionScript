package com.robot.module.game.plantsVsZombies.enemy
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import flash.geom.Point;
   
   public class Enemy_3 extends BaseEnemy
   {
      
      public function Enemy_3()
      {
         super();
         life = 50;
         attack = 1;
         hitPoint = new Point(10,-90);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10015]);
      }
   }
}


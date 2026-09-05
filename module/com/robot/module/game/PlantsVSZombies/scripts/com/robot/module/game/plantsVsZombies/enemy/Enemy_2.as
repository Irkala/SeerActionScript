package com.robot.module.game.plantsVsZombies.enemy
{
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import flash.geom.Point;
   
   public class Enemy_2 extends BaseEnemy
   {
      
      public function Enemy_2()
      {
         super();
         life = 30;
         attack = 1;
         hitPoint = new Point(13,-36);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10014]);
      }
   }
}


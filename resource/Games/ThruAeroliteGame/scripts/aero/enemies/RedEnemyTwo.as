package aero.enemies
{
   import flash.display.MovieClip;
   
   public class RedEnemyTwo extends RedEnemy
   {
      
      public function RedEnemyTwo()
      {
         super();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new RedEnemyTwoMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


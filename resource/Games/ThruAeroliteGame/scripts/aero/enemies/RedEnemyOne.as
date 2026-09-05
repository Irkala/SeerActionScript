package aero.enemies
{
   import flash.display.MovieClip;
   
   public class RedEnemyOne extends RedEnemy
   {
      
      public function RedEnemyOne()
      {
         super();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new RedEnemyOneMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


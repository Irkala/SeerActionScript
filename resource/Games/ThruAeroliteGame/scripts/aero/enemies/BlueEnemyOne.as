package aero.enemies
{
   import flash.display.MovieClip;
   
   public class BlueEnemyOne extends BlueEnemy
   {
      
      public function BlueEnemyOne()
      {
         super();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new BlueEnemyOneMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


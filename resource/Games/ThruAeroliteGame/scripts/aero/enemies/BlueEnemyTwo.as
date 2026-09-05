package aero.enemies
{
   import flash.display.MovieClip;
   
   public class BlueEnemyTwo extends BlueEnemy
   {
      
      public function BlueEnemyTwo()
      {
         super();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new BlueEnemyTwoMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


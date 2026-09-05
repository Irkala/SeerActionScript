package aero.enemies.Boss
{
   import flash.display.MovieClip;
   
   public class BossThree extends Boss
   {
      
      public function BossThree()
      {
         super();
         this.hp = 25;
         this.destroyTypeArr = [1];
      }
      
      override public function getMC() : MovieClip
      {
         mc = new BossThreeMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


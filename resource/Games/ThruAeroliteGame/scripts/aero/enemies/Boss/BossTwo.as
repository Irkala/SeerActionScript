package aero.enemies.Boss
{
   import flash.display.MovieClip;
   
   public class BossTwo extends Boss
   {
      
      public function BossTwo()
      {
         super();
         this.hp = 20;
         this.destroyTypeArr = [0];
         vx = this.speed * Math.random() + 2;
         vy = -this.speed * Math.random();
      }
      
      override public function getMC() : MovieClip
      {
         mc = new BossTwoMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


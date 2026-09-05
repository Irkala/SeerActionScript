package aero.enemies
{
   import aero.Aircraft;
   import explodes.Explode;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   
   public class RedEnemy extends Aircraft
   {
      
      public function RedEnemy()
      {
         super();
         this.speed = Math.random() * 15 + 5;
         this.hp = 1;
         this.execution = 1;
         this.fireable = false;
         this.explodeType = Explode.Unit_EXPLODE;
         this.destroyTypeArr = [0];
         this.hurtEnemyType = 0;
      }
      
      override protected function move() : void
      {
         if(this.fireable)
         {
            fire();
         }
         super.move();
      }
      
      override public function changeStatus() : void
      {
         if(mc)
         {
            mc.gotoAndStop(2);
            setTimeout(function():void
            {
               mc.gotoAndStop(1);
            },500);
         }
      }
      
      override public function getMC() : MovieClip
      {
         mc = new RedEnemyMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


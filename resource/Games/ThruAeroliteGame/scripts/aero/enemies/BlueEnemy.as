package aero.enemies
{
   import aero.Aircraft;
   import explodes.Explode;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   
   public class BlueEnemy extends Aircraft
   {
      
      public function BlueEnemy()
      {
         super();
         this.hp = 1;
         this.execution = 1;
         this.fireable = false;
         this.speed = Math.random() * 15 + 5;
         this.explodeType = Explode.Unit_EXPLODE;
         this.destroyTypeArr = [1];
         this.hurtEnemyType = 1;
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
         mc = new BlueEnemyMC();
         mc.gotoAndStop(1);
         return mc;
      }
   }
}


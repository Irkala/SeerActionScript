package aero.enemies.Boss
{
   import aero.Aircraft;
   import explodes.Explode;
   import flash.utils.setTimeout;
   
   public class Boss extends Aircraft
   {
      
      protected var vx:Number;
      
      protected var vy:Number;
      
      public function Boss()
      {
         super();
         this.hp = 25;
         this.execution = 20;
         this.fireable = false;
         this.explodeType = Explode.Boss_EXPLODE;
         this.destroyTypeArr = [0];
         this.speed = 4;
         vx = this.speed * Math.random() + 2;
         vy = this.speed * Math.random();
      }
      
      override protected function move() : void
      {
         hitTest();
         if(this.x <= 5 || this.x >= GameSettings.sceneWidth - this.width - 5)
         {
            vx *= -1;
         }
         if(this.y <= 5 || this.y >= GameSettings.sceneHeight - this.height - 5)
         {
            vy *= -1;
         }
         this.x -= vx;
         this.y -= vy;
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
   }
}


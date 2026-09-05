package aero.enemies.Boss
{
   public class BossFour extends BossOne
   {
      
      protected var vx:Number;
      
      protected var vy:Number;
      
      public function BossFour()
      {
         super();
         this.scaleX = 0.5;
         this.scaleY = 0.5;
         this.hp = 30;
         this.speed = 4;
         vx = this.speed * Math.random() + 2;
         vy = this.speed * Math.random() + 2;
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
         this.y += vy;
      }
   }
}


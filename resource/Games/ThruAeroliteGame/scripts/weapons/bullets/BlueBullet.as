package weapons.bullets
{
   import flash.display.MovieClip;
   
   public class BlueBullet extends Bullet
   {
      
      public function BlueBullet()
      {
         super();
         execution = 1;
         speed = -20;
         hurtEnemyType = 0;
      }
      
      override public function getMC() : MovieClip
      {
         return new BlueBulletMC();
      }
   }
}


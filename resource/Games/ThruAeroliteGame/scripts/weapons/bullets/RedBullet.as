package weapons.bullets
{
   import flash.display.MovieClip;
   
   public class RedBullet extends Bullet
   {
      
      public function RedBullet()
      {
         super();
         execution = 1;
         speed = -20;
         hurtEnemyType = 1;
      }
      
      override public function getMC() : MovieClip
      {
         return new RedBulletMC();
      }
   }
}


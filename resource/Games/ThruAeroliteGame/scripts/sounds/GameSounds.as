package sounds
{
   import flash.media.Sound;
   
   public class GameSounds
   {
      
      public static const bgSound:Sound = new BgSound();
      
      public static const shootSound:Sound = new ShootSound();
      
      public static const uintExplodeSound:Sound = new UnitExplodeSound();
      
      public static const bossExplodeSound:Sound = new BossExplodeSound();
      
      public function GameSounds()
      {
         super();
      }
   }
}


package gunCon
{
   import flash.display.MovieClip;
   
   public class Gun4 extends BaseGun implements IGun
   {
      
      public function Gun4()
      {
         super();
      }
      
      override public function getBulletTye() : String
      {
         return "TYPE_4";
      }
      
      public function keepShop() : void
      {
      }
      
      override public function getMC() : MovieClip
      {
         return new GunShoot4();
      }
      
      override public function getDelay() : Number
      {
         return 150;
      }
   }
}


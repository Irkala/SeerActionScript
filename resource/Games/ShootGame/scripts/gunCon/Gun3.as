package gunCon
{
   import flash.display.MovieClip;
   
   public class Gun3 extends BaseGun implements IGun
   {
      
      public function Gun3()
      {
         super();
      }
      
      override public function getBulletTye() : String
      {
         return "TYPE_3";
      }
      
      public function keepShop() : void
      {
      }
      
      override public function getMC() : MovieClip
      {
         return new GunShoot3();
      }
      
      override public function getDelay() : Number
      {
         return 500;
      }
   }
}


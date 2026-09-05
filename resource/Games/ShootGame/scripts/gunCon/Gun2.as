package gunCon
{
   import flash.display.MovieClip;
   
   public class Gun2 extends BaseGun implements IGun
   {
      
      public function Gun2()
      {
         super();
      }
      
      override public function getBulletTye() : String
      {
         return "TYPE_2";
      }
      
      public function keepShop() : void
      {
      }
      
      override public function getMC() : MovieClip
      {
         return new GunShoot2();
      }
      
      override public function getDelay() : Number
      {
         return 400;
      }
   }
}


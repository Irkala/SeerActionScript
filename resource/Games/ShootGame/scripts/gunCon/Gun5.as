package gunCon
{
   import flash.display.MovieClip;
   
   public class Gun5 extends BaseGun implements IGun
   {
      
      public function Gun5()
      {
         super();
      }
      
      override public function getBulletTye() : String
      {
         return "TYPE_5";
      }
      
      public function keepShop() : void
      {
      }
      
      override public function getMC() : MovieClip
      {
         return new GunShoot5();
      }
      
      override public function getDelay() : Number
      {
         return 120;
      }
   }
}


package gunCon
{
   import flash.display.MovieClip;
   
   public class Gun1 extends BaseGun implements IGun
   {
      
      public function Gun1()
      {
         super();
      }
      
      override public function getBulletTye() : String
      {
         return "TYPE_1";
      }
      
      public function keepShop() : void
      {
      }
      
      override public function getMC() : MovieClip
      {
         return new GunShoot1();
      }
      
      override public function getDelay() : Number
      {
         return 250;
      }
   }
}


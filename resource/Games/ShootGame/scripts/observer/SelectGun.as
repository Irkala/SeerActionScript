package observer
{
   import flash.events.Event;
   
   public class SelectGun
   {
      
      public static var alpha1:Number = 0;
      
      public static var alpha2:Number = 0;
      
      public static var alpha3:Number = 0;
      
      public static var alpha4:Number = 0;
      
      public static var alpha5:Number = 0;
      
      public function SelectGun()
      {
         super();
      }
      
      public static function select() : void
      {
         BuyGunObserver.gunLike.addEventListener(Event.ENTER_FRAME,standard);
      }
      
      private static function standard(e:Event) : void
      {
         BuyGunObserver.gunLike.GunLike1.alpha = alpha1;
         BuyGunObserver.gunLike.GunLike2.alpha = alpha2;
         BuyGunObserver.gunLike.GunLike3.alpha = alpha3;
         BuyGunObserver.gunLike.GunLike4.alpha = alpha4;
         BuyGunObserver.gunLike.GunLike5.alpha = alpha5;
         if(BuyGunObserver.gunChange1 == "gun1")
         {
            BuyGunObserver.gunLike.GunLike1.scaleX = BuyGunObserver.gunLike.GunLike1.scaleY = 1.3;
            BuyGunObserver.gunLike.GunLike2.scaleX = BuyGunObserver.gunLike.GunLike2.scaleY = 1;
            BuyGunObserver.gunLike.GunLike3.scaleX = BuyGunObserver.gunLike.GunLike3.scaleY = 1;
            BuyGunObserver.gunLike.GunLike4.scaleX = BuyGunObserver.gunLike.GunLike4.scaleY = 1;
            BuyGunObserver.gunLike.GunLike5.scaleX = BuyGunObserver.gunLike.GunLike5.scaleY = 1;
         }
         else if(BuyGunObserver.gunChange1 == "gun2")
         {
            BuyGunObserver.gunLike.GunLike1.scaleX = BuyGunObserver.gunLike.GunLike1.scaleY = 1;
            BuyGunObserver.gunLike.GunLike2.scaleX = BuyGunObserver.gunLike.GunLike2.scaleY = 1.3;
            BuyGunObserver.gunLike.GunLike3.scaleX = BuyGunObserver.gunLike.GunLike3.scaleY = 1;
            BuyGunObserver.gunLike.GunLike4.scaleX = BuyGunObserver.gunLike.GunLike4.scaleY = 1;
            BuyGunObserver.gunLike.GunLike5.scaleX = BuyGunObserver.gunLike.GunLike5.scaleY = 1;
         }
         else if(BuyGunObserver.gunChange1 == "gun3")
         {
            BuyGunObserver.gunLike.GunLike1.scaleX = BuyGunObserver.gunLike.GunLike1.scaleY = 1;
            BuyGunObserver.gunLike.GunLike2.scaleX = BuyGunObserver.gunLike.GunLike2.scaleY = 1;
            BuyGunObserver.gunLike.GunLike3.scaleX = BuyGunObserver.gunLike.GunLike3.scaleY = 1.3;
            BuyGunObserver.gunLike.GunLike4.scaleX = BuyGunObserver.gunLike.GunLike4.scaleY = 1;
            BuyGunObserver.gunLike.GunLike5.scaleX = BuyGunObserver.gunLike.GunLike5.scaleY = 1;
         }
         else if(BuyGunObserver.gunChange1 == "gun4")
         {
            BuyGunObserver.gunLike.GunLike1.scaleX = BuyGunObserver.gunLike.GunLike1.scaleY = 1;
            BuyGunObserver.gunLike.GunLike2.scaleX = BuyGunObserver.gunLike.GunLike2.scaleY = 1;
            BuyGunObserver.gunLike.GunLike3.scaleX = BuyGunObserver.gunLike.GunLike3.scaleY = 1;
            BuyGunObserver.gunLike.GunLike4.scaleX = BuyGunObserver.gunLike.GunLike4.scaleY = 1.3;
            BuyGunObserver.gunLike.GunLike5.scaleX = BuyGunObserver.gunLike.GunLike5.scaleY = 1;
         }
         else if(BuyGunObserver.gunChange1 == "gun5")
         {
            BuyGunObserver.gunLike.GunLike1.scaleX = BuyGunObserver.gunLike.GunLike1.scaleY = 1;
            BuyGunObserver.gunLike.GunLike2.scaleX = BuyGunObserver.gunLike.GunLike2.scaleY = 1;
            BuyGunObserver.gunLike.GunLike3.scaleX = BuyGunObserver.gunLike.GunLike3.scaleY = 1;
            BuyGunObserver.gunLike.GunLike4.scaleX = BuyGunObserver.gunLike.GunLike4.scaleY = 1;
            BuyGunObserver.gunLike.GunLike5.scaleX = BuyGunObserver.gunLike.GunLike5.scaleY = 1.3;
         }
      }
   }
}


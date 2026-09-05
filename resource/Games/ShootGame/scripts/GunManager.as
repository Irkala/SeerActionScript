package
{
   import bullet.BaseBullet;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import gunCon.BaseGun;
   import observer.BuyGunObserver;
   import observer.LevelObserver;
   
   public class GunManager
   {
      
      public static var gun:BaseGun;
      
      public static var icon:MovieClip;
      
      public static var isDown:Boolean = false;
      
      public static var mouseBool:Boolean = true;
      
      private static var dict:Dictionary = new Dictionary();
      
      public function GunManager()
      {
         super();
      }
      
      public static function setGun(i:BaseGun) : void
      {
         var gunType:String = null;
         var b:BaseBullet = null;
         if(gun)
         {
            gun.clear();
         }
         gun = i;
         if(icon)
         {
            if(icon.parent)
            {
               icon.parent.removeChild(icon);
               icon.removeEventListener(Event.ENTER_FRAME,mouseMoveHandler);
            }
         }
         if(gun)
         {
            gunType = gun.getBulletTye();
            b = dict[gunType];
            if(b)
            {
               gun.bul = b;
            }
            icon = i.gunIcon;
            icon.addEventListener(Event.ENTER_FRAME,mouseMoveHandler);
         }
      }
      
      public static function buyBullet(key:String, bullet:BaseBullet) : void
      {
         dict[key] = bullet;
         if(BuyGunObserver.gunChange1)
         {
            if(gun.getBulletTye() == key)
            {
               gun.bul = bullet;
            }
         }
      }
      
      public static function off() : void
      {
      }
      
      private static function mouseMoveHandler(event:Event) : void
      {
         if(mouseBool == true)
         {
            icon.x = ShootGame.getRoot().mouseX;
            icon.y = ShootGame.getRoot().mouseY;
         }
         else
         {
            icon.removeEventListener(Event.ENTER_FRAME,mouseMoveHandler);
         }
      }
      
      private static function downHandler(event:MouseEvent) : void
      {
         var gunType:String = gun.getBulletTye();
         var b:BaseBullet = dict[gunType];
         if(b)
         {
            gun.bul = b;
            trace(b.num);
            if(b.num > 0)
            {
               isDown = true;
               if(LevelObserver.addBool == true)
               {
                  gun.keepShot();
                  shot();
               }
            }
         }
      }
      
      private static function shot() : void
      {
         gun.shot();
      }
      
      private static function upHandler(event:MouseEvent) : void
      {
         gun.stopShot();
         isDown = false;
      }
      
      public static function show() : void
      {
         ShootGame.getRoot().addChild(icon);
      }
      
      public static function on() : void
      {
         ShootGame.getStage().addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
         ShootGame.getStage().addEventListener(MouseEvent.MOUSE_UP,upHandler);
      }
   }
}


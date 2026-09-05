package weapons.bullets
{
   import com.ming.managers.utils.display.DisplayUtil;
   import com.ming.managers.utils.move.Moving;
   import flash.display.MovieClip;
   import interfaces.IGetMC;
   import weapons.Weapons;
   
   public class Bullet extends Weapons implements IGetMC
   {
      
      protected var angle:Number;
      
      public function Bullet()
      {
         super();
         execution = 1;
         angle = -90;
         speed = 5;
         this.addChild(getMC());
      }
      
      override protected function move() : void
      {
         if(this.bRebound)
         {
            this.rebound(this);
            return;
         }
         Moving.moveBeelline(this,speed,angle);
         if(this.erasable)
         {
            DisplayUtil.removeAllChild(this);
            this.removeEvent();
         }
      }
      
      public function getMC() : MovieClip
      {
         return null;
      }
   }
}


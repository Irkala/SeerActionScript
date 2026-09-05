package aero
{
   import com.ming.managers.utils.display.DisplayUtil;
   import flash.display.MovieClip;
   import flash.utils.setTimeout;
   import interfaces.IFire;
   import interfaces.IGetMC;
   import layers.Layer;
   
   public class Aircraft extends Aero implements IFire, IGetMC
   {
      
      public var bulletType:Object;
      
      protected var bulletNum:uint;
      
      public var rocketType:Object;
      
      public var bulletLayer:Layer;
      
      public var fireable:Boolean;
      
      protected var rocketNum:uint;
      
      protected var mc:MovieClip;
      
      public function Aircraft()
      {
         super();
         this.speed = 1;
         this.tmpxSpeed = 0;
         this.tmpySpeed = 0;
         this.addChild(getMC());
      }
      
      public function changeStatus() : void
      {
      }
      
      override public function creatProtector() : void
      {
         if(mc)
         {
            mc.gotoAndStop("protector");
            setTimeout(function():void
            {
               mc.gotoAndStop(1);
            },500);
         }
      }
      
      override protected function move() : void
      {
         this.x -= speed;
         hitTest();
         if(this.erasable)
         {
            DisplayUtil.removeAllChild(this);
         }
      }
      
      public function getMC() : MovieClip
      {
         return mc;
      }
      
      public function fire() : void
      {
      }
   }
}


package com.robot.module.task.YoufuHideAndSeekTask
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   import gs.TweenLite;
   
   public class Cloud extends Sprite
   {
      
      public var hasChild:Boolean = false;
      
      public var mc:MovieClip = null;
      
      public var position:Point = null;
      
      public function Cloud(p:Point)
      {
         super();
         position = p;
         mc = new CloudMC();
         this.addChild(mc);
         this.x = p.x;
         this.y = p.y;
      }
      
      public function move(point:Point) : void
      {
         TweenLite.to(this,0.2,{
            "x":point.x,
            "y":point.y
         });
      }
      
      public function containsYoufu(m:MovieClip) : void
      {
         this.addChildAt(m,0);
         m.x = mc.x - 8;
         m.y = mc.y - 102;
         m.play();
      }
   }
}


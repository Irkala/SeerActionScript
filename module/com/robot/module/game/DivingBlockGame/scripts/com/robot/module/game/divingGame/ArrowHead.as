package com.robot.module.game.divingGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class ArrowHead extends Sprite
   {
      
      public static const range:Number = 200;
      
      public var mc:MovieClip;
      
      public function ArrowHead()
      {
         super();
         mc = new ArrowHeadMC();
         this.addChild(mc);
      }
   }
}


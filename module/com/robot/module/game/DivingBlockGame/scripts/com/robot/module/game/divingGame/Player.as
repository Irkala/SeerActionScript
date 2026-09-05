package com.robot.module.game.divingGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class Player extends Sprite
   {
      
      public var mc:MovieClip;
      
      public function Player()
      {
         super();
         mc = new PlayerMC();
         mc.gotoAndStop(1);
         this.addChild(mc);
      }
   }
}


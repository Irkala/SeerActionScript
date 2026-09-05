package com.robot.module.game.divingGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class Barrier extends Sprite
   {
      
      public var mc:MovieClip;
      
      public function Barrier()
      {
         super();
         mc = new BirdMC();
         this.addChild(mc);
      }
   }
}


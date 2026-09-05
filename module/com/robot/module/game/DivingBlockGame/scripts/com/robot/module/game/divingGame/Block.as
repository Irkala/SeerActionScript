package com.robot.module.game.divingGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class Block extends Sprite
   {
      
      private var mc:MovieClip;
      
      public function Block()
      {
         super();
         mc = new BlockMC();
         this.addChild(mc);
      }
   }
}


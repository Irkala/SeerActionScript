package com.robot.module.game.divingGame
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   
   public class BarrierBlock extends Sprite
   {
      
      public var hitMC:MovieClip;
      
      private var barrier:MovieClip;
      
      public function BarrierBlock()
      {
         super();
         barrier = new BarrierMC();
         this.addChild(barrier);
         hitMC = barrier["hitMC"];
      }
   }
}


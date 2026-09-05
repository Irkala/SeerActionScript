package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.shotBehavior.EmptyShot;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class BaseShotSprite extends Sprite implements IShotSprite
   {
      
      protected var attack:Number = 0;
      
      protected var _row:uint;
      
      protected var hitMC:MovieClip;
      
      protected var oldIndex:uint;
      
      protected var shotBehavior:IShotBehavior;
      
      protected var life:int;
      
      protected var hitPoint:Point = new Point();
      
      public function BaseShotSprite()
      {
         super();
         hitMC = new plants_hit_mc();
         shotBehavior = getShot();
      }
      
      public function set xIndex(i:uint) : void
      {
         oldIndex = i;
      }
      
      public function get bmp() : Bitmap
      {
         return null;
      }
      
      public function hit(attack:uint) : void
      {
         life -= attack;
         if(life <= 0)
         {
            destroy();
         }
      }
      
      public function get sprite() : Sprite
      {
         return this;
      }
      
      public function get row() : uint
      {
         return _row;
      }
      
      public function shot() : void
      {
      }
      
      public function destroy() : void
      {
         if(shotBehavior)
         {
            shotBehavior.destroy();
            shotBehavior = null;
         }
      }
      
      protected function getShot() : IShotBehavior
      {
         return new EmptyShot(this,0);
      }
      
      public function get xIndex() : uint
      {
         return oldIndex;
      }
      
      public function set row(i:uint) : void
      {
         _row = i;
      }
   }
}


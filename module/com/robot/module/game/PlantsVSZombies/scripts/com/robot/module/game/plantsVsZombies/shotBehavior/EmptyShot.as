package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   
   public class EmptyShot extends BaseShotBehavior implements IShotBehavior
   {
      
      public function EmptyShot(sprite:BaseShotSprite, attak:Number)
      {
         super(sprite,attak);
      }
      
      override public function start() : void
      {
      }
      
      override public function stop() : void
      {
      }
   }
}


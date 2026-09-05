package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.module.game.plantsVsZombies.plants.BasePlants;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class Shot_3 extends BaseShotBehavior implements IShotBehavior
   {
      
      public function Shot_3(sprite:BaseShotSprite, attack:Number)
      {
         super(sprite,attack);
         offSet = new Point(51,-19);
      }
      
      override protected function getMC() : MovieClip
      {
         return new plants_shot_mc_3();
      }
      
      override protected function playMovie() : void
      {
         BasePlants(sprite).movie.gotoAndStop(2);
         timeOut = setTimeout(function():void
         {
            endyMovie();
         },500);
      }
   }
}


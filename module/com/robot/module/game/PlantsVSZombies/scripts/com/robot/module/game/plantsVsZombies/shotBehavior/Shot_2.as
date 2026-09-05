package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.module.game.plantsVsZombies.plants.BasePlants;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import flash.display.MovieClip;
   import flash.geom.Point;
   import flash.utils.setTimeout;
   
   public class Shot_2 extends BaseShotBehavior implements IShotBehavior
   {
      
      public function Shot_2(sprite:BaseShotSprite, attack:Number)
      {
         super(sprite,attack);
         offSet = new Point(60,-22);
      }
      
      override protected function getMC() : MovieClip
      {
         return new plants_shot_mc_2();
      }
      
      override protected function playMovie() : void
      {
         BasePlants(sprite).movie.gotoAndStop(2);
         timeOut = setTimeout(function():void
         {
            endyMovie();
         },300);
      }
   }
}


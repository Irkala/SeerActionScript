package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   public class BossShot extends BaseShotBehavior implements IShotBehavior
   {
      
      public function BossShot(sprite:BaseShotSprite, attack:Number)
      {
         super(sprite,attack);
         offSet = new Point(13,-55);
         dir = -1;
      }
      
      override protected function getMC() : MovieClip
      {
         return new plants_shot_mc_4();
      }
      
      override protected function onEnterFrameHandler(event:Event) : void
      {
         var i:BasePlantsGrid = null;
         bulletMC.x += speed * dir;
         if(bulletMC.x < -50)
         {
            stop();
            return;
         }
         var array:Array = GridDataManager.getList(sprite.row);
         for each(i in array)
         {
            if(i.plantes)
            {
               if(i.plantes.sprite.hitTestObject(bulletMC))
               {
                  bulletMC.removeEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
                  DisplayUtil.removeForParent(bulletMC,false);
                  continueShot();
                  i.plantes.hit(attack);
               }
            }
         }
      }
   }
}


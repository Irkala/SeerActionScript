package com.robot.module.game.plantsVsZombies.shotBehavior.bullet
{
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.taomee.utils.DisplayUtil;
   
   public class BossBullet extends Sprite
   {
      
      public static const CONTINUE:String = "continue";
      
      private var speed:int;
      
      private var bulletMC:MovieClip;
      
      private var row:int;
      
      private var attack:int;
      
      public function BossBullet(row:int, speed:uint, attack:uint)
      {
         super();
         this.row = row;
         this.speed = speed;
         this.attack = attack;
         bulletMC = new plants_shot_mc_4();
         bulletMC.cacheAsBitmap = true;
         addChild(bulletMC);
         this.addEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
      }
      
      public function destroy() : void
      {
         dispatchEvent(new Event(Event.CLOSE));
         DisplayUtil.removeForParent(this);
         this.removeEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
         bulletMC = null;
      }
      
      private function onEnterFrameHandler(event:Event) : void
      {
         var i:BasePlantsGrid = null;
         if(row < 0 || row > 3)
         {
            destroy();
            return;
         }
         this.x += speed * -1;
         if(this.x < -50)
         {
            destroy();
            return;
         }
         var array:Array = GridDataManager.getList(this.row);
         for each(i in array)
         {
            if(i.plantes)
            {
               if(i.plantes.sprite.hitTestObject(this))
               {
                  this.removeEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
                  DisplayUtil.removeForParent(this,false);
                  dispatchEvent(new Event(CONTINUE));
                  i.plantes.hit(attack);
               }
            }
         }
      }
   }
}


package com.robot.module.game.plantsVsZombies.enemy
{
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import com.robot.module.game.plantsVsZombies.ob.MushRoomManager;
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import com.robot.module.game.plantsVsZombies.plants.IPlants;
   import com.robot.module.game.plantsVsZombies.plants.IShotSprite;
   import com.robot.module.game.plantsVsZombies.plants.Mushroom;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.media.Sound;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import gs.TweenLite;
   import org.taomee.effect.ColorFilter;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseEnemy extends BaseShotSprite implements IShotSprite
   {
      
      protected var timer:Timer;
      
      protected var _speed:Number;
      
      protected var gridArray:Array = [];
      
      protected var sound:Sound;
      
      protected var mc:PlanteMovie;
      
      protected var mushrooms:Mushroom;
      
      protected var oldSpeed:Number;
      
      protected var cd:uint = 2;
      
      protected var food:IPlants;
      
      protected var isCanEat:Boolean = true;
      
      public function BaseEnemy()
      {
         super();
         mc = getMC();
         addChild(mc);
         oldSpeed = _speed = 0.4;
         this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
      }
      
      protected function onEnterFrame(event:Event) : void
      {
         var i:BasePlantsGrid = null;
         this.x -= _speed;
         if(this.x < -20)
         {
            destroy();
            EnemyManager.dispatchEvent(new EnemyEvent(EnemyEvent.LOST));
            return;
         }
         var index:uint = Math.floor(this.x / GridDataManager.gridDim.width);
         if(index != oldIndex)
         {
            oldIndex = index;
            EnemyManager.dispatchEvent(new EnemyEvent(EnemyEvent.GRID_CHANGE,this.row,this));
         }
         if(mushrooms)
         {
            if(this.hitTestObject(mushrooms) || mushrooms.localToGlobal(new Point()).x > this.localToGlobal(new Point()).x)
            {
               this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
               _speed = 0;
               mushrooms.hit(attack);
               destroy();
               return;
            }
         }
         var b:Boolean = false;
         for each(i in gridArray)
         {
            if(i.isPut)
            {
               if(this.hitTestObject(i.plantes.sprite) && i.isPut && i.x + i.plantes.sprite.x + 20 < this.x)
               {
                  b = true;
                  _speed = 0;
                  if(food != i.plantes)
                  {
                     food = i.plantes;
                     eatFood();
                  }
               }
            }
         }
         if(!b)
         {
            _speed = oldSpeed;
         }
      }
      
      private function remove() : void
      {
         TweenLite.to(this,1,{
            "alpha":0,
            "onComplete":onComp
         });
      }
      
      private function onComp() : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      override public function hit(attack:uint) : void
      {
         hitMC.x = hitPoint.x;
         hitMC.y = hitPoint.y;
         hitMC.gotoAndPlay(1);
         addChild(hitMC);
         setTimeout(function():void
         {
            DisplayUtil.removeForParent(hitMC);
         },500);
         super.hit(attack);
      }
      
      private function onTimerHandler(event:TimerEvent) : void
      {
         isCanEat = true;
         eatFood();
      }
      
      protected function eatFood() : void
      {
         if(!isCanEat)
         {
            return;
         }
         if(timer)
         {
            timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
         }
         timer = new Timer(cd * 1000,1);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
         timer.start();
         food.hit(attack);
         isCanEat = false;
      }
      
      protected function getMC() : PlanteMovie
      {
         return null;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         mc.destroy();
         mc = null;
         if(timer)
         {
            timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
            timer = null;
         }
         gridArray = [];
         mushrooms = null;
         EnemyManager.remove(this.row,this);
         DisplayUtil.stopAllMovieClip(this);
         this.filters = [ColorFilter.setGrayscale()];
         setTimeout(remove,1500);
         sound = null;
      }
      
      override public function set row(i:uint) : void
      {
         super.row = i;
         gridArray = GridDataManager.getList(row);
         mushrooms = MushRoomManager.getMushroom(this.row);
      }
   }
}


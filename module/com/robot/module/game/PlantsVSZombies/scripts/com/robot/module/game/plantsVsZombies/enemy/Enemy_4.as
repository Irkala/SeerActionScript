package com.robot.module.game.plantsVsZombies.enemy
{
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.shotBehavior.BossShot;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class Enemy_4 extends BaseEnemy
   {
      
      public function Enemy_4()
      {
         super();
         life = 100;
         hitPoint = new Point(10,-90);
         checkIsCanShot();
      }
      
      override protected function getShot() : IShotBehavior
      {
         attack = 2;
         return new BossShot(this,attack);
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10016]);
      }
      
      override protected function onEnterFrame(event:Event) : void
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
            checkIsCanShot();
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
                     shotBehavior.stop();
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
      
      private function checkIsCanShot() : void
      {
         var i:BasePlantsGrid = null;
         var array:Array = GridDataManager.getList(row);
         var b:Boolean = false;
         for each(i in array)
         {
            if(i.plantes)
            {
               if(i.plantes.xIndex >= xIndex - 4)
               {
                  b = true;
                  break;
               }
            }
         }
         if(b)
         {
            shotBehavior.start();
         }
      }
   }
}


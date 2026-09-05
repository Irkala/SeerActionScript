package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.module.game.plantsVsZombies.enemy.BaseEnemy;
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.event.PlantsEvent;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import com.robot.module.game.plantsVsZombies.shotBehavior.EmptyShot;
   import com.robot.module.game.plantsVsZombies.shotBehavior.IShotBehavior;
   
   public class BasePlants extends BaseShotSprite implements IPlants
   {
      
      protected var shotDis:uint;
      
      protected var mc:PlanteMovie;
      
      public function BasePlants()
      {
         super();
         mc = getMC();
         mc.gotoAndStop(3);
         addChild(mc);
         EnemyManager.addEventListener(EnemyEvent.ENEMY_CREATED,onCreateEnemy);
         EnemyManager.addEventListener(EnemyEvent.ENEMY_CLEARD,onClearEnemy);
         EnemyManager.addEventListener(EnemyEvent.GRID_CHANGE,onGridChange);
         shotDis = 3;
      }
      
      override public function set row(value:uint) : void
      {
         var b:Boolean = false;
         var i:BaseEnemy = null;
         super.row = value;
         var array:Array = EnemyManager.getList(row);
         if(array)
         {
            if(array.length > 0)
            {
               b = true;
               for each(i in array)
               {
                  if(i.xIndex <= shotDis + xIndex)
                  {
                     b = false;
                     break;
                  }
               }
               if(!b)
               {
                  shotBehavior.start();
               }
            }
         }
      }
      
      protected function onClearEnemy(event:EnemyEvent) : void
      {
         var i:BaseEnemy = null;
         var array:Array = EnemyManager.getList(row);
         if(!array)
         {
            if(shotBehavior)
            {
               shotBehavior.stop();
            }
            return;
         }
         if(array.length == 0)
         {
            shotBehavior.stop();
            return;
         }
         var b:Boolean = true;
         for each(i in array)
         {
            if(i.xIndex <= shotDis + xIndex)
            {
               b = false;
               break;
            }
         }
         if(b)
         {
            shotBehavior.stop();
            return;
         }
      }
      
      override public function hit(attack:uint) : void
      {
         life -= attack;
         if(life <= 0)
         {
            dispatchEvent(new PlantsEvent(PlantsEvent.DIE));
         }
      }
      
      protected function getMC() : PlanteMovie
      {
         return null;
      }
      
      public function get movie() : PlanteMovie
      {
         return mc;
      }
      
      protected function onGridChange(event:EnemyEvent) : void
      {
         if(event.row == this.row && shotDis + xIndex >= event.enemy.xIndex)
         {
            shotBehavior.start();
         }
      }
      
      override protected function getShot() : IShotBehavior
      {
         return new EmptyShot(this,attack);
      }
      
      override public function destroy() : void
      {
         EnemyManager.removeEventListener(EnemyEvent.ENEMY_CREATED,onCreateEnemy);
         EnemyManager.removeEventListener(EnemyEvent.ENEMY_CLEARD,onClearEnemy);
         EnemyManager.removeEventListener(EnemyEvent.GRID_CHANGE,onGridChange);
         super.destroy();
         mc.destroy();
         mc = null;
      }
      
      protected function onCreateEnemy(event:EnemyEvent) : void
      {
         if(event.row == this.row && shotDis + xIndex >= event.enemy.xIndex)
         {
            shotBehavior.start();
         }
      }
   }
}


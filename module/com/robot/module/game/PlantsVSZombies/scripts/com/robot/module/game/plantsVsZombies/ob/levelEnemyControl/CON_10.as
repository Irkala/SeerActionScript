package com.robot.module.game.plantsVsZombies.ob.levelEnemyControl
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.enemy.*;
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CON_10 extends CON_1 implements IEnemyController
   {
      
      private const TIME_TYPE_3:uint = 4;
      
      private const TIME_TYPE_4:uint = 3;
      
      private const TIME_TYPE_6:uint = 10;
      
      private const TIME_TYPE_5:uint = 8;
      
      private const TIME_TYPE_1:uint = 4;
      
      private const TIME_TYPE_2:uint = 4;
      
      public function CON_10()
      {
         super();
      }
      
      override protected function onTimerHandler(event:TimerEvent) : void
      {
         var type:uint = 0;
         var round:uint = 0;
         var num:uint = 0;
         var enemy:BaseEnemy = null;
         ++second;
         if(second > 80)
         {
            createTimer.stop();
            timer.stop();
            num = Math.floor(Math.random() * 4);
            enemy = new Enemy_5();
            enemy.row = num;
            EnemyManager.map.getValue(num).push(enemy);
            enemy.sprite.x = MainManager.getStageWidth() + 200;
            enemy.sprite.y = GridDataManager.gridDim.height * (num + 1) + GridDataManager.offSet.y;
            enemy.xIndex = Math.floor(enemy.sprite.x / GridDataManager.gridDim.width);
            EnemyManager.dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_CREATED,num,enemy));
            createTimer.stop();
            timer.stop();
            return;
         }
         if(second > 65)
         {
            complete();
            createNum = 25;
            lineNum = 4;
            round = 6;
            type = TIME_TYPE_6;
         }
         else if(second > 45)
         {
            complete();
            createNum = 25;
            lineNum = 4;
            round = 5;
            type = TIME_TYPE_5;
         }
         else if(second > 29)
         {
            createNum = 8;
            lineNum = 4;
            round = 4;
            type = TIME_TYPE_4;
         }
         else if(second > 21)
         {
            createNum = 8;
            lineNum = 4;
            round = 3;
            type = TIME_TYPE_3;
            enemyArray = [Enemy_1,Enemy_2,Enemy_3];
         }
         else if(second > 9)
         {
            createNum = 4;
            lineNum = 3;
            round = 2;
            type = TIME_TYPE_2;
            enemyArray = [Enemy_1,Enemy_2];
         }
         else
         {
            createNum = 2;
            lineNum = 2;
            round = 1;
            type = TIME_TYPE_1;
            enemyArray = [Enemy_1];
         }
         if(!obj[round.toString()])
         {
            isNew = true;
            obj[round.toString()] = true;
            createTimer.stop();
            createTimer.removeEventListener(TimerEvent.TIMER,onCreate);
            createTimer = new Timer(type * 1000,1);
            createTimer.addEventListener(TimerEvent.TIMER,onCreate);
            createTimer.start();
         }
      }
      
      override public function setup() : void
      {
         createTimer = new Timer(TIME_TYPE_1 * 1000,1);
         timer = new Timer(1000);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
      }
   }
}


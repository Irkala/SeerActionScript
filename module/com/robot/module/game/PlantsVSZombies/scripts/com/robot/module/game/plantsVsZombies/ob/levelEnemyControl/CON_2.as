package com.robot.module.game.plantsVsZombies.ob.levelEnemyControl
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.enemy.*;
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CON_2 extends CON_1 implements IEnemyController
   {
      
      private const TIME_TYPE_3:uint = 2;
      
      private const TIME_TYPE_4:uint = 2;
      
      private const TIME_TYPE_1:uint = 3;
      
      private const TIME_TYPE_2:uint = 3;
      
      public function CON_2()
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
         if(second >= 56)
         {
            num = Math.floor(Math.random() * 4);
            enemy = new Enemy_4();
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
         if(second > 46)
         {
            complete();
            createNum = 5;
            lineNum = 4;
            round = 4;
            type = TIME_TYPE_4;
         }
         else if(second > 31)
         {
            createNum = 3;
            lineNum = 4;
            round = 3;
            type = TIME_TYPE_3;
         }
         else if(second > 16)
         {
            createNum = 3;
            lineNum = 3;
            round = 2;
            type = TIME_TYPE_2;
         }
         else
         {
            createNum = 2;
            lineNum = 2;
            round = 1;
            type = TIME_TYPE_1;
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
         super.setup();
         enemyArray = [Enemy_1,Enemy_2];
      }
   }
}


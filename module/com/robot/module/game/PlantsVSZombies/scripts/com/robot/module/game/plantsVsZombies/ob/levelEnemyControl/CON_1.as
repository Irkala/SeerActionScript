package com.robot.module.game.plantsVsZombies.ob.levelEnemyControl
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.enemy.*;
   import com.robot.module.game.plantsVsZombies.event.EnemyEvent;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CON_1 extends EventDispatcher implements IEnemyController
   {
      
      protected var timer:Timer;
      
      protected var isNew:Boolean = true;
      
      private const TIME_TYPE_1:uint = 3;
      
      private const TIME_TYPE_2:uint = 3;
      
      private const TIME_TYPE_3:uint = 2;
      
      private const TIME_TYPE_4:uint = 2;
      
      protected var createTimer:Timer;
      
      protected var createNum:uint = 2;
      
      protected var enemyArray:Array = [Enemy_1];
      
      protected var lineNum:uint = 2;
      
      protected var second:uint;
      
      protected var obj:Object = {};
      
      public function CON_1()
      {
         super();
      }
      
      public function destroy() : void
      {
         stop();
         createTimer.removeEventListener(TimerEvent.TIMER,onCreate);
         createTimer = null;
         timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
         timer = null;
         obj = null;
      }
      
      public function stop() : void
      {
         createTimer.stop();
         timer.stop();
      }
      
      protected function onTimerHandler(event:TimerEvent) : void
      {
         var type:uint = 0;
         var round:uint = 0;
         ++second;
         if(second >= 60)
         {
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
      
      public function complete() : void
      {
         dispatchEvent(new EnemyEvent(EnemyEvent.CREATE_COMPLETE));
      }
      
      public function start() : void
      {
         createTimer.start();
         timer.start();
      }
      
      protected function onCreate(event:TimerEvent) : void
      {
         var num:uint = 0;
         var array:Array = null;
         var cls:Class = null;
         var enemy:BaseEnemy = null;
         for(var i:uint = 0; i < createNum; i++)
         {
            num = Math.floor(Math.random() * 4);
            if(!EnemyManager.map.containsKey(num))
            {
               EnemyManager.map.add(num,[]);
            }
            array = EnemyManager.map.getValue(num) as Array;
            while(array.length > lineNum && !isNew)
            {
               num = Math.floor(Math.random() * 4);
               if(!EnemyManager.map.containsKey(num))
               {
                  EnemyManager.map.add(num,[]);
               }
               array = EnemyManager.map.getValue(num) as Array;
            }
            cls = enemyArray[Math.floor(Math.random() * enemyArray.length)];
            enemy = new cls();
            enemy.row = num;
            EnemyManager.map.getValue(num).push(enemy);
            enemy.sprite.x = MainManager.getStageWidth() + array.length * 50;
            enemy.sprite.y = GridDataManager.gridDim.height * (num + 1) + GridDataManager.offSet.y - 20;
            enemy.xIndex = Math.floor(enemy.sprite.x / GridDataManager.gridDim.width);
            EnemyManager.dispatchEvent(new EnemyEvent(EnemyEvent.ENEMY_CREATED,num,enemy));
         }
         isNew = false;
      }
      
      public function setup() : void
      {
         createNum = 2;
         lineNum = 2;
         createTimer = new Timer(3000,1);
         timer = new Timer(1000);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
      }
   }
}


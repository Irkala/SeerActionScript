package com.robot.module.game.plantsVsZombies.ob.levelEnemyControl
{
   import com.robot.module.game.plantsVsZombies.enemy.*;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class CON_9 extends CON_1 implements IEnemyController
   {
      
      private const TIME_TYPE_3:uint = 4;
      
      private const TIME_TYPE_4:uint = 4;
      
      private const TIME_TYPE_6:uint = 10;
      
      private const TIME_TYPE_5:uint = 8;
      
      private const TIME_TYPE_1:uint = 4;
      
      private const TIME_TYPE_2:uint = 4;
      
      public function CON_9()
      {
         super();
      }
      
      override protected function onTimerHandler(event:TimerEvent) : void
      {
         var type:uint = 0;
         var round:uint = 0;
         ++second;
         if(second > 50)
         {
            createTimer.stop();
            timer.stop();
            return;
         }
         if(second > 45)
         {
            complete();
            createNum = 30;
            lineNum = 4;
            round = 6;
            type = TIME_TYPE_6;
         }
         else if(second > 35)
         {
            complete();
            createNum = 25;
            lineNum = 4;
            round = 5;
            type = TIME_TYPE_5;
         }
         else if(second > 24)
         {
            createNum = 10;
            lineNum = 4;
            round = 4;
            type = TIME_TYPE_4;
         }
         else if(second > 16)
         {
            createNum = 6;
            lineNum = 4;
            round = 3;
            type = TIME_TYPE_3;
            enemyArray = [Enemy_1,Enemy_2,Enemy_3];
         }
         else if(second > 8)
         {
            createNum = 3;
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


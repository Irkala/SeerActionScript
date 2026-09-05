package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.manager.PlantsGameManager;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import com.robot.module.game.plantsVsZombies.shotBehavior.bullet.BossBullet;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.taomee.utils.DisplayUtil;
   
   public class SuperBossShot extends BaseShotBehavior implements IShotBehavior
   {
      
      private var array:Array = [];
      
      public function SuperBossShot(sprite:BaseShotSprite, attack:Number)
      {
         super(sprite,attack);
         offSet = new Point(13,-55);
         dir = -1;
         useBullet = true;
      }
      
      override protected function bulletStart() : void
      {
         var q:int = 0;
         var bullet:BossBullet = null;
         timer = new Timer(cd * 1000,1);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
         var p:Point = sprite.localToGlobal(new Point());
         for(var i:uint = 0; i < 3; i++)
         {
            if(i == 0)
            {
               q = 0;
            }
            else if(i == 1)
            {
               q = -1;
            }
            else if(i == 2)
            {
               q = 1;
            }
            bullet = new BossBullet(sprite.row + q,speed,attack);
            bullet.x = p.x + offSet.x;
            bullet.y = p.y + offSet.y + GridDataManager.gridDim.height * q;
            PlantsGameManager.subject.container.addChild(bullet);
            bullet.addEventListener(BossBullet.CONTINUE,onContinue);
            bullet.addEventListener(Event.CLOSE,onDestroy);
            array.push(bullet);
         }
         if(cd != 0)
         {
            isCanShot = false;
            timer.start();
         }
      }
      
      private function onContinue(event:Event) : void
      {
         continueShot();
      }
      
      override protected function bulletContinue() : void
      {
         var q:int = 0;
         var bullet:BossBullet = null;
         var p:Point = sprite.localToGlobal(new Point());
         for(var i:uint = 0; i < 3; i++)
         {
            if(i == 0)
            {
               q = 0;
            }
            else if(i == 1)
            {
               q = -1;
            }
            else if(i == 2)
            {
               q = 1;
            }
            bullet = new BossBullet(sprite.row + q,speed,attack);
            bullet.x = p.x + offSet.x;
            bullet.y = p.y + offSet.y + GridDataManager.gridDim.height * q;
            PlantsGameManager.subject.container.addChild(bullet);
            bullet.addEventListener(BossBullet.CONTINUE,onContinue);
            bullet.addEventListener(Event.CLOSE,onDestroy);
            array.push(bullet);
         }
         if(cd != 0)
         {
            isCanShot = false;
            timer.stop();
            timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
            timer = new Timer(cd * 1000,1);
            timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
            timer.start();
         }
      }
      
      override public function destroy() : void
      {
         var i:BossBullet = null;
         super.destroy();
         for each(i in array)
         {
            i.removeEventListener(BossBullet.CONTINUE,onContinue);
            i.removeEventListener(Event.CLOSE,onDestroy);
            i.destroy();
         }
         array = [];
      }
      
      private function onDestroy(event:Event) : void
      {
         var b:BossBullet = event.currentTarget as BossBullet;
         DisplayUtil.removeForParent(b);
         var index:int = array.indexOf(b);
         if(index != -1)
         {
            array.splice(index,1);
         }
      }
   }
}


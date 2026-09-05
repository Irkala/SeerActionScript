package com.robot.module.game.plantsVsZombies.shotBehavior
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.manager.PlantsGameManager;
   import com.robot.module.game.plantsVsZombies.ob.EnemyManager;
   import com.robot.module.game.plantsVsZombies.plants.BaseShotSprite;
   import com.robot.module.game.plantsVsZombies.plants.IShotSprite;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.clearTimeout;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseShotBehavior implements IShotBehavior
   {
      
      protected var timeOut:uint;
      
      protected var sprite:BaseShotSprite;
      
      protected var speed:Number;
      
      protected var attack:Number;
      
      protected var timer:Timer;
      
      protected var dir:int = 1;
      
      protected var bulletMC:Sprite;
      
      protected var isMoving:Boolean = false;
      
      protected var isCanShot:Boolean = true;
      
      protected var cd:Number = 0;
      
      protected var useBullet:Boolean = false;
      
      protected var offSet:Point;
      
      protected var fun:Function;
      
      public function BaseShotBehavior(sprite:BaseShotSprite, attack:Number)
      {
         var mc:MovieClip;
         offSet = new Point();
         super();
         this.sprite = sprite;
         speed = 10;
         bulletMC = new Sprite();
         mc = getMC();
         try
         {
            DisplayUtil.copyDisplayAsBmp(mc);
            bulletMC.addChild(mc);
         }
         catch(e:Error)
         {
         }
         cd = 2;
         this.attack = attack;
      }
      
      protected function onTimerHandler(event:TimerEvent) : void
      {
         isCanShot = true;
         continueShot();
      }
      
      protected function bulletStart() : void
      {
      }
      
      protected function endyMovie() : void
      {
         fun();
      }
      
      protected function playMovie() : void
      {
         endyMovie();
      }
      
      public function start() : void
      {
         if(isMoving || !isCanShot)
         {
            return;
         }
         isMoving = true;
         fun = realStart;
         playMovie();
      }
      
      protected function continueShot() : void
      {
         if(!isCanShot || !isMoving)
         {
            return;
         }
         fun = realContinue;
         playMovie();
      }
      
      private function realStart() : void
      {
         var p:Point = null;
         if(useBullet)
         {
            bulletStart();
         }
         else
         {
            timer = new Timer(cd * 1000,1);
            timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
            p = sprite.localToGlobal(new Point());
            bulletMC.x = p.x + offSet.x;
            bulletMC.y = p.y + offSet.y;
            PlantsGameManager.subject.container.addChild(bulletMC);
            bulletMC.addEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
            if(cd != 0)
            {
               isCanShot = false;
               timer.start();
            }
         }
      }
      
      private function realContinue() : void
      {
         var p:Point = null;
         if(useBullet)
         {
            bulletContinue();
         }
         else
         {
            p = sprite.localToGlobal(new Point());
            bulletMC.x = p.x + offSet.x;
            bulletMC.y = p.y + offSet.y;
            PlantsGameManager.subject.container.addChild(bulletMC);
            bulletMC.addEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
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
      }
      
      public function destroy() : void
      {
         stop();
         clearTimeout(timeOut);
         if(timer)
         {
            timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
            timer = null;
         }
         sprite = null;
         bulletMC = null;
      }
      
      protected function bulletContinue() : void
      {
      }
      
      protected function getMC() : MovieClip
      {
         return new MovieClip();
      }
      
      public function stop() : void
      {
         if(timer)
         {
            timer.stop();
         }
         isCanShot = true;
         isMoving = false;
         bulletMC.removeEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
         DisplayUtil.removeForParent(bulletMC,false);
      }
      
      protected function onEnterFrameHandler(event:Event) : void
      {
         var i:IShotSprite = null;
         bulletMC.x += speed * dir;
         if(bulletMC.x > MainManager.getStageWidth() + 100)
         {
            stop();
            return;
         }
         var array:Array = EnemyManager.getList(sprite.row);
         for each(i in array)
         {
            if(i.sprite.hitTestObject(bulletMC))
            {
               bulletMC.removeEventListener(Event.ENTER_FRAME,onEnterFrameHandler);
               DisplayUtil.removeForParent(bulletMC,false);
               continueShot();
               i.hit(attack);
            }
         }
      }
   }
}


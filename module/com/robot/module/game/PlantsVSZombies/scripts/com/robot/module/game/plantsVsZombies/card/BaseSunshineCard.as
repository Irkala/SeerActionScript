package com.robot.module.game.plantsVsZombies.card
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.event.SunshineEvent;
   import com.robot.module.game.plantsVsZombies.ob.SunshineManager;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseSunshineCard extends BasePlantsCard
   {
      
      private var timer:Timer;
      
      private var isCD:Boolean = false;
      
      protected var cdTime:uint = 4000;
      
      protected var _needPower:uint;
      
      protected var _mc:MovieClip;
      
      public function BaseSunshineCard()
      {
         super();
         _mc = getCardMC();
         addChild(_mc);
         _mc.gotoAndStop(1);
         close();
         DisplayUtil.removeForParent(_icon);
         this.removeEventListener(MouseEvent.ROLL_OVER,onOver);
         this.removeEventListener(MouseEvent.ROLL_OUT,onOut);
      }
      
      private function checkPower() : void
      {
         if(!isCD)
         {
            _mc.gotoAndStop(100);
            if(_needPower <= SunshineManager.power)
            {
               _mc.gotoAndStop(_mc.totalFrames);
               open();
            }
            else
            {
               close();
            }
         }
         else
         {
            close();
         }
      }
      
      private function onTimerHandler(event:TimerEvent) : void
      {
         var p:uint = 0;
         if(timer.currentCount * 1000 / MainManager.getStage().frameRate >= cdTime)
         {
            timer.stop();
            isCD = false;
            checkPower();
         }
         else
         {
            p = Math.floor(timer.currentCount * 1000 / MainManager.getStage().frameRate / cdTime * 100);
            _mc.gotoAndStop(p);
         }
      }
      
      private function onCollect(event:SunshineEvent) : void
      {
         checkPower();
      }
      
      override public function useCard() : void
      {
         isCD = true;
         timer.reset();
         timer.start();
         close();
         SunshineManager.dispatchEvent(new SunshineEvent(SunshineEvent.COLLECT,-_needPower));
      }
      
      private function close() : void
      {
         this.mouseChildren = false;
         this.mouseEnabled = false;
      }
      
      private function open() : void
      {
         this.mouseChildren = true;
         this.mouseEnabled = true;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         _mc = null;
         SunshineManager.removeEventListener(SunshineEvent.COLLECT,onCollect);
      }
      
      protected function getCardMC() : MovieClip
      {
         return new MovieClip();
      }
      
      override public function setup() : void
      {
         checkPower();
         SunshineManager.addEventListener(SunshineEvent.COLLECT,onCollect);
         timer = new Timer(1000 / MainManager.getStage().frameRate);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
      }
   }
}


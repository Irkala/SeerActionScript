package aero.enemies.Boss
{
   import aero.Aircraft;
   import explodes.Explode;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   
   public class BossOne extends Aircraft
   {
      
      private var centerX:Number = 650;
      
      private var bChange:Boolean = false;
      
      private var an:Number = 100;
      
      public function BossOne()
      {
         super();
         this.hp = 20;
         this.execution = 20;
         this.fireable = false;
         this.explodeType = Explode.Boss_EXPLODE;
         this.destroyTypeArr = [1];
         this.speed = 2;
         var timer:Timer = new Timer(3000);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.start();
      }
      
      override public function changeStatus() : void
      {
         if(mc)
         {
            mc.gotoAndStop("changeStatus");
            setTimeout(function():void
            {
               if(bChange)
               {
                  mc.gotoAndStop(1);
               }
               else
               {
                  mc.gotoAndStop(2);
               }
            },100);
         }
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         if(bChange)
         {
            this.destroyTypeArr = [0];
            bChange = false;
            mc.gotoAndStop(1);
         }
         else
         {
            this.destroyTypeArr = [1];
            bChange = true;
            mc.gotoAndStop(2);
         }
      }
      
      override public function creatProtector() : void
      {
         if(mc)
         {
            if(!bChange)
            {
               mc.gotoAndStop("redProtector");
            }
            else
            {
               mc.gotoAndStop("blueProtector");
            }
            setTimeout(function():void
            {
               if(bChange)
               {
                  mc.gotoAndStop(1);
               }
               else
               {
                  mc.gotoAndStop(2);
               }
            },500);
         }
      }
      
      override public function getMC() : MovieClip
      {
         mc = new BossOneMC();
         mc.gotoAndStop(2);
         return mc;
      }
      
      override protected function move() : void
      {
         if(this.fireable)
         {
            fire();
         }
         super.move();
      }
   }
}


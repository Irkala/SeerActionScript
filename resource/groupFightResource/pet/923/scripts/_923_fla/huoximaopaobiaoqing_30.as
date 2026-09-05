package _923_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol86")]
   public dynamic class huoximaopaobiaoqing_30 extends MovieClip
   {
      
      public var timer:Timer;
      
      public function huoximaopaobiaoqing_30()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onTimer(param1:*) : void
      {
         if(Math.random() < 0.4)
         {
            this.gotoAndStop(Math.ceil(Math.random() * 9) + 2);
         }
      }
      
      public function onRemoved(param1:*) : void
      {
         timer.stop();
         timer.removeEventListener(TimerEvent.TIMER,onTimer);
      }
      
      internal function frame1() : *
      {
         stop();
         timer = new Timer(5000);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.start();
         this.addEventListener(Event.REMOVED_FROM_STAGE,onRemoved);
      }
   }
}


package com.robot.app2.component
{
   import com.robot.core.mode.components.EventComponent;
   import flash.display.InteractiveObject;
   import flash.events.Event;
   
   public class TimeComponent extends EventComponent
   {
      
      private var _prevTime:Number = 0;
      
      private var _backFun:Function;
      
      private var _intervalTime:Number = 0;
      
      private var _duration:Number = 0;
      
      private var _runing:Boolean;
      
      public function TimeComponent(obj:InteractiveObject, backFun:Function, intervalTime:Number = 0)
      {
         super();
         this._backFun = backFun;
         this._intervalTime = intervalTime;
         addFrameEvent(obj,this.onFrame);
         this._runing = true;
      }
      
      private function onFrame(e:Event) : void
      {
         var time:Number = NaN;
         if(!this._runing)
         {
            return;
         }
         var date:Date = new Date();
         if(this._prevTime > 0)
         {
            time = date.time - this._prevTime;
            if(time > 5000 || time <= 0)
            {
               time = 42;
            }
            if(this._intervalTime > 0)
            {
               this._duration += time;
               if(this._duration >= this._intervalTime)
               {
                  this._backFun(this._duration);
                  this._duration = 0;
               }
            }
            else
            {
               this._backFun(time);
            }
         }
         this._prevTime = date.time;
      }
      
      public function pause() : void
      {
         this._runing = false;
      }
      
      public function play() : void
      {
         this._runing = true;
      }
      
      public function restart() : void
      {
         this._runing = true;
         this._duration = 0;
      }
      
      override public function destroy() : void
      {
         this._backFun = null;
         super.destroy();
      }
   }
}


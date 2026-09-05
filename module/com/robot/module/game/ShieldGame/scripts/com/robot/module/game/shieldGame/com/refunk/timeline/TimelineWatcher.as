package com.robot.module.game.shieldGame.com.refunk.timeline
{
   import com.robot.module.game.shieldGame.com.refunk.events.TimelineEvent;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   
   public class TimelineWatcher extends EventDispatcher
   {
      
      private var _timeline:MovieClip;
      
      private var previousLabel:String;
      
      public function TimelineWatcher(timeline:MovieClip)
      {
         super();
         _timeline = timeline;
         _timeline.addEventListener(Event.ENTER_FRAME,watch);
      }
      
      public function dispose() : void
      {
         try
         {
            _timeline.removeEventListener(Event.ENTER_FRAME,watch);
            _timeline = null;
         }
         catch(err:Error)
         {
         }
      }
      
      private function watch(e:Event) : void
      {
         var cf:int = 0;
         var cl:String = null;
         try
         {
            cf = _timeline.currentFrame;
            cl = _timeline.currentLabel;
            if(cl !== previousLabel)
            {
               dispatchEvent(new TimelineEvent(TimelineEvent.LABEL_REACHED,cf,cl));
            }
            if(cf == _timeline.totalFrames)
            {
               dispatchEvent(new TimelineEvent(TimelineEvent.END_REACHED,cf,cl));
            }
            previousLabel = cl;
         }
         catch(err:Error)
         {
         }
      }
   }
}


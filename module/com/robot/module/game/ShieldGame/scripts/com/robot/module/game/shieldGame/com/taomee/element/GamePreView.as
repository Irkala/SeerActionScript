package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.refunk.events.TimelineEvent;
   import com.robot.module.game.shieldGame.com.refunk.timeline.TimelineWatcher;
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.event.GameStateEvent;
   
   public class GamePreView extends MovieClipObject
   {
      
      private var timelineWatcher:TimelineWatcher;
      
      public function GamePreView(p_main:GameContainer, x:Number = 0, y:Number = 0)
      {
         super(p_main);
         this._mc = this._main.swfLib.getMC("pregameview",new pregameview());
         this._mc.x = x;
         this._mc.y = y;
         this._main.pauseLayer.addChild(this._mc);
         timelineWatcher = new TimelineWatcher(this._mc);
         timelineWatcher.addEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
         timelineWatcher.addEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
      }
      
      public function die() : void
      {
         if(timelineWatcher)
         {
            timelineWatcher.removeEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
            timelineWatcher.removeEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
            timelineWatcher.dispose();
            timelineWatcher = null;
         }
         this._main.pauseLayer.removeChild(this._mc);
      }
      
      private function handleTimelineEvent(e:TimelineEvent) : void
      {
         switch(e.type)
         {
            case TimelineEvent.END_REACHED:
               this._main.dispatchEvent(new GameStateEvent("PREGAMEVIEWFINISH",0,0));
               die();
         }
      }
      
      override public function EnterFrame() : void
      {
      }
   }
}


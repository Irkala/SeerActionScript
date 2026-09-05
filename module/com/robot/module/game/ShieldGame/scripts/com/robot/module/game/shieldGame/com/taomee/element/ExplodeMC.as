package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.refunk.events.TimelineEvent;
   import com.robot.module.game.shieldGame.com.refunk.timeline.TimelineWatcher;
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.utils.HitTest;
   import flash.geom.Rectangle;
   
   public class ExplodeMC extends MovieClipObject
   {
      
      private var testCollision:Boolean = false;
      
      private var timelineWatcher:TimelineWatcher;
      
      public function ExplodeMC(p_main:GameContainer, x:Number, y:Number, conllision:Boolean = false)
      {
         super(p_main);
         testCollision = conllision;
         this._mc = this._main.swfLib.getMC("exploder",new exploder());
         this._mc.x = x;
         this._mc.y = y;
         this._main.circleLayer.addChild(this._mc);
         timelineWatcher = new TimelineWatcher(this._mc);
         timelineWatcher.addEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
         timelineWatcher.addEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
      }
      
      private function handleTimelineEvent(e:TimelineEvent) : void
      {
         switch(e.type)
         {
            case TimelineEvent.END_REACHED:
               trace("mc  over");
               die();
         }
      }
      
      override public function EnterFrame() : void
      {
         var i:* = undefined;
         var j:* = undefined;
         var m:* = undefined;
         var rect1:Rectangle = null;
         var rect2:Rectangle = null;
         var rect3:Rectangle = null;
         var n:* = undefined;
         var rect4:Rectangle = null;
         if(testCollision)
         {
            for(i in this._main.circleList)
            {
               rect1 = HitTest.complexHitTestObject(this._mc,CircleMC(this._main.circleList[i])._mc.centre);
               if(rect1.width != 0)
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect1.x,rect1.y,true);
                  this.die();
                  this._main.circleList[i].die(true);
               }
            }
            for(j in this._main.houseList)
            {
               rect2 = HitTest.complexHitTestObject(this._mc,HouseMC(this._main.houseList[j])._mc);
               if(rect2.width != 0)
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect2.x,rect2.y,true);
                  this.die();
                  this._main.houseList[j].die();
               }
            }
            for(m in this._main.bombList)
            {
               rect3 = HitTest.complexHitTestObject(this._mc,BombMC(this._main.bombList[m])._mc);
               if(rect3.width != 0)
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect3.x,rect3.y,true);
                  this.die();
                  this._main.bombList[m].die();
               }
            }
         }
         else
         {
            for(n in this._main.houseList)
            {
               rect4 = HitTest.complexHitTestObject(this._mc,HouseMC(this._main.houseList[n])._mc);
               if(rect4.width != 0)
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect4.x,rect4.y,true);
                  this.die();
                  this._main.houseList[n].die();
               }
            }
         }
      }
      
      public function die() : void
      {
         this._mc.stop();
         if(timelineWatcher)
         {
            timelineWatcher.removeEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
            timelineWatcher.removeEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
            timelineWatcher.dispose();
            timelineWatcher = null;
         }
         this._main.circleLayer.removeChild(this._mc);
      }
   }
}


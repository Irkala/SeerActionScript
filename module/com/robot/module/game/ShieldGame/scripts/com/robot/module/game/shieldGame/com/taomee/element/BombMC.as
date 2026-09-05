package com.robot.module.game.shieldGame.com.taomee.element
{
   import com.robot.module.game.shieldGame.com.refunk.events.TimelineEvent;
   import com.robot.module.game.shieldGame.com.refunk.timeline.TimelineWatcher;
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.utils.HitTest;
   import flash.geom.Rectangle;
   
   public class BombMC extends MovieClipObject
   {
      
      private var angel:Number = 0;
      
      private var vx:Number = 0;
      
      private var vy:Number = 0;
      
      private var speed:Number = 4;
      
      private var timelineWatcher:TimelineWatcher;
      
      private var areay:Number = 500;
      
      private const currentLabel:String = "destroy";
      
      public function BombMC(p_main:GameContainer, x:Number, y:Number, areax:Number, advanceBombType:uint)
      {
         super(p_main);
         if(advanceBombType == 0)
         {
            this._mc = this._main.swfLib.getMC("bomb",new bomb());
            this._mc.x = x;
            this._mc.y = y;
            this._main.bombLayer.addChild(this._mc);
         }
         else if(advanceBombType == 1)
         {
            this._mc = this._main.swfLib.getMC("bombparent",new bombparent());
            this._mc.x = x;
            this._mc.y = y;
            this._main.bombLayer.addChild(this._mc);
            timelineWatcher = new TimelineWatcher(this._mc);
            timelineWatcher.addEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
            timelineWatcher.addEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
         }
         else if(advanceBombType == 2)
         {
            this._mc = this._main.swfLib.getMC("bombchild",new bombchild());
            this._mc.x = x;
            this._mc.y = y;
            this._main.bombLayer.addChild(this._mc);
         }
         var angel1:Number = Math.atan2(areay - y,areax - x) * 180 / Math.PI;
         if(angel1 > 90)
         {
            angel = angel1 - 90;
            this._mc.rotation = angel;
            this.vy = Math.cos(angel * Math.PI / 180) * this.speed;
            this.vx = -Math.sin(angel * Math.PI / 180) * this.speed;
         }
         else
         {
            angel = -(90 - angel1);
            this._mc.rotation = angel;
            this.vx = Math.cos(angel1 * Math.PI / 180) * this.speed;
            this.vy = Math.sin(angel1 * Math.PI / 180) * this.speed;
         }
      }
      
      public function die() : void
      {
         var i:* = undefined;
         this._main.bombLayer.removeChild(this._mc);
         if(timelineWatcher)
         {
            timelineWatcher.removeEventListener(TimelineEvent.LABEL_REACHED,handleTimelineEvent);
            timelineWatcher.removeEventListener(TimelineEvent.END_REACHED,handleTimelineEvent);
            timelineWatcher.dispose();
            timelineWatcher = null;
         }
         for(i in this._main.bombList)
         {
            if(this._main.bombList[i] == this)
            {
               this._main.bombList[i] = this._main.bombList[this._main.bombList.length - 1];
               this._main.bombList.pop();
            }
         }
      }
      
      private function handleTimelineEvent(e:TimelineEvent) : void
      {
         switch(e.type)
         {
            case TimelineEvent.LABEL_REACHED:
               if(e.currentLabel == currentLabel)
               {
                  trace("mc  over");
                  advanceBombChild();
               }
               break;
            case TimelineEvent.END_REACHED:
               die();
         }
      }
      
      override public function EnterFrame() : void
      {
         var i:* = undefined;
         var j:* = undefined;
         var rect1:Rectangle = null;
         var rect2:Rectangle = null;
         this._mc.x += vx;
         this._mc.y += vy;
         if(this._mc.y >= areay - 30)
         {
            new ExplodeMC(this._main,this._mc.x,this._mc.y);
            die();
         }
         for(i in this._main.circleList)
         {
            rect1 = HitTest.complexHitTestObject(this._mc,CircleMC(this._main.circleList[i])._mc);
            if(rect1.width != 0)
            {
               this.die();
               if(this._main.circleList[i].die() <= 0)
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect1.x,rect1.y,true);
               }
               else
               {
                  this._main.exploderMC = new ExplodeMC(this._main,rect1.x,rect1.y);
               }
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
      }
      
      private function advanceBombChild() : void
      {
         trace(this._mc.x + "\t === \t" + this._mc.y);
         this._main.creatBomb(Math.ceil(Math.random() * 10),this._mc.x,this._mc.y,2);
      }
   }
}


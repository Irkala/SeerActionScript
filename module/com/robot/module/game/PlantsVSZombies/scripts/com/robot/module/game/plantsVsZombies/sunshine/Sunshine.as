package com.robot.module.game.plantsVsZombies.sunshine
{
   import com.robot.core.manager.LevelManager;
   import com.robot.module.game.plantsVsZombies.event.SunshineEvent;
   import com.robot.module.game.plantsVsZombies.ob.SunshineManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import gs.TweenLite;
   import org.taomee.utils.DisplayUtil;
   
   public class Sunshine extends Sprite
   {
      
      private var _start:Point;
      
      private var power:uint = 50;
      
      private const FINAL_POINT:Point = new Point(800,40);
      
      private var dir:int;
      
      private var mc:MovieClip;
      
      private var _end:Point;
      
      private var speed:Number = 2;
      
      public function Sunshine(startPoint:Point, endPoint:Point)
      {
         super();
         this.mouseChildren = false;
         this.buttonMode = true;
         _start = startPoint;
         _end = endPoint;
         mc = new plante_sunshine_mc();
         mc.cacheAsBitmap = true;
         this.x = _start.x;
         this.y = _start.y;
         addChild(mc);
         dir = _end.y > _start.y ? 1 : -1;
         LevelManager.gameLevel.addChild(this);
         SunshineManager.addSunshine(this);
         addEvent();
      }
      
      public function destroy() : void
      {
         SunshineManager.delSunshine(this);
         DisplayUtil.removeForParent(this);
         removeEvent();
         mc = null;
      }
      
      private function onClickHandler(event:MouseEvent) : void
      {
         removeEvent();
         this.mouseChildren = this.mouseEnabled = false;
         SunshineManager.dispatchEvent(new SunshineEvent(SunshineEvent.COLLECT,power));
         TweenLite.to(this,0.5,{
            "x":FINAL_POINT.x,
            "y":FINAL_POINT.y,
            "onComplete":onTweenComp
         });
      }
      
      private function onEnterFrame(event:Event) : void
      {
         this.y += speed * dir;
         if(dir == 1)
         {
            if(this.y >= _end.y)
            {
               this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
            }
         }
         else if(this.y <= _end.y)
         {
            this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         }
      }
      
      private function addEvent() : void
      {
         this.addEventListener(MouseEvent.CLICK,onClickHandler);
         this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
      }
      
      private function onTweenComp() : void
      {
         destroy();
      }
      
      private function removeEvent() : void
      {
         this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         this.removeEventListener(MouseEvent.CLICK,onClickHandler);
      }
   }
}


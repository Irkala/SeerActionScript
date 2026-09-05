package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.plantsVsZombies.event.SunshineEvent;
   import com.robot.module.game.plantsVsZombies.sunshine.Sunshine;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class SunshineManager extends GameObserver implements IGameObserver
   {
      
      private static var _power:int;
      
      private static var instance:EventDispatcher;
      
      private static var array:Array;
      
      private var timer:Timer;
      
      private var txt:TextField;
      
      private var sunshineArray:Array = [];
      
      public function SunshineManager(subject:GameSubject)
      {
         super(subject);
      }
      
      public static function addSunshine(i:Sunshine) : void
      {
         array.push(i);
      }
      
      public static function get power() : int
      {
         return _power;
      }
      
      public static function dispatchEvent(event:Event) : void
      {
         getInstance().dispatchEvent(event);
      }
      
      private static function getInstance() : EventDispatcher
      {
         if(instance == null)
         {
            instance = new EventDispatcher();
         }
         return instance;
      }
      
      public static function addEventListener(type:String, listener:Function, useCapture:Boolean = false, priority:int = 0, useWeakReference:Boolean = false) : void
      {
         getInstance().addEventListener(type,listener,useCapture,priority,useWeakReference);
      }
      
      public static function delSunshine(i:Sunshine) : void
      {
         var index:int = array.indexOf(i);
         if(index != -1)
         {
            array.splice(index,1);
         }
      }
      
      public static function removeEventListener(type:String, listener:Function, useCapture:Boolean = false) : void
      {
         getInstance().removeEventListener(type,listener,useCapture);
      }
      
      public static function hasEventListener(type:String) : Boolean
      {
         return getInstance().hasEventListener(type);
      }
      
      public static function willTrigger(type:String) : Boolean
      {
         return getInstance().willTrigger(type);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         timer.removeEventListener(TimerEvent.TIMER,onTimerHandler);
         timer = null;
         txt = null;
      }
      
      override public function setup() : void
      {
         timer = new Timer(2000);
         timer.addEventListener(TimerEvent.TIMER,onTimerHandler);
         array = [];
         _power = 50;
         txt = PlantsTopBoxObserver.txt;
         txt.text = _power.toString();
         SunshineManager.addEventListener(SunshineEvent.COLLECT,onCollect);
      }
      
      override public function gameOver() : void
      {
         var i:Sunshine = null;
         var j:Sunshine = null;
         for each(i in sunshineArray)
         {
            i.destroy();
         }
         sunshineArray = [];
         _power = 0;
         txt.text = _power.toString();
         timer.stop();
         for each(j in array)
         {
            j.destroy();
         }
         array = [];
      }
      
      private function onTimerHandler(event:TimerEvent) : void
      {
         var x:Number = 200 + Math.random() * (MainManager.getStageWidth() - 400);
         var y:Number = 200 + Math.random() * 300;
         sunshineArray.push(new Sunshine(new Point(x,-200),new Point(x,y)));
      }
      
      override public function nextLevel() : void
      {
         timer.start();
         _power = 50;
         txt.text = _power.toString();
      }
      
      private function onCollect(event:SunshineEvent) : void
      {
         _power += event.power;
         if(_power < 0)
         {
            _power = 0;
         }
         txt.text = _power.toString();
      }
      
      override public function gameStart() : void
      {
         timer.start();
      }
   }
}


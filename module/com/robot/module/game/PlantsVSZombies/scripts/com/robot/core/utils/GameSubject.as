package com.robot.core.utils
{
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import org.taomee.utils.DisplayUtil;
   
   public class GameSubject extends EventDispatcher
   {
      
      private var _container:DisplayObjectContainer;
      
      protected var observerArray:Array = [];
      
      public function GameSubject(container:DisplayObjectContainer = null)
      {
         super();
         _container = container;
         ObserverManager.createCollection(this);
      }
      
      public function get container() : DisplayObjectContainer
      {
         return _container;
      }
      
      public function gameOver() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gameOver();
         }
      }
      
      public function destroyAll() : void
      {
         var i:IGameObserver = null;
         DisplayUtil.removeAllChild(container);
         for each(i in observerArray)
         {
            i.destroy();
         }
         observerArray = [];
      }
      
      public function start() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gameStart();
            trace(i,"gameStart");
         }
      }
      
      public function restart() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.restart();
            trace(i,"gameStart");
         }
      }
      
      public function nextLevel() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.nextLevel();
         }
      }
      
      public function pause() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gamePause();
         }
      }
      
      public function addObserver(i:IGameObserver) : void
      {
         trace(i,"注册为观察者");
         ObserverManager.addObserver(this,i);
         observerArray.push(i);
      }
      
      public function removeObserver(i:IGameObserver) : void
      {
         var index:int = observerArray.indexOf(i);
         if(index != -1)
         {
            observerArray.splice(index,1);
         }
         ObserverManager.delObserver(this,i);
      }
      
      public function setup() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.setup();
         }
      }
   }
}


package com.robot.module.game.petSkate
{
   import flash.display.DisplayObjectContainer;
   import flash.events.EventDispatcher;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseGameSubject extends EventDispatcher
   {
      
      protected var observerArray:Array = [];
      
      private var _con:DisplayObjectContainer;
      
      public function BaseGameSubject(container:DisplayObjectContainer = null)
      {
         super();
         _con = container;
      }
      
      public function get container() : DisplayObjectContainer
      {
         return _con;
      }
      
      public function next() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.next();
         }
      }
      
      public function gamePause() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gamePause();
         }
      }
      
      public function gameOver() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gameOver();
         }
      }
      
      public function destroy() : void
      {
         var i:IGameObserver = null;
         DisplayUtil.removeAllChild(container);
         for each(i in observerArray)
         {
            i.destroy();
         }
         observerArray = [];
      }
      
      public function gameStart() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gameStart();
            trace(i,"gameStart");
         }
      }
      
      public function addObserver(i:IGameObserver) : void
      {
         trace(i,"注册为观察者");
         observerArray.push(i);
      }
      
      public function gameContinue() : void
      {
         var i:IGameObserver = null;
         for each(i in observerArray)
         {
            i.gameContinue();
         }
      }
      
      public function removeObserver(i:IGameObserver) : void
      {
         var index:int = observerArray.indexOf(i);
         if(index != -1)
         {
            observerArray.splice(index,1);
         }
      }
   }
}


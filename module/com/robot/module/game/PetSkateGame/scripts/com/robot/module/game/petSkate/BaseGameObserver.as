package com.robot.module.game.petSkate
{
   import flash.events.EventDispatcher;
   
   public class BaseGameObserver extends EventDispatcher implements IGameObserver
   {
      
      protected var subject:BaseGameSubject;
      
      public function BaseGameObserver(s:BaseGameSubject)
      {
         super();
         subject = s;
         subject.addObserver(this);
      }
      
      public function gameContinue() : void
      {
      }
      
      public function destroy() : void
      {
         subject = null;
      }
      
      public function gamePause() : void
      {
      }
      
      public function gameOver() : void
      {
      }
      
      public function gameStart() : void
      {
      }
      
      public function next() : void
      {
      }
   }
}


package com.robot.core.utils
{
   import flash.events.EventDispatcher;
   
   public class GameObserver extends EventDispatcher implements IGameObserver
   {
      
      protected var subject:GameSubject;
      
      public function GameObserver(subject:GameSubject)
      {
         super();
         this.subject = subject;
         this.subject.addObserver(this);
      }
      
      public function destroy() : void
      {
         gameOver();
         subject = null;
      }
      
      public function setup() : void
      {
      }
      
      public function gameOver() : void
      {
      }
      
      public function gamePause() : void
      {
      }
      
      public function gameStart() : void
      {
      }
      
      public function nextLevel() : void
      {
      }
      
      public function restart() : void
      {
      }
   }
}


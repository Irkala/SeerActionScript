package com.robot.module.game.petSkate
{
   public interface IGameObserver
   {
      
      function gameStart() : void;
      
      function next() : void;
      
      function gamePause() : void;
      
      function gameOver() : void;
      
      function gameContinue() : void;
      
      function destroy() : void;
   }
}


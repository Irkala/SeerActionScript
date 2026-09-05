package com.robot.core.utils
{
   public interface IGameObserver
   {
      
      function gameStart() : void;
      
      function nextLevel() : void;
      
      function gamePause() : void;
      
      function gameOver() : void;
      
      function destroy() : void;
      
      function setup() : void;
      
      function restart() : void;
   }
}


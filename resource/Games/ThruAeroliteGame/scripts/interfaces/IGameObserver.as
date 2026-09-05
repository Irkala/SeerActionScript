package interfaces
{
   public interface IGameObserver
   {
      
      function gameStart(param1:uint) : void;
      
      function nextLevel(param1:uint) : void;
      
      function gamePass() : void;
      
      function gameOver() : void;
   }
}


package interfaces
{
   public interface IGameSubject
   {
      
      function registerObserver(param1:IGameObserver) : void;
      
      function removeObserver(param1:IGameObserver) : void;
   }
}


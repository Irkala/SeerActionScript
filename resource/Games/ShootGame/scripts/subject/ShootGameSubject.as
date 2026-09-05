package subject
{
   import observer.IShootGameObserver;
   
   public class ShootGameSubject
   {
      
      public static var shootBool:Boolean = false;
      
      private var array:Array = [];
      
      public function ShootGameSubject()
      {
         super();
      }
      
      public function startGame() : void
      {
         var i:IShootGameObserver = null;
         for each(i in array)
         {
            i.gameStart();
         }
      }
      
      public function gameOver() : void
      {
         var i:IShootGameObserver = null;
         for each(i in array)
         {
            i.gameOver();
         }
         array = [];
      }
      
      public function register(i:IShootGameObserver) : void
      {
         shootBool = true;
         trace(i,"注册为观察者");
         array.push(i);
      }
      
      public function del(i:IShootGameObserver) : void
      {
         var index:int = array.indexOf(i);
         if(index != -1)
         {
            array.splice(index,1);
         }
      }
   }
}


package
{
   import com.robot.core.manager.MainManager;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import game.GameController;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class WaterGame extends Sprite
   {
      
      private static var _root:WaterGame;
      
      public static const WATER_GAME_OVER:String = "waterGunGameOver";
      
      public var obj:Object = new Object();
      
      public function WaterGame()
      {
         super();
         _root = this;
         GameController.show();
      }
      
      public static function gameOver(flag:uint) : void
      {
         getRoot().obj.flag = flag;
         getRoot().dispatchEvent(new Event(WaterGame.WATER_GAME_OVER));
      }
      
      public static function getRoot() : WaterGame
      {
         return _root;
      }
      
      public static function getStage() : Stage
      {
         return MainManager.getStage();
      }
      
      public function destroy() : void
      {
         GameController.destroy();
      }
   }
}


package game
{
   public class GameController
   {
      
      private static var _gamePanel:GamePanel;
      
      public function GameController()
      {
         super();
      }
      
      public static function destroy() : void
      {
         _gamePanel.destroy();
      }
      
      private static function get panel() : GamePanel
      {
         if(_gamePanel != null)
         {
            _gamePanel = null;
         }
         _gamePanel = new GamePanel();
         return _gamePanel;
      }
      
      public static function show() : void
      {
         panel.show();
      }
   }
}


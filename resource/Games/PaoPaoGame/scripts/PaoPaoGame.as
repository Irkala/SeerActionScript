package
{
   import flash.display.Sprite;
   import flash.events.Event;
   import src.com.Game;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="40")]
   public class PaoPaoGame extends Sprite
   {
      
      public var _bili:Number;
      
      private var game_mc:Game;
      
      private var _str:String;
      
      public function PaoPaoGame()
      {
         super();
      }
      
      private function gameWinHandler(e:Event) : void
      {
         _bili = game_mc.biNum;
         dispatchEvent(new Event("gamewin"));
         destroy();
      }
      
      private function gameCloseHandler(e:Event) : void
      {
         _bili = game_mc.biNum;
         dispatchEvent(new Event("gameclose"));
         destroy();
      }
      
      public function init() : void
      {
         game_mc = new Game(_str);
         addChild(game_mc);
         addEventListener(Event.ENTER_FRAME,enterFrameHandler);
         game_mc.addEventListener(Game.GAME_LOST,gameLostHandler);
         game_mc.addEventListener(Game.GAME_WIN,gameWinHandler);
         game_mc.addEventListener(Game.GAME_CLOSE,gameCloseHandler);
      }
      
      private function gameLostHandler(e:Event) : void
      {
         _bili = game_mc.biNum;
         dispatchEvent(new Event("gamelost"));
         destroy();
      }
      
      private function enterFrameHandler(e:Event) : void
      {
         game_mc.enterFrame();
      }
      
      public function addMc(str:String) : void
      {
         _str = str;
         init();
      }
      
      public function destroy() : void
      {
         game_mc.destroy();
         removeChild(game_mc);
         removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         game_mc.removeEventListener(Game.GAME_LOST,gameLostHandler);
         game_mc.removeEventListener(Game.GAME_WIN,gameWinHandler);
         game_mc.removeEventListener(Game.GAME_CLOSE,gameCloseHandler);
         game_mc = null;
      }
      
      public function bili() : Number
      {
         return _bili;
      }
   }
}


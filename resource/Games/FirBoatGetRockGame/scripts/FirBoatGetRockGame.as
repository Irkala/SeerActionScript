package
{
   import com.game.Game;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="36")]
   public class FirBoatGetRockGame extends Sprite
   {
      
      private var game:Game;
      
      public function FirBoatGetRockGame()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         game = new Game();
         addChild(game);
         game.addEventListener(Event.ENTER_FRAME,enterFrameHandler);
         game.addEventListener("closegame",gameLost);
         game.addEventListener("gameLost",gameLost);
         game.addEventListener("gamewin",gameWin);
      }
      
      private function destroy(e:Event = null) : void
      {
         game.removeEventListener(Event.ENTER_FRAME,enterFrameHandler);
         var time:Timer = new Timer(1000,1);
         time.start();
         time.addEventListener(TimerEvent.TIMER_COMPLETE,timeCompEvent);
      }
      
      public function getLife() : int
      {
         return int(11 - game.life_mc.currentFrame);
      }
      
      private function enterFrameHandler(e:Event) : void
      {
         game.enterFrameHandler();
      }
      
      private function gameLost(e:Event) : void
      {
         this.dispatchEvent(new Event("gamelost"));
         destroy();
      }
      
      private function gameWin(e:Event) : void
      {
         this.dispatchEvent(new Event("gamewin"));
         destroy();
      }
      
      private function timeCompEvent(e:TimerEvent = null) : void
      {
         e.target.removeEventListener(TimerEvent.TIMER_COMPLETE,timeCompEvent);
         game.removeEventListener("closegame",gameLost);
         game.removeEventListener("gameLost",gameLost);
         game.removeEventListener("gamewin",gameWin);
         game.destroy();
         removeChild(game);
      }
   }
}


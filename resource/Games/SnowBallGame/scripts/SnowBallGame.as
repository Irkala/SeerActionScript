package
{
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import snowGame.GameStart;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class SnowBallGame extends Sprite
   {
      
      private var games:GameStart;
      
      public var _level:uint;
      
      private var quit_mc:MovieClip;
      
      private var help_mc:MovieClip;
      
      public var scoreObj:Object = new Object();
      
      private var help_btn:SimpleButton;
      
      private var no_btn:SimpleButton;
      
      private var out_btn:SimpleButton;
      
      private var startBack_mc:MovieClip;
      
      private var start_bar:MovieClip;
      
      private var quit_btn:SimpleButton;
      
      private var start_btn:SimpleButton;
      
      public function SnowBallGame()
      {
         super();
         initStart();
      }
      
      private function clickOutHandler(e:MouseEvent) : void
      {
         scoreObj.level = 0;
         dispatchEvent(new Event("outgamenow"));
         destroy();
      }
      
      private function destroyStart() : void
      {
         if(out_btn)
         {
            removeChild(quit_mc);
            out_btn.removeEventListener(MouseEvent.CLICK,clickOutHandler);
            no_btn.removeEventListener(MouseEvent.CLICK,clickNOoutHandler);
            out_btn = null;
            no_btn = null;
            quit_mc = null;
         }
         if(start_btn)
         {
            removeChild(start_bar);
            removeChild(startBack_mc);
            start_btn.removeEventListener(MouseEvent.CLICK,clickStartHandler);
            quit_btn.removeEventListener(MouseEvent.CLICK,clickQuitHandler);
            help_btn.removeEventListener(MouseEvent.MOUSE_OVER,overHelpHandler);
            help_btn.removeEventListener(MouseEvent.MOUSE_OUT,outHelpHandler);
            start_bar = null;
            startBack_mc = null;
            quit_btn = null;
            start_btn = null;
         }
      }
      
      public function destroy() : void
      {
         if(games)
         {
            scoreObj.level = 0;
            dispatchEvent(new Event("outgamenow"));
            removeChild(games);
            games = null;
         }
         destroyStart();
      }
      
      public function get level() : uint
      {
         return _level;
      }
      
      private function clickQuitHandler(e:MouseEvent) : void
      {
         if(quit_mc == null)
         {
            quit_mc = new ZSnow_outBar();
            addChild(quit_mc);
         }
         else
         {
            quit_mc.visible = true;
         }
         quit_mc.gotoAndPlay(1);
         quit_mc.addFrameScript(13,addLiStenQuit);
      }
      
      private function overHelpHandler(e:MouseEvent) : void
      {
         help_mc.visible = true;
         help_mc.gotoAndPlay(2);
      }
      
      private function addLiStenQuit() : void
      {
         quit_mc.gotoAndStop(13);
         quit_mc.addFrameScript(13,null);
         out_btn = quit_mc["quit_btn"];
         no_btn = quit_mc["no_btn"];
         out_btn.addEventListener(MouseEvent.CLICK,clickOutHandler);
         no_btn.addEventListener(MouseEvent.CLICK,clickNOoutHandler);
      }
      
      private function outHelpHandler(e:MouseEvent) : void
      {
         help_mc.visible = false;
         help_mc.gotoAndStop(1);
      }
      
      private function quitGame(e:Event) : void
      {
         scoreObj.level = games.level();
         dispatchEvent(new Event("outgamenow"));
         games.destroyAll();
         destroy();
      }
      
      private function clickStartHandler(e:MouseEvent) : void
      {
         destroy();
         inGame();
      }
      
      private function initStart() : void
      {
         startBack_mc = new ZSnow_startBack();
         addChild(startBack_mc);
         start_bar = new ZSnow_startBar();
         addChild(start_bar);
         help_mc = new ZSnow_helpMc();
         addChild(help_mc);
         help_mc.gotoAndStop(1);
         help_mc.visible = false;
         start_btn = start_bar["start_btn"];
         quit_btn = start_bar["quit_btn"];
         help_btn = start_bar["gameHelp_btn"];
         start_btn.addEventListener(MouseEvent.CLICK,clickStartHandler);
         quit_btn.addEventListener(MouseEvent.CLICK,clickQuitHandler);
         help_btn.addEventListener(MouseEvent.MOUSE_OVER,overHelpHandler);
         help_btn.addEventListener(MouseEvent.MOUSE_OUT,outHelpHandler);
      }
      
      private function clickNOoutHandler(e:MouseEvent) : void
      {
         quit_mc.gotoAndStop(1);
         quit_mc.visible = false;
      }
      
      private function inGame() : void
      {
         games = new GameStart();
         addChild(games);
         games.addEventListener("quitgame",quitGame);
         games.addEventListener("againgame",againGame);
      }
      
      private function againGame(e:Event) : void
      {
         removeChild(games);
         games = null;
         initStart();
      }
   }
}


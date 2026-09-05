package com.robot.module.game.kickBall
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.game.kickBall.mc.Ball;
   import com.robot.module.game.kickBall.mc.Game;
   import com.robot.module.game.kickBall.mc.GameFirstPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class KickBallGame extends Sprite implements IModule
   {
      
      private var end_mc:MovieClip;
      
      private var start_mc:GameFirstPanel;
      
      private var end_ok_btn:SimpleButton;
      
      private var game:Game;
      
      private var _click_n:uint;
      
      public function KickBallGame()
      {
         super();
      }
      
      public function hide() : void
      {
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
      }
      
      private function destroyGame() : void
      {
         game.destroy();
      }
      
      public function showGame() : void
      {
         SocketConnection.addCmdListener(CommandID.JOIN_GAME,onJoinGame);
         SocketConnection.send(CommandID.JOIN_GAME,1);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
      }
      
      public function show() : void
      {
      }
      
      private function gameStartHandler(e:Event) : void
      {
         destroyGameStart();
         gameInt();
      }
      
      private function clickEndOkHandler(e:MouseEvent) : void
      {
         if(_click_n >= 100)
         {
            _click_n = 100;
         }
         SocketConnection.send(CommandID.GAME_OVER,_click_n,_click_n);
         end_ok_btn.removeEventListener(MouseEvent.CLICK,clickEndOkHandler);
         LevelManager.appLevel.removeChild(end_mc);
         end_mc = null;
         end_ok_btn = null;
      }
      
      private function hitUpHandler(e:Event) : void
      {
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         _click_n = game.clickNum();
         game.removeEventListener(Ball.HIT_UP,hitUpHandler);
         LevelManager.appLevel.removeChild(game);
         destroyGame();
         game.destroy();
         game = null;
         gameOverPanel();
      }
      
      private function gameInt() : void
      {
         game = new Game();
         game.addEventListener(Ball.HIT_UP,hitUpHandler);
         DisplayUtil.align(game,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(game);
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
      }
      
      private function initGame() : void
      {
         start_mc = new GameFirstPanel();
         start_mc.addEventListener(GameFirstPanel.GAME_OUT,gameOutHandler);
         start_mc.addEventListener(GameFirstPanel.GAME_START,gameStartHandler);
         DisplayUtil.align(start_mc,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(start_mc);
      }
      
      private function mouseDownHandler(e:MouseEvent) : void
      {
         if(game)
         {
            game.clickStage();
         }
      }
      
      private function gameOutHandler(e:Event) : void
      {
         start_mc.removeEventListener(GameFirstPanel.GAME_OUT,gameOutHandler);
         SocketConnection.send(CommandID.GAME_OVER,0,0);
         destroyGameStart();
         destroy();
      }
      
      private function destroyGameStart() : void
      {
         start_mc.removeEventListener(GameFirstPanel.GAME_OUT,gameOutHandler);
         start_mc.removeEventListener(GameFirstPanel.GAME_START,gameStartHandler);
         LevelManager.appLevel.removeChild(start_mc);
         start_mc.destroy();
         start_mc = null;
      }
      
      private function onJoinGame(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.JOIN_GAME,onJoinGame);
         initGame();
      }
      
      public function setup() : void
      {
         showGame();
      }
      
      private function gameOverPanel() : void
      {
         end_mc = new KickBallGameUI_end();
         end_ok_btn = end_mc["ok_btn"];
         end_mc.x = 0;
         end_mc.y = 0;
         LevelManager.appLevel.addChild(end_mc);
         end_ok_btn.addEventListener(MouseEvent.CLICK,clickEndOkHandler);
      }
   }
}


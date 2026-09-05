package com.robot.module.game
{
   import com.robot.app.task.taskUtils.taskDialog.NpcTipDialog;
   import com.robot.core.CommandID;
   import com.robot.core.SoundManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.game.shieldGame.com.taomee.container.GameContainer;
   import com.robot.module.game.shieldGame.com.taomee.event.GameStateEvent;
   import com.robot.module.game.shieldGame.com.taomee.utils.MCLoader;
   import flash.display.Sprite;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ShieldGame extends Sprite implements IModule
   {
      
      private var gameContainer:GameContainer;
      
      private var mcLib:MCLoader;
      
      public function ShieldGame()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         mcLib = null;
         DisplayUtil.removeForParent(gameContainer);
         gameContainer = null;
         LevelManager.openMouseEvent();
         if(!SoundManager.isPlay_b)
         {
            SoundManager.playSound();
         }
      }
      
      private function onGameCloseHandler(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.GAME_OVER,onGameCloseHandler);
         destroy();
      }
      
      public function setup() : void
      {
         mcLib = new MCLoader();
         gameContainer = new GameContainer(mcLib);
      }
      
      private function onGameFinishHandler(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.GAME_OVER,onGameFinishHandler);
         destroy();
         NpcTipDialog.show("双子阿尔法星的防卫战中，你的表现非常优异，这是给你的奖励。不要因为胜利就放松警惕哦！",null,NpcTipDialog.INSTRUCTOR);
      }
      
      private function gameFinishHandler(e:GameStateEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.GAME_OVER,onGameFinishHandler);
         SocketConnection.send(CommandID.GAME_OVER,e.finishState,e.gameScore);
      }
      
      private function gameOverHandler(e:GameStateEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.GAME_OVER,onGameOverHandler);
         SocketConnection.send(CommandID.GAME_OVER,0,0);
      }
      
      public function show() : void
      {
         if(!gameContainer)
         {
            setup();
         }
         init();
      }
      
      private function removeEvent() : void
      {
         gameContainer.removeEventListener("GAMEOVER",gameOverHandler);
         gameContainer.removeEventListener("GAMEFINISH",gameFinishHandler);
         gameContainer.removeEventListener("GAMECLOSE",gameCloseHandler);
      }
      
      public function init(data:Object = null) : void
      {
         LevelManager.closeMouseEvent();
         LevelManager.gameLevel.addChild(gameContainer);
         DisplayUtil.align(gameContainer,null,AlignType.TOP_LEFT);
         addEvent();
         if(SoundManager.isPlay_b)
         {
            SoundManager.stopSound();
         }
      }
      
      private function onGameOverHandler(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.GAME_OVER,onGameOverHandler);
         destroy();
         NpcTipDialog.show("不要轻言放弃，相信有一天你会成长为优秀的赛尔战士。",null,NpcTipDialog.INSTRUCTOR);
      }
      
      private function addEvent() : void
      {
         gameContainer.addEventListener("GAMEOVER",gameOverHandler);
         gameContainer.addEventListener("GAMEFINISH",gameFinishHandler);
         gameContainer.addEventListener("GAMECLOSE",gameCloseHandler);
      }
      
      public function destroy() : void
      {
         hide();
      }
      
      private function gameCloseHandler(e:GameStateEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.GAME_OVER,onGameCloseHandler);
         SocketConnection.send(CommandID.GAME_OVER,0,0);
      }
   }
}


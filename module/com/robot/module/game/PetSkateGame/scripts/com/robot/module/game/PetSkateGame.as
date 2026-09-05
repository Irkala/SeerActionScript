package com.robot.module.game
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.LevelObserver;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetSkateGame extends Sprite implements IModule
   {
      
      public static var owner:PetSkateGame;
      
      private var mailPanel:PetSkateMainPanel;
      
      private var btn:SimpleButton;
      
      public function PetSkateGame()
      {
         super();
         owner = this;
      }
      
      public function destroy() : void
      {
         hide();
         mailPanel.removeEventListener(PetSkateMainPanel.GAME_CLOSE,onGameClose);
         mailPanel.destroy();
         mailPanel = null;
      }
      
      public function hide() : void
      {
         LevelManager.showMapLevel();
         mailPanel.hide();
         DisplayUtil.removeForParent(mailPanel);
         DisplayUtil.removeForParent(btn);
      }
      
      private function onGameClose(event:Event) : void
      {
         SocketConnection.send(CommandID.GAME_OVER,100,100);
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function clear() : void
      {
         hide();
         SocketConnection.send(CommandID.GAME_OVER,100,100);
      }
      
      public function show() : void
      {
         LevelManager.hideMapLevel();
         mailPanel.show();
         LevelManager.gameLevel.addChild(mailPanel);
         LevelManager.gameLevel.addChild(btn);
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         var levelObs:LevelObserver = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         if(levelObs)
         {
            SocketConnection.send(CommandID.GAME_OVER,Math.floor(levelObs.level / 5 * 100),Math.floor(levelObs.level / 5 * 100));
         }
         else
         {
            SocketConnection.send(CommandID.GAME_OVER,0,0);
         }
         hide();
      }
      
      public function setup() : void
      {
         mailPanel = new PetSkateMainPanel();
         mailPanel.addEventListener(PetSkateMainPanel.GAME_CLOSE,onGameClose);
         btn = new petSkate_closeBtn();
         btn.addEventListener(MouseEvent.CLICK,closeHandler);
         DisplayUtil.align(btn,null,AlignType.TOP_RIGHT);
      }
   }
}


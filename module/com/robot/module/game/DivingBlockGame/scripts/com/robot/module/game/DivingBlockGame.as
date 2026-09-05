package com.robot.module.game
{
   import com.robot.core.manager.LevelManager;
   import com.robot.module.game.divingGame.DivingGame;
   import flash.display.Sprite;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class DivingBlockGame extends Sprite implements IModule
   {
      
      private var _game:DivingGame;
      
      public function DivingBlockGame()
      {
         super();
      }
      
      public function destroy() : void
      {
         _game.destroy();
      }
      
      public function hide() : void
      {
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_game))
         {
            DisplayUtil.removeForParent(_game);
            _game = null;
            _game = new DivingGame();
         }
         LevelManager.appLevel.addChild(_game);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _game = new DivingGame();
      }
   }
}


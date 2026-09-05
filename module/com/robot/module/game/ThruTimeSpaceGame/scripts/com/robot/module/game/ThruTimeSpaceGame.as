package com.robot.module.game
{
   import com.robot.core.manager.LevelManager;
   import com.robot.module.game.thruTimespace.ThroughTimespaceGame;
   import flash.display.Sprite;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ThruTimeSpaceGame extends Sprite implements IModule
   {
      
      private var _game:ThroughTimespaceGame;
      
      public function ThruTimeSpaceGame()
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
         if(_game)
         {
            _game.destroy();
            _game = null;
         }
         _game = new ThroughTimespaceGame();
         if(DisplayUtil.hasParent(_game))
         {
            return;
         }
         LevelManager.appLevel.addChild(_game);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
      }
   }
}


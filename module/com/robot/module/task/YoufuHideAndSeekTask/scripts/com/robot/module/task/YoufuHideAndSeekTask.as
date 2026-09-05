package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.module.task.YoufuHideAndSeekTask.HideAndSeekGame;
   import flash.display.Sprite;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class YoufuHideAndSeekTask extends Sprite implements IModule
   {
      
      private var _hideAndSeekGame:HideAndSeekGame = null;
      
      public function YoufuHideAndSeekTask()
      {
         super();
      }
      
      public function hide() : void
      {
         _hideAndSeekGame.visible = false;
      }
      
      public function show() : void
      {
         if(_hideAndSeekGame)
         {
            destroy();
            setup();
         }
         LevelManager.appLevel.addChild(_hideAndSeekGame);
         _hideAndSeekGame.x = 200;
         _hideAndSeekGame.y = 100;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         DisplayUtil.removeForParent(_hideAndSeekGame);
         _hideAndSeekGame = null;
      }
      
      public function setup() : void
      {
         _hideAndSeekGame = new HideAndSeekGame();
      }
   }
}


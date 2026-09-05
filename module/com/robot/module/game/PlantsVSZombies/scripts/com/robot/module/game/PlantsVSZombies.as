package com.robot.module.game
{
   import com.robot.core.manager.GamePlatformManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.utils.IGameMainPanel;
   import com.robot.module.game.plantsVsZombies.PlantsVsZombiesGamePanel;
   import com.robot.module.game.plantsVsZombies.ob.PlantsLevelManager;
   import flash.display.Sprite;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PlantsVSZombies extends Sprite implements IModule
   {
      
      public static var owner:PlantsVSZombies;
      
      private var mainPanel:IGameMainPanel;
      
      public function PlantsVSZombies()
      {
         super();
         owner = this;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
         mainPanel.hide();
         LevelManager.showAll(LevelManager.iconLevel,LevelManager.toolsLevel,LevelManager.mapLevel,LevelManager.topLevel,LevelManager.tipLevel);
      }
      
      public function show() : void
      {
         mainPanel = new PlantsVsZombiesGamePanel();
         addChild(mainPanel.sprite);
         LevelManager.gameLevel.addChild(this);
         mainPanel.show();
         LevelManager.hideAll(LevelManager.iconLevel,LevelManager.toolsLevel,LevelManager.mapLevel,LevelManager.topLevel,LevelManager.tipLevel);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function close(allWin:Boolean = false) : void
      {
         var p:uint = 0;
         if(allWin)
         {
            p = 100;
         }
         else
         {
            p = PlantsLevelManager.record / 9 * 100;
         }
         GamePlatformManager.gameOver(p,p);
         if(PlantsLevelManager.record >= 2)
         {
            GamePlatformManager.win();
         }
         else
         {
            GamePlatformManager.lost();
         }
         destroy();
      }
      
      public function destroy() : void
      {
         hide();
         mainPanel.destroy();
         mainPanel = null;
      }
      
      public function setup() : void
      {
      }
   }
}


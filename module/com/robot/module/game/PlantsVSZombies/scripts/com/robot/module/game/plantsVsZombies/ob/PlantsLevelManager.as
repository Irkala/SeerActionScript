package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.PlantsVSZombies;
   import com.robot.module.game.plantsVsZombies.manager.DragManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsLevelManager extends GameObserver implements IGameObserver
   {
      
      public static const LEVEL_UPDATE:String = "levelUpdate";
      
      public static var level:int = 0;
      
      public static var record:int = 0;
      
      private var mask:Sprite;
      
      private var returnBtn:SimpleButton;
      
      private var quitBtn:SimpleButton;
      
      private var optionPanel:MovieClip;
      
      private var restartBtn:SimpleButton;
      
      private var mc:MovieClip;
      
      private var optionBtn:SimpleButton;
      
      public function PlantsLevelManager(subject:GameSubject)
      {
         super(subject);
         mc = new plants_level_mc();
         mc.cacheAsBitmap = true;
         mc.y = 488;
         subject.container.addChild(mc);
         mc["levelMC"].gotoAndStop(level + 1);
         optionBtn = mc["optionBtn"];
         optionPanel = new plants_option_panel();
         optionPanel.gotoAndStop(1);
         optionPanel.x = MainManager.getStageWidth() / 2;
         optionPanel.y = MainManager.getStageHeight() / 2;
         returnBtn = optionPanel["mc"]["returnBtn"];
         restartBtn = optionPanel["mc"]["restartBtn"];
         quitBtn = optionPanel["mc"]["quitBtn"];
         returnBtn.addEventListener(MouseEvent.CLICK,returnHandler);
         restartBtn.addEventListener(MouseEvent.CLICK,restartHandler);
         quitBtn.addEventListener(MouseEvent.CLICK,quitHandler);
         mask = new Sprite();
         mask.graphics.beginFill(0,0);
         mask.graphics.drawRect(0,0,MainManager.getStageWidth(),MainManager.getStageHeight());
         mask.graphics.endFill();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         DisplayUtil.removeForParent(mc);
         mc = null;
         optionBtn.removeEventListener(MouseEvent.CLICK,showOption);
         optionBtn = null;
         returnBtn.removeEventListener(MouseEvent.CLICK,returnHandler);
         restartBtn.removeEventListener(MouseEvent.CLICK,restartHandler);
         quitBtn.removeEventListener(MouseEvent.CLICK,quitHandler);
         returnBtn = null;
         restartBtn = null;
         quitBtn = null;
         DisplayUtil.removeForParent(mask);
         mask = null;
         DisplayUtil.removeForParent(optionPanel);
         optionPanel = null;
      }
      
      private function quitHandler(event:MouseEvent) : void
      {
         PlantsVSZombies.owner.close();
      }
      
      override public function gameStart() : void
      {
         optionBtn.addEventListener(MouseEvent.CLICK,showOption);
         level = 0;
         mc["levelMC"].gotoAndStop(level + 1);
         record = level;
      }
      
      override public function nextLevel() : void
      {
         ++level;
         mc["levelMC"].gotoAndStop(level + 1);
         record = level;
         dispatchEvent(new DynamicEvent(LEVEL_UPDATE,level));
      }
      
      private function showOption(event:MouseEvent) : void
      {
         LevelManager.gameLevel.addChild(mask);
         LevelManager.gameLevel.addChild(optionPanel);
         optionPanel.gotoAndPlay(2);
      }
      
      override public function restart() : void
      {
         if(level > -1)
         {
            --level;
         }
         subject.nextLevel();
         record = level;
      }
      
      override public function gameOver() : void
      {
         record = level + 1;
         DragManager.clear();
      }
      
      private function returnHandler(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(optionPanel,false);
         DisplayUtil.removeForParent(mask);
      }
      
      private function restartHandler(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(optionPanel,false);
         DisplayUtil.removeForParent(mask);
         subject.gameOver();
         subject.restart();
      }
   }
}


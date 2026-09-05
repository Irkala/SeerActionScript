package com.robot.module.game.plantsVsZombies
{
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameMainPanel;
   import com.robot.module.game.PlantsVSZombies;
   import com.robot.module.game.plantsVsZombies.manager.DragManager;
   import com.robot.module.game.plantsVsZombies.manager.PlantsGameManager;
   import com.robot.module.game.plantsVsZombies.ob.*;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsVsZombiesGamePanel extends Sprite implements IGameMainPanel
   {
      
      private var firstMC:MovieClip = new plants_first_mc();
      
      private var subject:GameSubject;
      
      private var levelOB:PlantsLevelManager;
      
      private var helpMC:MovieClip = new plants_help_mc();
      
      private var sunshine:SunshineManager;
      
      public function PlantsVsZombiesGamePanel()
      {
         super();
         subject = new GameSubject(this);
         PlantsGameManager.subject = subject;
         new PlantsBgObserver(subject);
         var grid:PlantsGridObserver = new PlantsGridObserver(subject);
         new MushRoomManager(subject);
         levelOB = new PlantsLevelManager(subject);
         levelOB.addEventListener(PlantsLevelManager.LEVEL_UPDATE,onLevelUpdate);
         new PlantsTopBoxObserver(subject);
         new PlantsResultManager(subject);
         new EnemyManager(subject);
         subject.setup();
         DragManager.setup(grid);
         firstMC.x = MainManager.getStageWidth() / 2;
         firstMC.y = MainManager.getStageHeight() / 2;
         helpMC.x = MainManager.getStageWidth() / 2;
         helpMC.y = MainManager.getStageHeight() / 2;
         helpMC.gotoAndStop(1);
         firstMC["helpBtn"].addEventListener(MouseEvent.CLICK,helpHandler);
         firstMC["startBtn"].addEventListener(MouseEvent.CLICK,startHandler);
         helpMC["startBtn"].addEventListener(MouseEvent.CLICK,startHandler);
         firstMC["quitBtn"].addEventListener(MouseEvent.CLICK,quitHandler);
         helpMC["quitBtn"].addEventListener(MouseEvent.CLICK,quitHandler);
      }
      
      public function destroy() : void
      {
         hide();
         DragManager.destroy();
         subject.destroyAll();
         subject = null;
         firstMC["helpBtn"].removeEventListener(MouseEvent.CLICK,helpHandler);
         firstMC["startBtn"].removeEventListener(MouseEvent.CLICK,startHandler);
         helpMC["startBtn"].removeEventListener(MouseEvent.CLICK,startHandler);
         firstMC["quitBtn"].removeEventListener(MouseEvent.CLICK,quitHandler);
         helpMC["quitBtn"].removeEventListener(MouseEvent.CLICK,quitHandler);
         firstMC = null;
         helpMC = null;
      }
      
      private function quitHandler(event:MouseEvent) : void
      {
         PlantsVSZombies.owner.close();
      }
      
      public function show() : void
      {
         addChild(firstMC);
         MainManager.getStage().frameRate = 40;
      }
      
      public function get sprite() : Sprite
      {
         return this;
      }
      
      private function startHandler(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(firstMC);
         DisplayUtil.removeForParent(helpMC,false);
         subject.start();
      }
      
      private function helpHandler(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(firstMC);
         helpMC.gotoAndPlay(2);
         addChild(helpMC);
      }
      
      private function onLevelUpdate(event:DynamicEvent) : void
      {
         var level:uint = uint(event.paramObject);
         if(level > 4 && !sunshine)
         {
            sunshine = new SunshineManager(subject);
            sunshine.setup();
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(firstMC);
         DisplayUtil.removeForParent(helpMC,false);
         MainManager.getStage().frameRate = 24;
         subject.gameOver();
         if(levelOB)
         {
            levelOB.removeEventListener(PlantsLevelManager.LEVEL_UPDATE,onLevelUpdate);
         }
         levelOB = null;
         sunshine = null;
      }
   }
}


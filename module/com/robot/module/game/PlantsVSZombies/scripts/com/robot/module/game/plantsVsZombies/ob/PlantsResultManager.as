package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.PlantsVSZombies;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.Sound;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsResultManager extends GameObserver implements IGameObserver
   {
      
      private static var lostMC:MovieClip;
      
      private static var lostSound:Sound;
      
      private static var mask:Sprite;
      
      private static var movie:MovieClip;
      
      private static var winMC:MovieClip;
      
      private static var owner:PlantsResultManager;
      
      private static var winSound:Sound;
      
      private var quitBtn:SimpleButton;
      
      private var retryBtn:SimpleButton;
      
      private var continueBtn:SimpleButton;
      
      public function PlantsResultManager(s:GameSubject)
      {
         super(s);
         owner = this;
      }
      
      public static function lost() : void
      {
         lostSound.play(0,1);
         owner.subject.gameOver();
         lostMC.gotoAndPlay(1);
         LevelManager.gameLevel.addChild(mask);
         LevelManager.gameLevel.addChild(lostMC);
      }
      
      private static function showMovie() : void
      {
         if(!movie)
         {
            movie = new plants_end_movie();
         }
         movie.gotoAndPlay(2);
         movie.addEventListener(Event.ENTER_FRAME,onEnter);
         MainManager.getStage().addChild(movie);
      }
      
      private static function onEnter(event:Event) : void
      {
         if(movie.currentFrame == movie.totalFrames)
         {
            PlantsVSZombies.owner.close(true);
         }
      }
      
      public static function win() : void
      {
         winSound.play(0,1);
         if(PlantsLevelManager.level == 9)
         {
            showMovie();
            return;
         }
         owner.subject.gameOver();
         winMC.gotoAndPlay(1);
         LevelManager.gameLevel.addChild(mask);
         LevelManager.gameLevel.addChild(winMC);
      }
      
      private function retryHandler(event:MouseEvent) : void
      {
         subject.restart();
      }
      
      private function continueHandler(event:MouseEvent) : void
      {
         subject.nextLevel();
      }
      
      override public function nextLevel() : void
      {
         DisplayUtil.removeForParent(mask);
         DisplayUtil.removeForParent(winMC,false);
         DisplayUtil.removeForParent(lostMC,false);
      }
      
      override public function destroy() : void
      {
         winSound = null;
         lostSound = null;
         if(movie)
         {
            movie.removeEventListener(Event.ENTER_FRAME,onEnter);
         }
         DisplayUtil.removeForParent(movie);
         DisplayUtil.removeForParent(mask);
         DisplayUtil.removeForParent(winMC,false);
         DisplayUtil.removeForParent(lostMC,false);
         continueBtn.removeEventListener(MouseEvent.CLICK,continueHandler);
         retryBtn.removeEventListener(MouseEvent.CLICK,retryHandler);
         quitBtn.removeEventListener(MouseEvent.CLICK,quitHandler);
         continueBtn = null;
         retryBtn = null;
         quitBtn = null;
         winMC = null;
         lostMC = null;
      }
      
      private function quitHandler(event:MouseEvent) : void
      {
         PlantsVSZombies.owner.close();
      }
      
      override public function setup() : void
      {
         mask = new Sprite();
         mask.graphics.beginFill(0,0);
         mask.graphics.drawRect(0,0,MainManager.getStageWidth(),MainManager.getStageHeight());
         mask.graphics.endFill();
         winMC = new plants_win_panel();
         lostMC = new plants_lost_panel();
         winMC.x = lostMC.x = MainManager.getStageWidth() / 2;
         winMC.y = lostMC.y = MainManager.getStageHeight() / 2;
         continueBtn = winMC["mc"]["btn"];
         retryBtn = lostMC["mc"]["retryBtn"];
         quitBtn = lostMC["mc"]["quitBtn"];
         continueBtn.addEventListener(MouseEvent.CLICK,continueHandler);
         retryBtn.addEventListener(MouseEvent.CLICK,retryHandler);
         quitBtn.addEventListener(MouseEvent.CLICK,quitHandler);
         winSound = new plante_win_sound();
         lostSound = new plante_lost_sound();
      }
   }
}


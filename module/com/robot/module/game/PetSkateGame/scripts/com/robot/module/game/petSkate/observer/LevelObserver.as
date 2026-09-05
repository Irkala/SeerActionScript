package com.robot.module.game.petSkate.observer
{
   import com.robot.module.game.PetSkateGame;
   import com.robot.module.game.petSkate.BaseGameObserver;
   import com.robot.module.game.petSkate.BaseGameSubject;
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.grid.BaseGrid;
   import com.robot.module.game.petSkate.observer.grid.DoorGrid;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.taomee.utils.DisplayUtil;
   
   public class LevelObserver extends BaseGameObserver
   {
      
      public static var isShowMovie:Boolean = false;
      
      private var type:uint;
      
      private const WIN:uint = 1;
      
      private var _level:uint = 0;
      
      private var lostMC:MovieClip;
      
      private var timer:Timer;
      
      private var index:uint = 0;
      
      private var array:Array = [[new Point(5,5),new Point(9,6),new Point(12,5),new Point(15,6)],[new Point(3,4),new Point(4,7),new Point(13,7)],[new Point(14,4),new Point(2,6)],[]];
      
      private const LOST:uint = 0;
      
      private var movieTimer:Timer;
      
      private var winMC:MovieClip;
      
      public function LevelObserver(s:BaseGameSubject)
      {
         super(s);
         timer = new Timer(8000);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         winMC = new petSkate_win_mc();
         lostMC = new petSkate_lost_mc();
         winMC.x = lostMC.x = 40;
         winMC.y = lostMC.y = 40;
         movieTimer = new Timer(3000,1);
         movieTimer.addEventListener(TimerEvent.TIMER,onMovieTimer);
      }
      
      public function get level() : uint
      {
         if(_level > 4)
         {
            _level = 4;
         }
         return _level;
      }
      
      public function lost() : void
      {
         trace("输了");
         type = LOST;
         subject.container.addChild(lostMC);
         lostMC.gotoAndPlay(2);
      }
      
      private function changeGrid() : void
      {
         var i:Point = null;
         var grid:BaseGrid = null;
         var gridObs:GridObserver = PetSkateMainPanel.getObserver("GridObserver") as GridObserver;
         ++index;
         if(index >= array.length)
         {
            index = 0;
         }
         var arr:Array = array[index];
         for each(i in arr)
         {
            grid = gridObs.getGrid(i.x,i.y);
            trace(grid);
            grid.status = BaseGrid.TIME_STONE;
         }
      }
      
      public function win() : void
      {
         isShowMovie = true;
         type = WIN;
         subject.container.addChild(winMC);
         winMC.gotoAndPlay(2);
         movieTimer.start();
      }
      
      private function onMovieTimer(event:TimerEvent) : void
      {
         if(type == WIN)
         {
            ++_level;
            EnergyController.reset();
            if(_level == 5)
            {
               PetSkateGame.owner.clear();
               return;
            }
            subject.next();
            isShowMovie = false;
         }
         DisplayUtil.removeForParent(winMC);
         DisplayUtil.removeForParent(lostMC);
         winMC.gotoAndStop(1);
         lostMC.gotoAndStop(1);
      }
      
      private function onTimer(event:TimerEvent) : void
      {
         changeGrid();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         timer.stop();
         timer.removeEventListener(TimerEvent.TIMER,onTimer);
         timer = null;
         movieTimer.stop();
         movieTimer.removeEventListener(TimerEvent.TIMER,onMovieTimer);
         movieTimer = null;
         isShowMovie = false;
      }
      
      override public function next() : void
      {
         DisplayUtil.removeForParent(winMC);
         DisplayUtil.removeForParent(lostMC);
         winMC.gotoAndStop(1);
         lostMC.gotoAndStop(1);
         EnergyController.reset();
         DoorGrid.instance.reset();
         if(_level == 4)
         {
            timer.start();
         }
      }
   }
}


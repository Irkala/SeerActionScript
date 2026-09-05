package com.robot.module.game.petSkate.observer
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.petSkate.BaseGameObserver;
   import com.robot.module.game.petSkate.BaseGameSubject;
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.grid.BaseGrid;
   import com.robot.module.game.petSkate.observer.grid.BrokeAction;
   import com.robot.module.game.petSkate.observer.grid.EmptyAction;
   import com.robot.module.game.petSkate.observer.grid.PlayerGrid;
   import com.robot.module.game.petSkate.observer.grid.RockAction;
   import com.robot.module.game.petSkate.observer.grid.SingleDirAction;
   import com.robot.module.game.petSkate.observer.grid.TimeAction;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import org.taomee.manager.EventManager;
   
   public class PlayerObserver extends BaseGameObserver
   {
      
      public static var player:BaseGrid;
      
      public static const BEGIN_FIND:String = "beginFind";
      
      private var X_DIR:int;
      
      private var Y_DIR:int;
      
      private var isMoving:Boolean = false;
      
      private var xTimer:Timer;
      
      private var y_moveTimes:uint;
      
      private var speed:uint = 10;
      
      private var yTimer:Timer;
      
      private var targetIndexPoint:Point;
      
      private var nextGrid:BaseGrid;
      
      private var LEVEL_POS:Array = [new Point(3,3),new Point(9,6),new Point(14,3),new Point(16,12),new Point(2,11)];
      
      private var levelObs:LevelObserver;
      
      private var gridObs:GridObserver;
      
      private var frameRate:uint = 60;
      
      private var x_moveTimes:uint;
      
      private var isDown:Boolean = false;
      
      public function PlayerObserver(s:BaseGameSubject)
      {
         super(s);
         levelObs = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         player = new PlayerGrid(0,0);
         player.xIndex = LEVEL_POS[levelObs.level].x;
         player.yIndex = LEVEL_POS[levelObs.level].y;
      }
      
      private function removeTimerEvent() : void
      {
         if(xTimer)
         {
            xTimer.stop();
            xTimer.removeEventListener(TimerEvent.TIMER,onXTimer);
            xTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,onXTimerComp);
         }
         if(yTimer)
         {
            yTimer.stop();
            yTimer.removeEventListener(TimerEvent.TIMER,onYTimer);
            yTimer.removeEventListener(TimerEvent.TIMER_COMPLETE,onYTimerComp);
         }
      }
      
      override public function next() : void
      {
         player.xIndex = LEVEL_POS[levelObs.level].x;
         player.yIndex = LEVEL_POS[levelObs.level].y;
         player.x = LEVEL_POS[levelObs.level].x * BaseGrid.GRID_SIZE;
         player.y = LEVEL_POS[levelObs.level].y * BaseGrid.GRID_SIZE;
      }
      
      private function onYTimer(event:TimerEvent) : void
      {
         player.y += speed * Y_DIR;
      }
      
      override public function gameStart() : void
      {
         subject.container.addChild(player);
         MainManager.getStage().focus = MainManager.getStage();
         addEvent();
         gridObs = PetSkateMainPanel.getObserver("GridObserver") as GridObserver;
      }
      
      private function onXTimerComp(event:TimerEvent) : void
      {
         player.xIndex = targetIndexPoint.x - 1 * X_DIR;
         event.updateAfterEvent();
         isMoving = false;
         if(nextGrid)
         {
            nextGrid.hit();
         }
      }
      
      private function keyDown(event:KeyboardEvent) : void
      {
         if(isDown || isMoving || LevelObserver.isShowMovie)
         {
            return;
         }
         isDown = true;
         if(event.keyCode == Keyboard.RIGHT)
         {
            X_DIR = 1;
            Y_DIR = 0;
         }
         else if(event.keyCode == Keyboard.LEFT)
         {
            X_DIR = -1;
            Y_DIR = 0;
         }
         else if(event.keyCode == Keyboard.UP)
         {
            X_DIR = 0;
            Y_DIR = -1;
         }
         else
         {
            if(event.keyCode != Keyboard.DOWN)
            {
               return;
            }
            X_DIR = 0;
            Y_DIR = 1;
         }
         EventManager.dispatchEvent(new Event(BEGIN_FIND));
         find();
      }
      
      public function setXYDir(xdir:int, ydir:int) : void
      {
         X_DIR = xdir;
         Y_DIR = ydir;
      }
      
      public function find() : void
      {
         isMoving = true;
         var b_x:uint = player.posIndex.x;
         var b_y:uint = player.posIndex.y;
         var count:uint = 1;
         nextGrid = gridObs.getGrid(b_x + X_DIR * count,b_y + Y_DIR * count);
         while(nextGrid)
         {
            if(!(nextGrid.status == BaseGrid.NORMAL || nextGrid.isOpen))
            {
               break;
            }
            count++;
            nextGrid = gridObs.getGrid(b_x + X_DIR * count,b_y + Y_DIR * count);
         }
         if(nextGrid)
         {
            trace("nextGrid.posIndex-->",nextGrid.posIndex);
            targetIndexPoint = nextGrid.posIndex;
            move();
         }
         else
         {
            trace("过了");
            targetIndexPoint = gridObs.getGrid(b_x + X_DIR * (count - 1),b_y + Y_DIR * (count - 1)).posIndex;
            move();
         }
      }
      
      private function onYTimerComp(event:TimerEvent) : void
      {
         player.yIndex = targetIndexPoint.y - 1 * Y_DIR;
         event.updateAfterEvent();
         isMoving = false;
         if(nextGrid)
         {
            nextGrid.hit();
         }
      }
      
      private function onMove(event:Event) : void
      {
         find();
      }
      
      private function move() : void
      {
         removeTimerEvent();
         x_moveTimes = Math.abs(player.posIndex.x - targetIndexPoint.x);
         y_moveTimes = Math.abs(player.posIndex.y - targetIndexPoint.y);
         trace("第一次moveTimes:",x_moveTimes,y_moveTimes);
         if(x_moveTimes == 1 && y_moveTimes == 0 || x_moveTimes == 0 && y_moveTimes == 1)
         {
            if(x_moveTimes == 1 && (player.posIndex.x == 17 || player.posIndex.x == 1))
            {
               isMoving = false;
               return;
            }
            if(y_moveTimes == 1 && (player.posIndex.y == 13 || player.posIndex.y == 1))
            {
               isMoving = false;
               return;
            }
         }
         if(x_moveTimes > 0)
         {
            if(x_moveTimes == 1 && !(nextGrid.gridAction is EmptyAction))
            {
               if(nextGrid.gridAction is BrokeAction || nextGrid.gridAction is RockAction || nextGrid.gridAction is SingleDirAction || nextGrid.gridAction is TimeAction)
               {
                  isMoving = false;
               }
               nextGrid.hit();
               return;
            }
            x_moveTimes = uint((x_moveTimes - 1) * BaseGrid.GRID_SIZE / speed);
            xTimer = new Timer(1 / frameRate * 1000,x_moveTimes);
            xTimer.addEventListener(TimerEvent.TIMER,onXTimer);
            xTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onXTimerComp);
            xTimer.start();
         }
         if(y_moveTimes > 0)
         {
            if(y_moveTimes == 1 && !(nextGrid.gridAction is EmptyAction))
            {
               if(nextGrid.gridAction is BrokeAction || nextGrid.gridAction is RockAction || nextGrid.gridAction is SingleDirAction || nextGrid.gridAction is TimeAction)
               {
                  isMoving = false;
               }
               nextGrid.hit();
               return;
            }
            y_moveTimes = uint((y_moveTimes - 1) * BaseGrid.GRID_SIZE / speed);
            yTimer = new Timer(1 / frameRate * 1000,y_moveTimes);
            yTimer.addEventListener(TimerEvent.TIMER,onYTimer);
            yTimer.addEventListener(TimerEvent.TIMER_COMPLETE,onYTimerComp);
            yTimer.start();
         }
         trace("moveTimes:",x_moveTimes,y_moveTimes);
      }
      
      override public function gameOver() : void
      {
         removeEvent();
      }
      
      private function onXTimer(event:TimerEvent) : void
      {
         player.x += speed * X_DIR;
      }
      
      private function keyUp(event:KeyboardEvent) : void
      {
         isDown = false;
      }
      
      private function removeEvent() : void
      {
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,keyDown);
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_UP,keyUp);
         removeTimerEvent();
      }
      
      private function addEvent() : void
      {
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_DOWN,keyDown);
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_UP,keyUp);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         removeEvent();
         removeTimerEvent();
         player = null;
         gridObs = null;
         xTimer = null;
         yTimer = null;
         levelObs = null;
      }
   }
}


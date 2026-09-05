package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.observer.GridFactory;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseGrid extends Sprite
   {
      
      public static const TRUST:uint = 10;
      
      public static const NORMAL:uint = 0;
      
      public static const ROCK:uint = 1;
      
      public static const BROKE:uint = 2;
      
      public static const SINGLE_DIRECTION:uint = 3;
      
      public static const AUTO_MOVE:uint = 4;
      
      public static const TIME_STONE:uint = 5;
      
      public static const SNARE:uint = 6;
      
      public static const MONSTER:uint = 7;
      
      public static const ENERGY:uint = 8;
      
      public static const DOOR:uint = 100;
      
      public static const GRID_SIZE:uint = 40;
      
      private var level:uint;
      
      private var _status:uint = 0;
      
      private var y_i:uint;
      
      protected var stone:MovieClip;
      
      private var x_i:uint;
      
      private var action:IGridAction;
      
      public var direction:uint;
      
      public function BaseGrid(x_index:uint, y_index:uint)
      {
         super();
         xIndex = x_index;
         yIndex = y_index;
         this.cacheAsBitmap = true;
         action = new EmptyAction();
         initData();
      }
      
      public function hit() : void
      {
         action.hit();
      }
      
      public function get isOpen() : Boolean
      {
         return level == TRUST;
      }
      
      protected function initData() : void
      {
      }
      
      public function get gridAction() : IGridAction
      {
         return action;
      }
      
      public function get posIndex() : Point
      {
         return new Point(x_i,y_i);
      }
      
      public function set status(i:uint) : void
      {
         DisplayUtil.removeForParent(stone);
         stone = GridFactory.getGrid(i);
         addChild(stone);
         _status = i;
         action.destroy();
         if(status == NORMAL)
         {
            action = new EmptyAction();
         }
         else if(status == ROCK)
         {
            action = new RockAction();
         }
         else if(status == BROKE)
         {
            action = new BrokeAction(this);
         }
         else if(status == SINGLE_DIRECTION)
         {
            action = new SingleDirAction(this,direction);
         }
         else if(status == AUTO_MOVE)
         {
            action = new AutoMoveAction(this,direction);
         }
         else if(status == SNARE || status == MONSTER)
         {
            action = new DieAction();
         }
         else if(status == SNARE)
         {
            action = new DieAction();
         }
         else if(status == ENERGY)
         {
            action = new EnergyAction(this);
         }
         else if(status == TIME_STONE)
         {
            action = new TimeAction(this);
         }
      }
      
      public function set isOpen(b:Boolean) : void
      {
         if(b)
         {
            level = TRUST;
         }
         else
         {
            level = 0;
         }
      }
      
      public function set yIndex(i:uint) : void
      {
         y_i = i;
         this.y = i * GRID_SIZE;
      }
      
      public function set xIndex(i:uint) : void
      {
         x_i = i;
         this.x = i * GRID_SIZE;
      }
      
      public function get status() : uint
      {
         return _status;
      }
      
      public function destroy() : void
      {
         action.destroy();
         action = null;
      }
      
      public function get stoneMC() : MovieClip
      {
         return stone;
      }
   }
}


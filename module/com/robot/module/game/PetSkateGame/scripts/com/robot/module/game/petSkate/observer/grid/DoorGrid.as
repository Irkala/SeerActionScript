package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.LevelObserver;
   import com.robot.module.game.petSkate.observer.PlayerObserver;
   
   public class DoorGrid extends BaseGrid
   {
      
      private static var _grid:DoorGrid;
      
      private var _opened:Boolean = false;
      
      public function DoorGrid(x_index:uint, y_index:uint)
      {
         super(x_index,y_index);
         status = BaseGrid.DOOR;
      }
      
      public static function get instance() : DoorGrid
      {
         if(!_grid)
         {
            _grid = new DoorGrid(0,0);
         }
         return _grid;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         _opened = false;
      }
      
      override public function hit() : void
      {
         if(!opened)
         {
            return;
         }
         PlayerObserver.player.xIndex = this.posIndex.x;
         PlayerObserver.player.yIndex = this.posIndex.y;
         var levelObs:LevelObserver = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         levelObs.win();
      }
      
      public function get opened() : Boolean
      {
         return _opened;
      }
      
      public function open() : void
      {
         stone.gotoAndStop(2);
         _opened = true;
      }
      
      public function reset() : void
      {
         _opened = false;
      }
   }
}


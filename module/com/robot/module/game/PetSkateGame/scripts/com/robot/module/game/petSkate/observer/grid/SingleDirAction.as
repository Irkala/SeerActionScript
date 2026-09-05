package com.robot.module.game.petSkate.observer.grid
{
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.PlayerObserver;
   import flash.events.Event;
   import org.taomee.manager.EventManager;
   
   public class SingleDirAction implements IGridAction
   {
      
      private var grid:BaseGrid;
      
      private var dir:uint;
      
      private var playerObs:PlayerObserver;
      
      public function SingleDirAction(grid:BaseGrid, dir:uint = 2)
      {
         super();
         this.grid = grid;
         this.dir = dir;
         EventManager.addEventListener(PlayerObserver.BEGIN_FIND,onBeginFid);
         playerObs = PetSkateMainPanel.getObserver("PlayerObserver") as PlayerObserver;
         grid.stoneMC.gotoAndStop(dir);
      }
      
      public function destroy() : void
      {
         grid = null;
         EventManager.removeEventListener(PlayerObserver.BEGIN_FIND,onBeginFid);
      }
      
      public function hit() : void
      {
         var b:Boolean = false;
         if(dir == GridDirection.UP)
         {
            b = PlayerObserver.player.posIndex.y > grid.posIndex.y;
         }
         else if(dir == GridDirection.RIGHT)
         {
            b = PlayerObserver.player.posIndex.x < grid.posIndex.x;
         }
         else if(dir == GridDirection.DOWN)
         {
            b = PlayerObserver.player.posIndex.y < grid.posIndex.y;
         }
         else if(dir == GridDirection.LEFT)
         {
            b = PlayerObserver.player.posIndex.x > grid.posIndex.x;
         }
         if(b)
         {
            grid.isOpen = true;
            playerObs.find();
         }
      }
      
      private function onBeginFid(event:Event) : void
      {
         grid.isOpen = false;
      }
   }
}


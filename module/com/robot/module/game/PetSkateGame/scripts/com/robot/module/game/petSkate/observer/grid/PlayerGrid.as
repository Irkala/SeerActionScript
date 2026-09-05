package com.robot.module.game.petSkate.observer.grid
{
   public class PlayerGrid extends BaseGrid
   {
      
      public function PlayerGrid(x_index:uint, y_index:uint)
      {
         super(x_index,y_index);
         stone = new petSkate_player_mc();
         addChild(stone);
      }
   }
}


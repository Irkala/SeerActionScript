package com.robot.module.game.petSkate.observer
{
   import com.robot.module.game.petSkate.observer.grid.BaseGrid;
   import flash.display.MovieClip;
   import flash.filters.DropShadowFilter;
   
   public class GridFactory
   {
      
      public function GridFactory()
      {
         super();
      }
      
      public static function getGrid(type:uint) : MovieClip
      {
         var mc:MovieClip = null;
         if(type == BaseGrid.NORMAL)
         {
            mc = new MovieClip();
            mc.graphics.beginFill(0,0);
            mc.graphics.drawRect(0,0,BaseGrid.GRID_SIZE,BaseGrid.GRID_SIZE);
         }
         else if(type == BaseGrid.ROCK)
         {
            mc = new petSkate_stone_1();
            mc.filters = [new DropShadowFilter(4,45,4950213,0.7,3,3)];
         }
         else if(type == BaseGrid.BROKE)
         {
            mc = new petSkate_stone_2();
            mc.filters = [new DropShadowFilter(4,45,8428956,0.7,3,3)];
         }
         else if(type == BaseGrid.SINGLE_DIRECTION)
         {
            mc = new petSkate_stone_3();
            mc.filters = [new DropShadowFilter(4,45,0,0.6,3,3)];
         }
         else if(type == BaseGrid.AUTO_MOVE)
         {
            mc = new petSkate_stone_4();
            mc.filters = [new DropShadowFilter(4,45,0,0.6,3,3)];
         }
         else if(type == BaseGrid.TIME_STONE)
         {
            mc = new petSkate_stone_5();
         }
         else if(type == BaseGrid.SNARE)
         {
            mc = new petSkate_stone_6();
            mc.filters = [new DropShadowFilter(4,45,4950213,0.7,3,3)];
         }
         else if(type == BaseGrid.MONSTER)
         {
            mc = new petSkate_stone_7();
         }
         else if(type == BaseGrid.ENERGY)
         {
            mc = new petSkate_energy_mc();
         }
         else if(type == BaseGrid.DOOR)
         {
            mc = new petSkate_stone_100();
            mc.filters = [new DropShadowFilter(4,45,4950213,0.7,3,3)];
         }
         return mc;
      }
   }
}


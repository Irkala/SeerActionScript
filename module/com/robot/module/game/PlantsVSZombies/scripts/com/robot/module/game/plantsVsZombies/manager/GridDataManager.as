package com.robot.module.game.plantsVsZombies.manager
{
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import flash.geom.Point;
   import org.taomee.ds.HashMap;
   import org.taomee.gemo.IntDimension;
   
   public class GridDataManager
   {
      
      public static const offSet:Point = new Point(35,95);
      
      public static const gridDim:IntDimension = new IntDimension(108,106);
      
      private static var map:HashMap = new HashMap();
      
      public function GridDataManager()
      {
         super();
      }
      
      public static function add(row:uint, grid:BasePlantsGrid) : void
      {
         if(!map.containsKey(row))
         {
            map.add(row,[]);
         }
         map.getValue(row).push(grid);
      }
      
      public static function getList(row:uint) : Array
      {
         return map.getValue(row);
      }
   }
}


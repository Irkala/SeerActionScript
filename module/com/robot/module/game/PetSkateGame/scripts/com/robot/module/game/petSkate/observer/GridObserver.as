package com.robot.module.game.petSkate.observer
{
   import com.robot.module.game.petSkate.BaseGameObserver;
   import com.robot.module.game.petSkate.BaseGameSubject;
   import com.robot.module.game.petSkate.PetSkateMainPanel;
   import com.robot.module.game.petSkate.observer.grid.BaseGrid;
   import com.robot.module.game.petSkate.observer.grid.DoorGrid;
   import com.robot.module.game.petSkate.observer.grid.GridData;
   import org.taomee.ds.HashMap;
   import org.taomee.utils.DisplayUtil;
   
   public class GridObserver extends BaseGameObserver
   {
      
      private var map:HashMap;
      
      public function GridObserver(s:BaseGameSubject)
      {
         super(s);
         map = new HashMap();
         drawGrid();
      }
      
      override public function next() : void
      {
         drawGrid();
      }
      
      public function getGrid(x_index:uint, y_index:uint) : BaseGrid
      {
         return map.getValue(x_index + "_" + y_index);
      }
      
      private function drawGrid() : void
      {
         var g:BaseGrid = null;
         var w:uint = 0;
         var h:uint = 0;
         var levelObs:LevelObserver = null;
         var array:Array = null;
         var i:uint = 0;
         var _g:BaseGrid = null;
         var j:uint = 0;
         var num:Number = NaN;
         var dir:uint = 0;
         var grid:BaseGrid = null;
         var arr:Array = null;
         for each(g in map.getValues())
         {
            DisplayUtil.removeForParent(g);
         }
         map.clear();
         w = 18;
         h = 14;
         levelObs = PetSkateMainPanel.getObserver("LevelObserver") as LevelObserver;
         array = GridData["LEVEL_" + levelObs.level];
         for(i = 0; i < w; i++)
         {
            for(j = 0; j < h; j++)
            {
               num = Number(array[i][j]);
               dir = 0;
               if(num.toString().indexOf(".") != -1)
               {
                  arr = num.toString().split(".");
                  num = uint(arr[0]);
                  dir = uint(arr[1]);
               }
               if(num == BaseGrid.DOOR)
               {
                  grid = DoorGrid.instance;
                  grid.xIndex = i;
                  grid.yIndex = j;
                  grid.stoneMC.gotoAndStop(1);
               }
               else
               {
                  grid = new BaseGrid(i,j);
                  grid.direction = dir;
                  grid.status = num;
               }
               map.add(i + "_" + j,grid);
            }
         }
         for each(_g in map.getValues())
         {
            subject.container.addChild(_g);
         }
      }
      
      override public function destroy() : void
      {
         var i:BaseGrid = null;
         super.destroy();
         for each(i in map.getValues())
         {
            DisplayUtil.removeForParent(i);
         }
         map.clear();
         map = null;
      }
   }
}


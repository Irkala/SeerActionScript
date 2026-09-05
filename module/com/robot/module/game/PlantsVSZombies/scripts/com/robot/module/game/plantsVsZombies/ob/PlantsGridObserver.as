package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.plantsVsZombies.grid.BasePlantsGrid;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class PlantsGridObserver extends GameObserver implements IGameObserver
   {
      
      private var _sprite:Sprite;
      
      private var array:Array = [];
      
      public function PlantsGridObserver(subject:GameSubject)
      {
         super(subject);
         _sprite = new Sprite();
      }
      
      public function get gridList() : Array
      {
         return array;
      }
      
      override public function gameStart() : void
      {
         var j:uint = 0;
         var grid:BasePlantsGrid = null;
         var w:uint = Math.ceil(MainManager.getStageWidth() / GridDataManager.gridDim.width);
         var h:uint = Math.ceil(MainManager.getStageHeight() / GridDataManager.gridDim.height);
         if(w > 8)
         {
            w = 8;
         }
         if(h > 4)
         {
            h = 4;
         }
         for(var i:uint = 0; i < w; i++)
         {
            for(j = 0; j < h; j++)
            {
               grid = new BasePlantsGrid(i);
               grid.row = j;
               array.push(grid);
               grid.x = GridDataManager.gridDim.width * i + GridDataManager.offSet.x;
               grid.y = GridDataManager.gridDim.height * j + GridDataManager.offSet.y;
               _sprite.addChild(grid);
               GridDataManager.add(j,grid);
            }
         }
         subject.container.addChild(_sprite);
      }
      
      override public function nextLevel() : void
      {
         var i:BasePlantsGrid = null;
         for each(i in array)
         {
            i.carvernOut(false);
         }
      }
      
      override public function destroy() : void
      {
         var i:BasePlantsGrid = null;
         super.destroy();
         for each(i in array)
         {
            i.destroy();
         }
         DisplayUtil.removeAllChild(_sprite);
         DisplayUtil.removeForParent(_sprite);
         array = [];
         _sprite = null;
      }
   }
}


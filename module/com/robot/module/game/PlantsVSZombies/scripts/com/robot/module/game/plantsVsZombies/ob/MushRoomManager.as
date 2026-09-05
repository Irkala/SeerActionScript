package com.robot.module.game.plantsVsZombies.ob
{
   import com.robot.core.utils.GameObserver;
   import com.robot.core.utils.GameSubject;
   import com.robot.core.utils.IGameObserver;
   import com.robot.module.game.plantsVsZombies.manager.GridDataManager;
   import com.robot.module.game.plantsVsZombies.plants.Mushroom;
   import org.taomee.ds.HashMap;
   import org.taomee.utils.DisplayUtil;
   
   public class MushRoomManager extends GameObserver implements IGameObserver
   {
      
      private static var map:HashMap;
      
      public function MushRoomManager(subject:GameSubject)
      {
         super(subject);
      }
      
      public static function getMushroomList() : Array
      {
         return map.getValues();
      }
      
      public static function delMushroom(i:Mushroom) : void
      {
         map.remove(map.getKey(i));
      }
      
      public static function getMushroom(row:uint) : Mushroom
      {
         return map.getValue(row);
      }
      
      override public function setup() : void
      {
         var mushroom:Mushroom = null;
         map = new HashMap();
         for(var i:uint = 0; i < 4; i++)
         {
            mushroom = new Mushroom();
            mushroom.x = -20;
            mushroom.y = GridDataManager.offSet.y + (GridDataManager.gridDim.height - mushroom.height) / 2 + GridDataManager.gridDim.height * i;
            mushroom.row = i;
            subject.container.addChild(mushroom);
            map.add(i,mushroom);
         }
      }
      
      override public function nextLevel() : void
      {
         var i:Mushroom = null;
         var arr:Array = map.getValues().slice();
         for each(i in arr)
         {
            DisplayUtil.removeForParent(i);
            i.destroy();
         }
         map.clear();
         setup();
      }
      
      override public function destroy() : void
      {
         var i:Mushroom = null;
         super.destroy();
         for each(i in map.getValues())
         {
            DisplayUtil.removeForParent(i);
            i.destroy();
         }
         map.clear();
         map = null;
      }
   }
}


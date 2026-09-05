package com.robot.module.game.plantsVsZombies.plants
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.plantsVsZombies.ob.MushRoomManager;
   import com.robot.module.game.plantsVsZombies.planteMovie.PlanteMovie;
   import gs.TweenLite;
   import org.taomee.utils.DisplayUtil;
   
   public class Mushroom extends BasePlants implements IPlants
   {
      
      private var isAttack:Boolean = false;
      
      public function Mushroom()
      {
         super();
      }
      
      override public function destroy() : void
      {
         super.destroy();
         DisplayUtil.removeForParent(this);
         MushRoomManager.delMushroom(this);
      }
      
      override public function hit(attack:uint) : void
      {
         if(isAttack)
         {
            return;
         }
         isAttack = true;
         TweenLite.to(this,4,{
            "x":MainManager.getStageWidth() + 100,
            "onComplete":onComp
         });
      }
      
      override protected function getMC() : PlanteMovie
      {
         return new PlanteMovie([10017]);
      }
      
      private function onComp() : void
      {
         try
         {
            destroy();
         }
         catch(e:Error)
         {
         }
      }
   }
}


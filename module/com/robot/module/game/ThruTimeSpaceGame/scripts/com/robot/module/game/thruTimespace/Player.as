package com.robot.module.game.thruTimespace
{
   import com.robot.core.manager.MainManager;
   import com.robot.core.utils.KeySets;
   import com.robot.core.utils.PopKeys;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import org.taomee.utils.DisplayUtil;
   
   public class Player extends Sprite
   {
      
      private var stg:Stage;
      
      public var mc:MovieClip;
      
      public function Player()
      {
         super();
         mc = new ThruTimespace_PlayerMC();
         this.addChild(mc);
         mc.gotoAndStop(1);
         DisplayUtil.FillColor(mc["mc"]["mc"],MainManager.actorInfo.nonoColor);
         addEvent();
      }
      
      public function move() : void
      {
         if(PopKeys.isDown(KeySets.LEFT))
         {
            this.x -= 12;
         }
         if(PopKeys.isDown(KeySets.RIGHT))
         {
            this.x += 12;
         }
         if(PopKeys.isDown(KeySets.UP))
         {
            this.y -= 12;
         }
         if(PopKeys.isDown(KeySets.DOWN))
         {
            this.y += 12;
         }
      }
      
      private function removeEvent() : void
      {
         PopKeys.clearStageLis(stg);
      }
      
      private function addEvent() : void
      {
         stg = MainManager.getStage();
         stg.focus = MainManager.getStage();
         PopKeys.addStageLis(stg);
      }
      
      private function destroy() : void
      {
         removeEvent();
      }
   }
}


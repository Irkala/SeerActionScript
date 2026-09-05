package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class RemoveCard extends BasePlantsCard
   {
      
      public function RemoveCard()
      {
         super();
      }
      
      override protected function getIcon() : Sprite
      {
         var s:Sprite = new Sprite();
         var bmp:Bitmap = DisplayUtil.copyDisplayAsBmp(new plants_remove_tool());
         bmp.x = bmp.y = 0;
         s.addChild(bmp);
         return s;
      }
   }
}


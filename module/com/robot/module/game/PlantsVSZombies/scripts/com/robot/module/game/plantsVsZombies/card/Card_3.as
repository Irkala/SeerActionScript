package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class Card_3 extends BasePlantsCard
   {
      
      public function Card_3()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return 3;
      }
      
      override protected function getIcon() : Sprite
      {
         var s:Sprite = new Sprite();
         var bmp:Bitmap = DisplayUtil.copyDisplayAsBmp(new plants_pet_3());
         bmp.x = bmp.y = 0;
         s.addChild(bmp);
         return s;
      }
   }
}


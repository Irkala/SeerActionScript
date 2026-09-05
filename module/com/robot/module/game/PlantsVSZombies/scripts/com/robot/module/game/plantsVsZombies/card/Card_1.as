package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class Card_1 extends BasePlantsCard
   {
      
      public function Card_1()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return 1;
      }
      
      override protected function getIcon() : Sprite
      {
         var s:Sprite = new Sprite();
         var bmp:Bitmap = DisplayUtil.copyDisplayAsBmp(new plants_pet_1());
         bmp.x = bmp.y = 0;
         s.addChild(bmp);
         return s;
      }
   }
}


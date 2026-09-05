package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class Card_2 extends BasePlantsCard
   {
      
      public function Card_2()
      {
         super();
      }
      
      override public function get type() : uint
      {
         return 2;
      }
      
      override protected function getIcon() : Sprite
      {
         var s:Sprite = new Sprite();
         var bmp:Bitmap = DisplayUtil.copyDisplayAsBmp(new plants_pet_2());
         bmp.x = bmp.y = 0;
         s.addChild(bmp);
         return s;
      }
   }
}


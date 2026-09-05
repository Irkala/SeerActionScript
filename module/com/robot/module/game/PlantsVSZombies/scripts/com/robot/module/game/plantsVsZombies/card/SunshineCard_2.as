package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class SunshineCard_2 extends BaseSunshineCard
   {
      
      private var mc:MovieClip;
      
      public function SunshineCard_2()
      {
         super();
         _needPower = 100;
         cdTime = 3000;
      }
      
      override public function get type() : uint
      {
         return 2;
      }
      
      override protected function getCardMC() : MovieClip
      {
         return new plante_sunshine_card_2();
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


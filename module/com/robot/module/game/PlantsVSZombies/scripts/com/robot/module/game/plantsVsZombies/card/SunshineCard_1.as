package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class SunshineCard_1 extends BaseSunshineCard
   {
      
      private var mc:MovieClip;
      
      public function SunshineCard_1()
      {
         super();
         _needPower = 150;
         cdTime = 5000;
      }
      
      override public function get type() : uint
      {
         return 1;
      }
      
      override protected function getCardMC() : MovieClip
      {
         return new plante_sunshine_card_1();
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


package com.robot.module.game.plantsVsZombies.card
{
   import flash.display.Bitmap;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class SunshineCard_4 extends BaseSunshineCard
   {
      
      private var mc:MovieClip;
      
      public function SunshineCard_4()
      {
         super();
         _needPower = 50;
         cdTime = 8000;
      }
      
      override public function get type() : uint
      {
         return 4;
      }
      
      override protected function getCardMC() : MovieClip
      {
         return new plante_sunshine_card_4();
      }
      
      override protected function getIcon() : Sprite
      {
         var s:Sprite = new Sprite();
         var bmp:Bitmap = DisplayUtil.copyDisplayAsBmp(new plants_pet_4());
         bmp.x = bmp.y = 0;
         s.addChild(bmp);
         return s;
      }
   }
}


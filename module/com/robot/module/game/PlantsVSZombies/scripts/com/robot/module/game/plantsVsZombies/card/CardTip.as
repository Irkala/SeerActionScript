package com.robot.module.game.plantsVsZombies.card
{
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import org.taomee.utils.DisplayUtil;
   
   public class CardTip
   {
      
      private static var tipMC:MovieClip;
      
      public function CardTip()
      {
         super();
      }
      
      public static function destroy() : void
      {
         hide();
         tipMC = null;
      }
      
      public static function show(card:BasePlantsCard) : void
      {
         var num:uint = 0;
         if(!tipMC)
         {
            tipMC = new plants_tip_mc();
            tipMC.cacheAsBitmap = true;
            tipMC.gotoAndStop(1);
            tipMC.mouseChildren = tipMC.mouseEnabled = false;
         }
         if(card is Card_1)
         {
            num = 1;
         }
         else if(card is Card_2)
         {
            num = 2;
         }
         else if(card is Card_3)
         {
            num = 3;
         }
         else
         {
            num = 4;
         }
         tipMC.gotoAndStop(num);
         tipMC.x = MainManager.getStage().mouseX + 10;
         tipMC.y = MainManager.getStage().mouseY + 30;
         MainManager.getStage().addChild(tipMC);
      }
      
      public static function hide() : void
      {
         DisplayUtil.removeForParent(tipMC,false);
      }
   }
}


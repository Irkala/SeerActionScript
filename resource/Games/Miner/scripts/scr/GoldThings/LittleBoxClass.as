package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class LittleBoxClass extends BaseGold
   {
      
      public function LittleBoxClass()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 50;
         ActiveClaw.rebackSpeed = 4 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = 1.1;
         goldMC.y = 25.8;
      }
      
      override protected function getMC() : MovieClip
      {
         return new LittleBox();
      }
   }
}


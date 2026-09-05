package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class LittleGold extends BaseGold
   {
      
      public function LittleGold()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 10;
         ActiveClaw.rebackSpeed = 6 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = -40;
         goldMC.y = -59.5;
      }
      
      override protected function getMC() : MovieClip
      {
         return new LittleStone();
      }
   }
}


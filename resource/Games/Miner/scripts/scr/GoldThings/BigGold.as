package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class BigGold extends BaseGold
   {
      
      public function BigGold()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 30;
         ActiveClaw.rebackSpeed = 2 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.y = 10;
      }
      
      override protected function getMC() : MovieClip
      {
         return new BigStone();
      }
   }
}


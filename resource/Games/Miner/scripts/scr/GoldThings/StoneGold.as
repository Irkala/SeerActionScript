package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class StoneGold extends BaseGold
   {
      
      public function StoneGold()
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
         goldMC.x = -58.5;
         goldMC.y = -96.8;
      }
      
      override protected function getMC() : MovieClip
      {
         return new MiddleGold();
      }
   }
}


package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class DiamandClass extends BaseGold
   {
      
      public function DiamandClass()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 500;
         ActiveClaw.rebackSpeed = 2 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = 5.5;
         goldMC.y = -4.8;
      }
      
      override protected function getMC() : MovieClip
      {
         return new DiamandStone();
      }
   }
}


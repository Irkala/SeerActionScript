package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class UnkownBoxClass extends BaseGold
   {
      
      public function UnkownBoxClass()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = Math.floor(Math.random() * 10) * 10 + NextScrene.luckyAddScore;
         ActiveClaw.rebackSpeed = 10 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = -32.8;
         goldMC.y = -73.4;
      }
      
      override protected function getMC() : MovieClip
      {
         return new UnkownBox();
      }
   }
}


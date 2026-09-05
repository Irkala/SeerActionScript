package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class CapsoleClass extends BaseGold
   {
      
      public function CapsoleClass()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 700;
         ActiveClaw.rebackSpeed = 10 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = -43;
         goldMC.y = -40;
      }
      
      override protected function getMC() : MovieClip
      {
         return new Capsole();
      }
   }
}


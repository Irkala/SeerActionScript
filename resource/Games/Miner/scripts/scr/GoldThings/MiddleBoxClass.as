package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class MiddleBoxClass extends BaseGold
   {
      
      private var likeSound:LikeSound;
      
      public function MiddleBoxClass()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 250;
         ActiveClaw.rebackSpeed = 2 + NextScrene.luckyAddSpeed;
      }
      
      override protected function setPosition() : void
      {
         goldMC.x = -162.3;
         goldMC.y = 145;
      }
      
      override protected function getMC() : MovieClip
      {
         return new MiddleBox();
      }
   }
}


package scr.GoldThings
{
   import flash.display.MovieClip;
   import scr.Claw.ActiveClaw;
   import scr.MainMethod.NextScrene;
   
   public class MoveLittleGold extends BaseGold
   {
      
      private var speedBool:Boolean = true;
      
      public function MoveLittleGold()
      {
         super();
      }
      
      override protected function addScore() : void
      {
         BaseGold.goldScore = 700;
         ActiveClaw.rebackSpeed = 3 + NextScrene.luckyAddSpeed;
      }
      
      override protected function moveStone() : void
      {
         if(speedBool == true)
         {
            goldMC.x += speed;
         }
         else
         {
            goldMC.x -= speed;
         }
         if(goldMC.x > 700)
         {
            speedBool = false;
         }
         else if(goldMC.x < 200)
         {
            speedBool = true;
         }
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


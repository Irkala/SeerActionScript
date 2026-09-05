package scr.GoldThings
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.utils.Timer;
   import scr.Claw.ActiveClaw;
   import scr.Claw.TimerClass;
   import scr.MainMethod.NextScrene;
   
   public class BaseGold
   {
      
      public static var goldScore:Number;
      
      public static var returnClaw:Boolean = false;
      
      public static var hitBool:Boolean = false;
      
      public var speed:Number = 5;
      
      private var clickPoint:Point;
      
      private var timerReturn:Timer;
      
      public var goldMC:MovieClip;
      
      private var clawGold2:ClawGold;
      
      public function BaseGold()
      {
         super();
         goldMC = getMC();
         hitBool = false;
         goldMC.addEventListener(Event.ENTER_FRAME,clawGold);
      }
      
      protected function getMC() : MovieClip
      {
         return null;
      }
      
      protected function setPosition() : void
      {
      }
      
      protected function goldSound() : void
      {
         if(Miner.soundBool == true)
         {
            clawGold2 = new ClawGold();
            clawGold2.play();
         }
      }
      
      protected function addScore() : void
      {
      }
      
      protected function moveStone() : void
      {
      }
      
      public function LikeSoun() : void
      {
         clawGold2 = new ClawGold();
         clawGold2.play();
      }
      
      protected function clawGold(e:Event) : void
      {
         moveStone();
         if(TimerClass.remov == true)
         {
            goldMC.removeEventListener(Event.ENTER_FRAME,clawGold);
            goldMC = null;
         }
         if(goldMC)
         {
            if(hitBool == false)
            {
               if(ActiveClaw.clawBool == true)
               {
                  if(Boolean(ActiveClaw.arm.clawHi.hitTestObject(goldMC.mc)) && !goldMC["isCatch"])
                  {
                     hitBool = true;
                     speed = 0;
                     goldMC["isCatch"] = true;
                     goldMC.x = 0;
                     goldMC.y = 0;
                     trace(goldMC.x,goldMC.y);
                     ActiveClaw.lengthBool = true;
                     ActiveClaw.rebackSpeed = 5 + NextScrene.luckyAddSpeed;
                     returnClaw = true;
                     goldSound();
                     ActiveClaw.arm.clawHi.gotoAndStop(2);
                     ActiveClaw.arm.clawHi.addChild(goldMC);
                     setPosition();
                     addScore();
                  }
               }
            }
         }
      }
   }
}


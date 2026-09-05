package scr.Claw
{
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import org.taomee.utils.DisplayUtil;
   import scr.GoldLevel.SetLevel;
   import scr.MainMethod.NextScrene;
   
   public class TimerClass
   {
      
      public static var timeNum:Number = 60;
      
      public static var levelNum:Number = 1;
      
      public static var stopEvent:Boolean = true;
      
      public static var remov:Boolean = false;
      
      public var timer:Timer;
      
      private var winGame:WinGame;
      
      private var nextScr:NextScrene;
      
      private var failGame:FailGame;
      
      public function TimerClass()
      {
         super();
      }
      
      private function nextLever(e:TimerEvent) : void
      {
         var mc:MovieClip = null;
         if(timer)
         {
            timer.removeEventListener(TimerEvent.TIMER,createGold);
            timer = null;
         }
         NextScrene.likeBool = false;
         ++levelNum;
         DisplayUtil.removeAllChild(NextScrene.con);
         SetLevel.goldArray = [];
         if(levelNum < 11)
         {
            if(SetLevel.hadScore >= SetLevel.AimScore)
            {
               nextScr = new NextScrene();
               nextScr.central();
            }
            else if(Miner.closeGameStr != "closed" && Miner.getRoot().numChildren > 0)
            {
               Miner.soundBool = false;
               DisplayUtil.removeAllChild(ActiveClaw.con2);
               failGame = new FailGame();
               Miner.getRoot().addChild(failGame);
               failGame.scaleX = failGame.scaleY = 1.5;
               failGame.x = 60;
               failGame.y = 20;
            }
         }
         else
         {
            Miner.soundBool = false;
            DisplayUtil.removeAllChild(ActiveClaw.con2);
            winGame = new WinGame();
            Miner.getRoot().addChild(winGame);
            winGame.scaleX = winGame.scaleY = 1.5;
            winGame.x = 40;
            winGame.y = 20;
         }
         TimerClass.timeNum = 60;
         remov = true;
         stopEvent = false;
         ActiveClaw.arm.clawHi.gotoAndStop(1);
         var anum:uint = uint(ActiveClaw.arm.numChildren);
         for(var i:uint = 0; i < anum; i++)
         {
            mc = ActiveClaw.arm.getChildAt(i) as MovieClip;
            if(mc)
            {
               mc.y = mc["oldY"];
            }
         }
         if(ActiveClaw.arm.clawHi.numChildren > 4)
         {
            ActiveClaw.arm.clawHi.removeChildAt(4);
         }
         ActiveClaw.arm.rotation = -80;
      }
      
      public function timeControl() : void
      {
         timer = new Timer(1000,60);
         timer.addEventListener(TimerEvent.TIMER,createGold);
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,nextLever);
      }
      
      private function createGold(e:TimerEvent) : void
      {
         --timeNum;
         trace(timeNum);
         if(Miner.closeGameStr == "closed")
         {
            timer.removeEventListener(TimerEvent.TIMER,createGold);
            timer = null;
         }
         stopEvent = true;
      }
      
      public function timerStart() : void
      {
         timer.start();
         Miner.mainScrene.mouseEnabled = true;
      }
   }
}


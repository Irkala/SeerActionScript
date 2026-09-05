package scr.MainMethod
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.SoundChannel;
   import scr.Claw.ActiveClaw;
   import scr.Claw.TimerClass;
   import scr.GoldLevel.SetLevel;
   
   public class NextScrene extends Sprite
   {
      
      public static var likeBool:Boolean;
      
      public static var con:Sprite;
      
      public static var firstBool:Boolean = true;
      
      public static var luckyAddScore:Number = 0;
      
      public static var luckyAddSpeed:Number = 0;
      
      public static var bombBool:Boolean = false;
      
      private var setLevel:SetLevel;
      
      private var activeClaw:ActiveClaw = new ActiveClaw();
      
      private var txtTip:taskTip;
      
      private var shopMC:ShopMC;
      
      private var actionPlay:ActionPlay;
      
      private var firstScr:FirstScrene;
      
      private var actChannal:SoundChannel;
      
      private var aimText:AimText;
      
      private var soundCh2:SoundChannel = new SoundChannel();
      
      private var hadText:HadText;
      
      private var clickSound:ClickSound;
      
      private var timerClass:TimerClass;
      
      private var screneSound:ScreneSound;
      
      private var bool:Boolean = true;
      
      private var levelSet:LevelSet;
      
      public function NextScrene()
      {
         super();
      }
      
      private function addLuckyStar(e:MouseEvent) : void
      {
         if(SetLevel.hadScore >= 100)
         {
            if(Miner.soundBool = true)
            {
               clickSound = new ClickSound();
               clickSound.play();
            }
            luckyAddScore = 100;
            SetLevel.hadScore -= 100;
            shopMC.luckyStar.mouseEnabled = false;
            shopMC.luckyStar.alpha = 0.8;
         }
      }
      
      private function goldNum(e:Event) : void
      {
         shopMC.goldTxt.text = SetLevel.hadScore.toString();
      }
      
      private function timeCount(e:Event) : void
      {
         txtTip.tipTxt.text = " " + TimerClass.timeNum.toString();
         levelSet.levelSet.text = TimerClass.levelNum.toString();
         aimText.aimTxt.text = SetLevel.AimScore.toString();
         hadText.haveTxt.text = "" + SetLevel.hadScore.toString();
      }
      
      public function central() : void
      {
         if(actChannal)
         {
            actChannal.stop();
         }
         if(firstBool == true)
         {
            firstScr = new FirstScrene();
            Miner.getRoot().addChild(firstScr);
            firstScr.x = 35;
            firstScr.y = 10;
            firstScr.scaleX = firstScr.scaleY = 1.2;
            firstScr.actionP.addEventListener(MouseEvent.CLICK,appearScrene);
            firstBool = false;
         }
         else
         {
            shopMC = new ShopMC();
            Miner.getRoot().addChild(shopMC);
            shopMC.x = 20;
            shopMC.y = 70;
            bombBool = false;
            luckyAddScore = 0;
            luckyAddSpeed = 0;
            shopMC.addBomb.addEventListener(MouseEvent.CLICK,addBomb);
            shopMC.luckyStar.addEventListener(MouseEvent.CLICK,addLuckyStar);
            shopMC.addEnegy.addEventListener(MouseEvent.CLICK,addEnegy);
            shopMC.goldTxt.addEventListener(Event.ENTER_FRAME,goldNum);
            shopMC.nextBtn.addEventListener(MouseEvent.CLICK,appearScrene);
         }
      }
      
      private function addBomb(e:MouseEvent) : void
      {
         bool = false;
         if(SetLevel.hadScore >= 200)
         {
            if(Miner.soundBool == true)
            {
               clickSound = new ClickSound();
               clickSound.play();
            }
            bombBool = true;
            SetLevel.hadScore -= 200;
            shopMC.addBomb.mouseEnabled = false;
            shopMC.addBomb.alpha = 0.8;
         }
      }
      
      private function addEnegy(e:MouseEvent) : void
      {
         if(SetLevel.hadScore >= 350)
         {
            if(Miner.soundBool == true)
            {
               clickSound = new ClickSound();
               clickSound.play();
            }
            luckyAddSpeed = 2;
            SetLevel.hadScore -= 350;
            shopMC.addEnegy.mouseEnabled = false;
            shopMC.addEnegy.alpha = 0.8;
         }
      }
      
      private function appearScrene(e:MouseEvent) : void
      {
         if(Miner.soundBool == true)
         {
            clickSound = new ClickSound();
            actChannal = clickSound.play();
         }
         likeBool = true;
         if(shopMC)
         {
            Miner.getRoot().removeChild(shopMC);
            shopMC.nextBtn.removeEventListener(MouseEvent.CLICK,appearScrene);
         }
         if(firstScr)
         {
            Miner.getRoot().removeChild(firstScr);
            firstScr.actionP.removeEventListener(MouseEvent.CLICK,appearScrene);
         }
         activeClaw.clear();
         con = new Sprite();
         Miner.getRoot().addChild(con);
         txtTip = new taskTip();
         NextScrene.con.addChild(txtTip);
         txtTip.scaleX = txtTip.scaleY = 0.9;
         txtTip.x = 700;
         txtTip.y = 10;
         levelSet = new LevelSet();
         NextScrene.con.addChild(levelSet);
         levelSet.scaleX = levelSet.scaleY = 0.9;
         levelSet.x = 700;
         levelSet.y = 420;
         aimText = new AimText();
         NextScrene.con.addChild(aimText);
         aimText.scaleX = aimText.scaleY = 0.9;
         aimText.x = 25;
         aimText.y = 10;
         hadText = new HadText();
         NextScrene.con.addChild(hadText);
         hadText.scaleX = hadText.scaleY = 0.9;
         hadText.x = 25;
         hadText.y = 420;
         activeClaw.moveClaw();
         timerClass = new TimerClass();
         timerClass.timeControl();
         timerClass.timerStart();
         txtTip.addEventListener(Event.ENTER_FRAME,timeCount);
         setLevel = new SetLevel();
         setLevel.levelSet();
         TimerClass.remov = false;
      }
   }
}


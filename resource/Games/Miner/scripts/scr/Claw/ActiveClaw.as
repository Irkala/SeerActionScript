package scr.Claw
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.SoundChannel;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import gs.easing.*;
   import scr.GoldLevel.SetLevel;
   import scr.GoldThings.BaseGold;
   import scr.MainMethod.NextScrene;
   
   public class ActiveClaw extends Sprite
   {
      
      public static var arm:MovieClip;
      
      public static var clawBool:Boolean;
      
      public static var con2:Sprite;
      
      public static var fried:MovieClip;
      
      public static var stopRotationBool:Boolean = true;
      
      public static var lengthBool:Boolean = false;
      
      public static var rebackSpeed:Number = 8;
      
      private var timerHander:Timer;
      
      private var roteBool:Boolean = false;
      
      private var armNum:uint = 10;
      
      private var bombAct:BombExplod;
      
      private var returnArm:ReturnArm;
      
      private var armSound:ArmSound;
      
      private var soundCh2:SoundChannel = new SoundChannel();
      
      private var unLikeSound:UnlikeGold;
      
      private var bomb:MovieClip;
      
      private var soundCh:SoundChannel;
      
      private var armBool:Boolean = true;
      
      private var actArm:ActionArm;
      
      private var bombBool:Boolean = false;
      
      private var isBoomBeHit:Boolean = false;
      
      private var likeSound:LikeSound;
      
      private var returnBool:Boolean;
      
      private var isDestroy:Boolean = true;
      
      public function ActiveClaw()
      {
         super();
      }
      
      private function changeLengthBool(e:MouseEvent) : void
      {
         rebackSpeed = 8;
         stopRotationBool = false;
         Miner.mainScrene.mouseEnabled = false;
         if(Miner.soundBool == true)
         {
            soundCh = new SoundChannel();
            returnBool = true;
            actArm = new ActionArm();
            soundCh = actArm.play();
            setTimeout(delay,1000);
         }
         if(TimerClass.stopEvent == true)
         {
         }
      }
      
      private function delay() : void
      {
         soundCh.stop();
      }
      
      private function continueMove(e:TimerEvent) : void
      {
         stopRotationBool = true;
         armBool = true;
         Miner.mainScrene.mouseEnabled = true;
      }
      
      private function clawStone(e:TimerEvent) : void
      {
         if(armBool == false)
         {
            arm.prevFrame();
         }
      }
      
      public function clear() : void
      {
         Miner.getRoot().removeEventListener(KeyboardEvent.KEY_UP,launch);
      }
      
      private function delay2() : void
      {
         soundCh2.stop();
      }
      
      public function move() : void
      {
      }
      
      private function launch(e:KeyboardEvent) : void
      {
         switch(e.keyCode)
         {
            case 32:
               if(NextScrene.bombBool)
               {
                  if(BaseGold.hitBool)
                  {
                     NextScrene.bombBool = false;
                     bomb = new Bomb();
                     bomb.addEventListener(Event.ENTER_FRAME,launchBomb);
                     if(!arm.contains(bomb) && isDestroy)
                     {
                        bomb.x = 0;
                        bomb.y = 0;
                        bomb.gotoAndStop(1);
                        arm.addChild(bomb);
                        isDestroy = false;
                     }
                  }
               }
         }
      }
      
      public function moveClaw() : void
      {
         init();
      }
      
      private function init() : void
      {
         var num:uint = 0;
         var i:uint = 0;
         var mc:MovieClip = null;
         con2 = new Sprite();
         Miner.getRoot().addChild(con2);
         if(!arm)
         {
            arm = new MainClaw2();
            arm.cacheAsBitmap = true;
            arm.x = 490;
            arm.y = 460;
            arm.clawHi.gotoAndStop(1);
            con2.addChild(arm);
            num = uint(arm.numChildren);
            for(i = 0; i < num; i++)
            {
               mc = arm.getChildAt(i) as MovieClip;
               if(mc)
               {
                  mc["oldY"] = mc.y;
               }
            }
         }
         if(!fried)
         {
            fried = new Fried();
            fried.cacheAsBitmap = true;
            con2.addChild(fried);
            fried.scaleX = fried.scaleY = 0.8;
            fried.x = 350;
            fried.y = 440;
         }
         arm.rotation = -80;
         stopRotationBool = true;
         roteBool = false;
         TimerClass.stopEvent = true;
         bombBool = false;
         arm.addEventListener(Event.ENTER_FRAME,circle);
         NextScrene.con.addEventListener(MouseEvent.CLICK,changeLengthBool);
         Miner.mainScrene.addEventListener(MouseEvent.CLICK,changeLengthBool);
         Miner.getRoot().addEventListener(KeyboardEvent.KEY_UP,launch);
      }
      
      private function launchBomb(e:Event) : void
      {
         NextScrene.bombBool = false;
         bomb.y -= 10;
         if(BaseGold.hitBool == true)
         {
            if(bomb.hitTestObject(arm.clawHi.getChildAt(arm.clawHi.numChildren - 1)))
            {
               if(!isBoomBeHit)
               {
                  isBoomBeHit = true;
                  arm.clawHi.getChildAt(arm.clawHi.numChildren - 1).visible = false;
                  bomb.gotoAndStop(2);
                  if(Miner.soundBool == true)
                  {
                     bombAct = new BombExplod();
                     bombAct.play();
                  }
                  bomb.removeEventListener(Event.ENTER_FRAME,launchBomb);
                  setTimeout(function():void
                  {
                     arm.removeChild(bomb);
                     isBoomBeHit = false;
                     isDestroy = true;
                  },2000);
                  bombBool = true;
                  rebackSpeed = 8;
                  ActiveClaw.arm.clawHi.gotoAndStop(1);
               }
            }
         }
      }
      
      private function circle(e:Event) : void
      {
         var num:uint = 0;
         var i:uint = 0;
         var mc:MovieClip = null;
         if(stopRotationBool == true)
         {
            if(roteBool == false)
            {
               arm.rotation += 2;
            }
            else
            {
               arm.rotation -= 2;
            }
            if(arm.rotation == 80)
            {
               roteBool = true;
            }
            if(arm.rotation == -80)
            {
               roteBool = false;
            }
         }
         else
         {
            if(arm["barMC"].y < -450)
            {
               lengthBool = true;
            }
            num = uint(arm.numChildren);
            for(i = 0; i < num; i++)
            {
               mc = arm.getChildAt(i) as MovieClip;
               if(mc)
               {
                  if(!lengthBool)
                  {
                     clawBool = true;
                     mc.y -= 8;
                  }
                  else if(arm["barMC"].y + rebackSpeed > arm["barMC"]["oldY"])
                  {
                     lengthBool = false;
                     mc.y = mc["oldY"];
                     stopRotationBool = true;
                     arm.clawHi.gotoAndStop(1);
                     if(soundCh2)
                     {
                        soundCh2.stop();
                     }
                     if(BaseGold.hitBool == true)
                     {
                        if(arm.clawHi.getChildAt(arm.clawHi.numChildren - 1).visible == true)
                        {
                           SetLevel.hadScore += BaseGold.goldScore;
                           if(Miner.soundBool == true)
                           {
                              if(BaseGold.goldScore >= 50)
                              {
                                 if(NextScrene.likeBool == true)
                                 {
                                    likeSound = new LikeSound();
                                    likeSound.play();
                                 }
                              }
                              else if(NextScrene.likeBool == true)
                              {
                                 unLikeSound = new UnlikeGold();
                                 unLikeSound.play();
                              }
                           }
                        }
                        if(arm.clawHi.numChildren > 4)
                        {
                           arm.clawHi.removeChildAt(arm.clawHi.numChildren - 1);
                        }
                     }
                     BaseGold.hitBool = false;
                     Miner.mainScrene.mouseEnabled = true;
                  }
                  else
                  {
                     if(returnBool == true)
                     {
                        soundCh.stop();
                        returnArm = new ReturnArm();
                        soundCh2 = new SoundChannel();
                        soundCh2 = returnArm.play();
                        returnBool = false;
                        setTimeout(delay2,1000);
                     }
                     mc.y += rebackSpeed;
                     clawBool = false;
                  }
               }
            }
         }
         if(armBool == true)
         {
         }
         if(TimerClass.stopEvent == false)
         {
            arm.removeEventListener(Event.ENTER_FRAME,circle);
         }
      }
   }
}


package gunCon
{
   import bullet.BaseBullet;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.utils.Timer;
   import observer.BuyGunObserver;
   import subject.MouseMove;
   
   public class BaseGun implements IGun
   {
      
      protected var timer:Timer;
      
      public var isOK:Boolean = false;
      
      protected var gunMC:MovieClip;
      
      private var soundGun1:Sound;
      
      private var soundGun2:Sound;
      
      private var soundGun3:Sound;
      
      private var soundGun4:Sound;
      
      private var soundGun5:Sound;
      
      public var bul:BaseBullet;
      
      public function BaseGun()
      {
         super();
         timer = new Timer(getDelay());
         timer.addEventListener(TimerEvent.TIMER,timerHandler);
         gunMC = getMC();
      }
      
      public function shot() : void
      {
         isOK = true;
         --bul.num;
         if(BuyGunObserver.stageScrene == true)
         {
            if(this is Gun1)
            {
               --BuyGunObserver.bulletCount1;
               if(MouseMove.soundBool == true)
               {
                  soundGun1 = new SoundGun1();
                  soundGun1.play();
               }
            }
            else if(this is Gun2)
            {
               --BuyGunObserver.bulletCount2;
               if(MouseMove.soundBool == true)
               {
                  soundGun2 = new SoundGun2();
                  soundGun2.play();
               }
            }
            else if(this is Gun3)
            {
               --BuyGunObserver.bulletCount3;
               if(MouseMove.soundBool == true)
               {
                  soundGun3 = new SoundGun3();
                  soundGun3.play();
               }
            }
            else if(this is Gun4)
            {
               --BuyGunObserver.bulletCount4;
               if(MouseMove.soundBool == true)
               {
                  soundGun4 = new SoundGun4();
                  soundGun4.play();
               }
            }
            else if(this is Gun5)
            {
               --BuyGunObserver.bulletCount5;
               if(MouseMove.soundBool == true)
               {
                  soundGun5 = new SoundGun5();
                  soundGun5.play();
               }
            }
         }
         gunMC.gotoAndPlay(2);
      }
      
      public function clear() : void
      {
         timer.stop();
         timer.removeEventListener(TimerEvent.TIMER,timerHandler);
         timer = null;
         gunMC = null;
      }
      
      public function get gunIcon() : MovieClip
      {
         return gunMC;
      }
      
      public function stopShot() : void
      {
         timer.stop();
         isOK = false;
         gunMC.gotoAndStop(1);
      }
      
      private function timerHandler(event:TimerEvent) : void
      {
         if(bul.num > 0)
         {
            gunMC.gotoAndPlay(2);
            --bul.num;
            if(this is Gun1)
            {
               --BuyGunObserver.bulletCount1;
               if(MouseMove.soundBool == true)
               {
                  soundGun1 = new SoundGun1();
                  soundGun1.play();
               }
            }
            else if(this is Gun2)
            {
               --BuyGunObserver.bulletCount2;
               if(MouseMove.soundBool == true)
               {
                  soundGun2 = new SoundGun2();
                  soundGun2.play();
               }
            }
            else if(this is Gun3)
            {
               --BuyGunObserver.bulletCount3;
               if(MouseMove.soundBool == true)
               {
                  soundGun3 = new SoundGun3();
                  soundGun3.play();
               }
            }
            else if(this is Gun4)
            {
               --BuyGunObserver.bulletCount4;
               if(MouseMove.soundBool == true)
               {
                  soundGun4 = new SoundGun4();
                  soundGun4.play();
               }
            }
            else if(this is Gun5)
            {
               --BuyGunObserver.bulletCount5;
               if(MouseMove.soundBool == true)
               {
                  soundGun5 = new SoundGun5();
                  soundGun5.play();
               }
            }
            isOK = true;
         }
      }
      
      public function keepShot() : void
      {
         timer.start();
      }
      
      public function getDelay() : Number
      {
         return 0;
      }
      
      public function getBulletTye() : String
      {
         return "";
      }
      
      public function getMC() : MovieClip
      {
         return null;
      }
   }
}


package
{
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.display.Stage;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.ui.Mouse;
   import observer.BuyGunObserver;
   import observer.CreateEnemy;
   import observer.IShootGameObserver;
   import observer.LevelObserver;
   import observer.SelectGun;
   import stone.ConSprite;
   import subject.MouseMove;
   import subject.ShootGameSubject;
   
   [SWF(width="960", height="560", backgroundColor="#869ca7", frameRate="24")]
   public class ShootGame extends Sprite
   {
      
      public static var closeBtn:CloseButton;
      
      public static var applyBtn:AppBtn;
      
      private static var owner:ShootGame;
      
      private static var CON:Object = {};
      
      public static var boolStop:Boolean = true;
      
      public var scoreObj:Object;
      
      private var soundCh:SoundChannel;
      
      private var buyGun:BuyGunObserver;
      
      private var helpScrene:HelpScrene;
      
      private var app:MovieClip;
      
      private var apply:ApplyBtn;
      
      private var app2:SoundBtn2;
      
      private var screneSound:Sound;
      
      private var soundNum:Number = 0;
      
      private var s:ShootGameSubject;
      
      private var startScrene:St;
      
      public function ShootGame()
      {
         super();
         owner = this;
         startScrene = new St();
         addChild(startScrene);
         startScrene.x = -25;
         startScrene.y = -10;
         screneSound = new SoundScrene2();
         soundCh = screneSound.play(0,500);
         applyBtn = new AppBtn();
         getStage().addChild(applyBtn);
         applyBtn.scaleX = applyBtn.scaleY = 1.5;
         applyBtn.x = 385;
         applyBtn.y = 230;
         applyBtn.visible = false;
         applyBtn.mouseEnabled = false;
         applyBtn.addEventListener(MouseEvent.CLICK,closeGame);
         startScrene.startButton.addEventListener(MouseEvent.CLICK,startGame);
         startScrene.HelpButton.addEventListener(MouseEvent.CLICK,help);
         MouseMove.soundBool = true;
         closeBtn = new CloseButton();
         getStage().addChild(closeBtn);
         closeBtn.x = 905;
         closeBtn.y = 5;
         closeBtn.scaleX = closeBtn.scaleY = 0.7;
         closeBtn.addEventListener(MouseEvent.CLICK,closeGame);
         app = new SoundBtn1();
         app.y = 10;
         app.x = 853;
         app.scaleX = app.scaleY = 0.4;
         app.buttonMode = true;
         getStage().addChildAt(app,getStage().numChildren - 1);
         app.addEventListener(MouseEvent.CLICK,stopSound);
         app.visible = true;
         app2 = new SoundBtn2();
         app2.y = 10;
         app2.x = 853;
         app2.buttonMode = true;
         app2.scaleX = app2.scaleY = 0.4;
         getStage().addChildAt(app2,getStage().numChildren);
         app2.addEventListener(MouseEvent.CLICK,stopSound);
         app2.visible = false;
         app2.mouseEnabled = false;
      }
      
      public static function gameOver(per:Number = 0, score:int = 0, paidou:int = 0) : void
      {
         owner.scoreObj = new Object();
         owner.scoreObj.per = per;
         owner.scoreObj.score = score;
         owner.scoreObj.paidou = paidou;
         owner.dispatchEvent(new Event("shootGameOver"));
      }
      
      public static function getStage() : Stage
      {
         return MainManager.getStage();
      }
      
      public static function getCon(KEY:String) : IShootGameObserver
      {
         return CON[KEY];
      }
      
      public static function getRoot() : Sprite
      {
         return owner;
      }
      
      private function help(e:MouseEvent) : void
      {
         helpScrene = new HelpScrene();
         addChild(helpScrene);
         helpScrene.y = -80;
         closeBtn.visible = false;
         closeBtn.mouseEnabled = false;
         apply = new ApplyBtn();
         addChild(apply);
         apply.addEventListener(MouseEvent.CLICK,remov);
         apply.x = 890;
      }
      
      private function remov(e:MouseEvent) : void
      {
         closeBtn.visible = true;
         closeBtn.mouseEnabled = true;
         removeChild(helpScrene);
         removeChild(apply);
      }
      
      private function closeGame(e:MouseEvent) : void
      {
         soundCh.stop();
         getStage().removeChild(closeBtn);
         getStage().removeChild(applyBtn);
         getStage().removeChild(app);
         getStage().removeChild(app2);
         boolStop = false;
         MouseMove.soundBool = false;
         if(BuyGunObserver.bListener == true)
         {
            buyGun.keyRemove();
            ConSprite.setup2();
         }
         if(LevelObserver.level == 1)
         {
            trace("恭喜您   " + "您获得的积分为" + (LevelObserver.level * 200 - 200));
            gameOver(0,0);
         }
         else if(LevelObserver.level == 11)
         {
            trace(LevelObserver.level * 200 + BuyGunObserver.money);
            gameOver((LevelObserver.level * 200 + BuyGunObserver.money) / 3000 * 100,LevelObserver.level * 200 + BuyGunObserver.money);
         }
         else
         {
            trace("恭喜  分数为" + (LevelObserver.level * 200 - 200 + BuyGunObserver.money).toString());
            gameOver((LevelObserver.level * 200 - 200 + BuyGunObserver.money) / 3000 * 100,LevelObserver.level * 200 - 200 + BuyGunObserver.money);
         }
         Mouse.show();
         if(ShootGameSubject.shootBool == true)
         {
            GunManager.mouseBool = true;
            SelectGun.alpha1 = 0;
            SelectGun.alpha2 = 0;
            SelectGun.alpha3 = 0;
            SelectGun.alpha4 = 0;
            SelectGun.alpha5 = 0;
            s.gameOver();
         }
         closeBtn.removeEventListener(MouseEvent.CLICK,closeGame);
         applyBtn.removeEventListener(MouseEvent.CLICK,closeGame);
         this.parent.removeChild(this);
      }
      
      private function stopSound(e:MouseEvent) : void
      {
         ++soundNum;
         if(soundNum % 2 != 0)
         {
            soundCh.stop();
            MouseMove.soundBool = false;
            app2.visible = true;
            app2.mouseEnabled = true;
            app.visible = false;
            app.mouseEnabled = false;
         }
         else
         {
            soundCh = screneSound.play(0,500);
            MouseMove.soundBool = true;
            app.visible = true;
            app.mouseEnabled = true;
            app2.visible = false;
            app2.mouseEnabled = false;
         }
      }
      
      private function startGame(e:MouseEvent) : void
      {
         removeChild(startScrene);
         LevelObserver.level = 1;
         boolStop = true;
         s = new ShootGameSubject();
         buyGun = new BuyGunObserver(s);
         var level:LevelObserver = new LevelObserver(s);
         var createEnemy:CreateEnemy = new CreateEnemy(s);
         createEnemy.setGunObserver(buyGun);
         CON["BuyGunObserver"] = buyGun;
         CON["LevelObserver"] = level;
         CON["CreateEnemy"] = createEnemy;
         ConSprite.setup();
         s.startGame();
      }
   }
}


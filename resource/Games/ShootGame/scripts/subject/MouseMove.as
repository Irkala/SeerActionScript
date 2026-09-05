package subject
{
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.ui.Mouse;
   import observer.BuyGunObserver;
   import observer.CreateEnemy;
   import observer.LevelObserver;
   import stone.ConSprite;
   
   public class MouseMove extends Sprite
   {
      
      public static var kuang2:kuangA1;
      
      public static var starMove:GunShoot2;
      
      public static var fourthGun:GunShoot4;
      
      public static var fifthGun:GunShoot5;
      
      public static var mouseMove:GunShoot1;
      
      public static var bulletBlood:BulletBloo;
      
      public static var thirdGun:GunShoot3;
      
      public static var bigThingsBlood:BigThingsBloo;
      
      public static var bullet1:Bullet5;
      
      public static var bullet2:Bullet4;
      
      public static var bullet3:Bullet3;
      
      public static var bullet5:Bullet1;
      
      public static var kuang:kuangA1;
      
      public static var bullet4:Bullet2;
      
      public static var bloodNumber:Number = 900;
      
      public static var soundBool:Boolean = true;
      
      private var levelNum:LevelNum2;
      
      private var levelOver:newLevel;
      
      private var bombNum:BombNum;
      
      public function MouseMove()
      {
         super();
         mouseMove = new GunShoot1();
         ShootGame.getRoot().addChild(mouseMove);
         mouseMove.visible = false;
         starMove = new GunShoot2();
         ShootGame.getRoot().addChild(starMove);
         starMove.visible = false;
         thirdGun = new GunShoot3();
         ShootGame.getRoot().addChild(thirdGun);
         thirdGun.visible = false;
         fourthGun = new GunShoot4();
         ShootGame.getRoot().addChild(fourthGun);
         fourthGun.visible = false;
         fifthGun = new GunShoot5();
         ShootGame.getRoot().addChild(fifthGun);
         fifthGun.visible = false;
         bulletBlood = new BulletBloo();
         ShootGame.getRoot().addChild(bulletBlood);
         bulletBlood.x = 65;
         bulletBlood.y = 30;
         bulletBlood.addEventListener(Event.ENTER_FRAME,length);
         kuang2 = new kuangA1();
         ShootGame.getRoot().addChild(kuang2);
         kuang2.width = 210;
         kuang2.x = 65;
         kuang2.y = 28;
         kuang2.scaleY = 0.8;
         bombNum = new BombNum();
         ShootGame.getRoot().addChild(bombNum);
         bombNum.x = 20;
         bombNum.y = 70;
         bombNum.addEventListener(Event.ENTER_FRAME,bombCount);
         levelNum = new LevelNum2();
         ShootGame.getRoot().addChild(levelNum);
         levelNum.x = 700;
         levelNum.y = 20;
         levelNum.addEventListener(Event.ENTER_FRAME,levelCount);
         kuang = new kuangA1();
         ShootGame.getRoot().addChild(kuang);
         kuang.width = 205;
         kuang.x = 380;
         kuang.y = 28;
         kuang.scaleY = 0.8;
         ShootGame.getRoot().swapChildren(kuang2,bulletBlood);
         bigThingsBlood = new BigThingsBloo();
         ShootGame.getRoot().addChild(bigThingsBlood);
         bigThingsBlood.x = 380;
         bigThingsBlood.y = 30;
         bigThingsBlood.addEventListener(Event.ENTER_FRAME,bigThingsLength);
         bullet1 = new Bullet5();
         ShootGame.getRoot().addChild(bullet1);
         bullet1.y = 20;
         bullet1.x = 20;
         bullet1.visible = false;
         bullet2 = new Bullet4();
         ShootGame.getRoot().addChild(bullet2);
         bullet2.y = 25;
         bullet2.x = 20;
         bullet2.visible = false;
         bullet3 = new Bullet3();
         ShootGame.getRoot().addChild(bullet3);
         bullet3.y = 20;
         bullet3.x = 20;
         bullet3.visible = false;
         bullet4 = new Bullet2();
         ShootGame.getRoot().addChild(bullet4);
         bullet4.y = 25;
         bullet4.x = 20;
         bullet4.visible = false;
         bullet5 = new Bullet1();
         ShootGame.getRoot().addChild(bullet5);
         bullet5.y = 20;
         bullet5.x = 20;
         bullet5.visible = false;
      }
      
      public static function disappear() : void
      {
         starMove.visible = false;
         thirdGun.visible = false;
         mouseMove.visible = false;
         fourthGun.visible = false;
         bullet1.visible = false;
         bullet2.visible = false;
         bullet3.visible = false;
         bullet4.visible = false;
         bullet5.visible = false;
         fifthGun.visible = false;
         bulletBlood.visible = false;
      }
      
      private function length(e:Event) : void
      {
         if(GunManager.gun)
         {
            if(GunManager.gun.bul)
            {
               if(BuyGunObserver.gunChange1 == "gun1")
               {
                  bulletBlood.width = GunManager.gun.bul.num / 100 * 200;
               }
               else if(BuyGunObserver.gunChange1 == "gun2")
               {
                  bulletBlood.width = GunManager.gun.bul.num / 500 * 200;
               }
               else if(BuyGunObserver.gunChange1 == "gun3")
               {
                  bulletBlood.width = GunManager.gun.bul.num / 200 * 200;
               }
               else if(BuyGunObserver.gunChange1 == "gun4")
               {
                  bulletBlood.width = GunManager.gun.bul.num / 400 * 200;
               }
               else if(BuyGunObserver.gunChange1 == "gun5")
               {
                  bulletBlood.width = GunManager.gun.bul.num / 300 * 200;
               }
            }
         }
         else
         {
            bulletBlood.width = 0 / 200 * 200;
         }
      }
      
      public function third() : void
      {
         starMove.visible = false;
         mouseMove.visible = false;
         fourthGun.visible = false;
         fifthGun.visible = false;
         bullet1.visible = false;
         bullet2.visible = false;
         bullet5.visible = false;
         bullet4.visible = false;
         bullet3.visible = true;
      }
      
      private function bigThingsLength(e:Event) : void
      {
         var i:uint = 0;
         bigThingsBlood.width = bloodNumber / 900 * 200;
         if(bloodNumber < 600 && bloodNumber > 200)
         {
            BuyGunObserver.bigThings.gotoAndStop(2);
         }
         else if(bloodNumber < 200 && bloodNumber > 0)
         {
            BuyGunObserver.bigThings.gotoAndStop(3);
         }
         else if(bloodNumber <= 0)
         {
            for(i = 0; i < ConSprite.con.numChildren; i++)
            {
               ConSprite.con.removeChildAt(i);
            }
            soundBool = false;
            levelOver = new newLevel();
            ShootGame.getRoot().addChild(levelOver);
            ShootGame.applyBtn.mouseEnabled = true;
            ShootGame.applyBtn.visible = true;
            CreateEnemy.stoneArray = [];
            GunManager.mouseBool = false;
            BuyGunObserver.isCanChangeGun = false;
            levelOver.x = -140;
            levelOver.y = -200;
            bigThingsBlood.removeEventListener(Event.ENTER_FRAME,bigThingsLength);
            BuyGunObserver.bombNumber = 0;
            levelOver.levelText.text = "游戏结束，您得到的积分为 " + (LevelObserver.level * 200 - 200 + BuyGunObserver.money);
            ShootGame.boolStop = false;
            BuyGunObserver.container.removeChildAt(0);
            Mouse.show();
            bigThingsBlood.removeEventListener(Event.ENTER_FRAME,bigThingsLength);
         }
      }
      
      private function bombCount(e:Event) : void
      {
         bombNum.bombTxt.text = BuyGunObserver.bombNumber.toString();
      }
      
      private function levelCount(e:Event) : void
      {
         levelNum.levelTxt.text = LevelObserver.level.toString();
      }
      
      public function stick() : void
      {
         starMove.visible = false;
         thirdGun.visible = false;
         fourthGun.visible = false;
         fifthGun.visible = false;
         bullet1.visible = true;
         bullet2.visible = false;
         bullet3.visible = false;
         bullet4.visible = false;
         bullet5.visible = false;
      }
      
      public function star() : void
      {
         bullet1.visible = false;
         bullet3.visible = false;
         bullet4.visible = false;
         bullet5.visible = false;
         thirdGun.visible = false;
         mouseMove.visible = false;
         fourthGun.visible = false;
         fifthGun.visible = false;
         bullet2.visible = true;
      }
      
      public function fourth() : void
      {
         starMove.visible = false;
         thirdGun.visible = false;
         mouseMove.visible = false;
         fifthGun.visible = false;
         bullet1.visible = false;
         bullet2.visible = false;
         bullet3.visible = false;
         bullet5.visible = false;
         bullet4.visible = true;
      }
      
      public function fifth() : void
      {
         starMove.visible = false;
         thirdGun.visible = false;
         mouseMove.visible = false;
         fourthGun.visible = false;
         bullet1.visible = false;
         bullet2.visible = false;
         bullet3.visible = false;
         bullet4.visible = false;
         bullet5.visible = true;
      }
   }
}


package observer
{
   import bullet.*;
   import flash.display.*;
   import flash.events.*;
   import flash.media.Sound;
   import flash.ui.*;
   import flash.utils.*;
   import gunCon.*;
   import stone.*;
   import subject.*;
   
   public class BuyGunObserver extends EventDispatcher implements IShootGameObserver
   {
      
      public static var container:Sprite;
      
      public static var bulletMax:Number;
      
      public static var kuangB:kuang;
      
      public static var stageScrene:Boolean;
      
      public static var bombChild:Number;
      
      public static var gunChange1:String;
      
      private static var scr:ScreneNew;
      
      public static var bListener:Boolean;
      
      public static var isCanChangeGun:Boolean;
      
      public static var container2:Sprite;
      
      public static var bigThings:BigThings;
      
      public static var gunLike:GunLik;
      
      public static const ON_BUY_GUN:String = "onBuyGun";
      
      public static var gunArr:Array = new Array();
      
      public static var bombNumber:Number = 0;
      
      public static var bulletCount1:Number = 20;
      
      public static var bulletCount2:Number = 100;
      
      public static var bulletCount3:Number = 25;
      
      public static var bulletCount4:Number = 75;
      
      public static var bulletCount5:Number = 50;
      
      public static var gunBool4:Boolean = true;
      
      public static var bombBool:Boolean = false;
      
      public static var gunBool1:Boolean = true;
      
      public static var gunBool3:Boolean = true;
      
      public static var gunBool5:Boolean = true;
      
      public static var gunBool2:Boolean = true;
      
      public static var money:Number = 100;
      
      private var bombCon:Sprite;
      
      private var delay:uint;
      
      private var delayBool:Boolean;
      
      private var bloodShow:BloodShow;
      
      private var soundBuyBomb:Sound;
      
      private var newGunArr:Array = new Array();
      
      private var itTxt:taskTip3;
      
      private var mouseM:MouseMove;
      
      private var soundBuyGun:Sound;
      
      private var firstScr:FirstScrene;
      
      private var soundBuyBullet:Sound;
      
      private var qtxt:Qtxt;
      
      private var index:Number = 0;
      
      private var keyBool:Boolean = true;
      
      private var s:ShootGameSubject;
      
      public function BuyGunObserver(s:ShootGameSubject)
      {
         super();
         s.register(this);
         container = new Sprite();
         container2 = new Sprite();
         bombCon = new Sprite();
         container2.addChild(bombCon);
         firstScr = new FirstScrene();
         container.addChildAt(firstScr,0);
         firstScr.x = firstScr.y = -5;
         mouseM = new MouseMove();
      }
      
      public static function addPanel2() : void
      {
         var i:uint = 0;
         while(i < container2.numChildren)
         {
            container2.removeChildAt(i);
            i++;
         }
      }
      
      public static function addPanel() : void
      {
         GunManager.off();
         stageScrene = false;
         isCanChangeGun = false;
         ShootGame.getRoot().addChildAt(container2,0);
         ShootGame.getRoot().addChild(container);
      }
      
      private function addBlo(e:Event) : void
      {
         itTxt.info_txt.text = "修复器：修复导航仪的耐久度： " + MouseMove.bloodNumber + " /900";
      }
      
      private function addBullet1(e:MouseEvent) : void
      {
         if(money > 2)
         {
            if(bulletCount1 <= 90)
            {
               bulletCount1 += 10;
               money -= 2;
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               trace(money);
               GunManager.buyBullet(BulletType1.TYPE,new BulletType1(bulletCount1));
            }
            else if(bulletCount1 > 90 && bulletCount1 < 100)
            {
               bulletCount1 = 100;
               money -= 2;
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               trace("bulletCount1");
               GunManager.buyBullet(BulletType1.TYPE,new BulletType1(bulletCount1));
            }
         }
      }
      
      private function addBullet2(e:MouseEvent) : void
      {
         if(money > 4)
         {
            if(bulletCount2 <= 450)
            {
               bulletCount2 += 50;
               money -= 4;
               trace(bulletCount2);
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType2.TYPE,new BulletType2(bulletCount2));
            }
            else if(bulletCount2 > 450 && bulletCount2 < 500)
            {
               bulletCount2 = 500;
               money -= 4;
               trace(bulletCount2);
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType2.TYPE,new BulletType2(bulletCount2));
            }
         }
      }
      
      private function addBullet4(e:MouseEvent) : void
      {
         if(money > 5)
         {
            if(bulletCount4 <= 350)
            {
               bulletCount4 += 50;
               money -= 5;
               trace("bulletCount4");
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType4.TYPE,new BulletType4(bulletCount4));
            }
            else if(bulletCount4 > 350 && bulletCount4 < 400)
            {
               bulletCount4 = 400;
               money -= 5;
               trace("bulletCount4");
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType4.TYPE,new BulletType4(bulletCount4));
            }
         }
      }
      
      private function buyGun2TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Things2.removeEventListener(Event.ENTER_FRAME,addGun2Txt);
      }
      
      private function buyBombText(e:MouseEvent) : void
      {
         itText();
         firstScr.Bomb.addEventListener(Event.ENTER_FRAME,addBomb);
      }
      
      private function bullet1TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bullet1.removeEventListener(Event.ENTER_FRAME,bullet1Count);
      }
      
      private function buyGun2(e:MouseEvent) : void
      {
         if(gunBool2 == true)
         {
            if(money >= 10)
            {
               GunManager.setGun(new Gun2());
               firstScr.Things2.alpha = 0.4;
               firstScr.Things2.mouseEnabled = false;
               money -= 10;
               gunChange1 = "gun2";
               trace(gunChange1);
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyGun = new SoundBuyGun();
                  soundBuyGun.play();
               }
               gunArr[1] = gunChange1;
               SelectGun.alpha2 = 1;
               newGunArr.push(gunArr[1]);
               GunManager.buyBullet(BulletType2.TYPE,new BulletType2(bulletCount2));
               firstScr.Bullet2.mouseEnabled = true;
            }
         }
         gunBool2 = false;
      }
      
      private function buyGun3(e:MouseEvent) : void
      {
         if(gunBool3 == true)
         {
            if(money >= 20)
            {
               GunManager.setGun(new Gun3());
               firstScr.Things3.alpha = 0.4;
               firstScr.Things3.mouseEnabled = false;
               money -= 20;
               gunChange1 = "gun3";
               trace(gunChange1);
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyGun = new SoundBuyGun();
                  soundBuyGun.play();
               }
               gunArr[2] = gunChange1;
               SelectGun.alpha3 = 1;
               newGunArr.push(gunArr[2]);
               GunManager.buyBullet(BulletType3.TYPE,new BulletType3(bulletCount3));
               firstScr.Bullet3.mouseEnabled = true;
            }
         }
         gunBool3 = false;
      }
      
      private function buyGun5(e:MouseEvent) : void
      {
         if(gunBool5 == true)
         {
            if(money >= 60)
            {
               GunManager.setGun(new Gun5());
               firstScr.Things5.alpha = 0.4;
               firstScr.Things5.mouseEnabled = false;
               money -= 60;
               gunChange1 = "gun5";
               trace(gunChange1);
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyGun = new SoundBuyGun();
                  soundBuyGun.play();
               }
               gunArr[4] = gunChange1;
               SelectGun.alpha5 = 1;
               newGunArr.push(gunArr[4]);
               GunManager.buyBullet(BulletType5.TYPE,new BulletType5(bulletCount5));
               firstScr.Bullet5.mouseEnabled = true;
            }
         }
         gunBool5 = false;
      }
      
      private function addGun3Txt(e:Event) : void
      {
         itTxt.info_txt.text = "散弹枪：射速极慢，射击范围极大";
      }
      
      private function buyGun1(e:MouseEvent) : void
      {
         if(gunBool1 == true)
         {
            if(money >= 5)
            {
               GunManager.setGun(new Gun1());
               firstScr.Things1.alpha = 0.4;
               firstScr.Things1.mouseEnabled = false;
               money -= 5;
               gunChange1 = "gun1";
               trace(gunChange1);
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyGun = new SoundBuyGun();
                  soundBuyGun.play();
               }
               GunManager.buyBullet(BulletType1.TYPE,new BulletType1(bulletCount1));
               gunArr[0] = gunChange1;
               SelectGun.alpha1 = 1;
               newGunArr.push(gunArr[0]);
               firstScr.Bullet1.mouseEnabled = true;
            }
         }
         gunBool1 = false;
      }
      
      public function gameStart() : void
      {
         addPanel();
         Mouse.show();
         firstScr.Bullet1.addEventListener(MouseEvent.CLICK,addBullet1);
         firstScr.Bullet1.addEventListener(MouseEvent.MOUSE_OVER,bullet1Text);
         firstScr.Bullet1.addEventListener(MouseEvent.MOUSE_OUT,bullet1TextR);
         firstScr.Bullet1.mouseEnabled = false;
         firstScr.Bullet2.addEventListener(MouseEvent.CLICK,addBullet2);
         firstScr.Bullet2.addEventListener(MouseEvent.MOUSE_OVER,bullet2Text);
         firstScr.Bullet2.addEventListener(MouseEvent.MOUSE_OUT,bullet2TextR);
         firstScr.Bullet2.mouseEnabled = false;
         firstScr.Bullet3.addEventListener(MouseEvent.CLICK,addBullet3);
         firstScr.Bullet3.addEventListener(MouseEvent.MOUSE_OVER,bullet3Text);
         firstScr.Bullet3.addEventListener(MouseEvent.MOUSE_OUT,bullet3TextR);
         firstScr.Bullet3.mouseEnabled = false;
         firstScr.Bullet4.addEventListener(MouseEvent.CLICK,addBullet4);
         firstScr.Bullet4.addEventListener(MouseEvent.MOUSE_OVER,bullet4Text);
         firstScr.Bullet4.addEventListener(MouseEvent.MOUSE_OUT,bullet4TextR);
         firstScr.Bullet4.mouseEnabled = false;
         firstScr.Bullet5.addEventListener(MouseEvent.CLICK,addBullet5);
         firstScr.Bullet5.addEventListener(MouseEvent.MOUSE_OVER,bullet5Text);
         firstScr.Bullet5.addEventListener(MouseEvent.MOUSE_OUT,bullet5TextR);
         firstScr.Bullet5.mouseEnabled = false;
         firstScr.Things1.addEventListener(MouseEvent.CLICK,buyGun1);
         firstScr.Things1.addEventListener(MouseEvent.MOUSE_OVER,buyGun1Text);
         firstScr.Things1.addEventListener(MouseEvent.MOUSE_OUT,buyGun1TextR);
         firstScr.Things2.addEventListener(MouseEvent.CLICK,buyGun2);
         firstScr.Things2.addEventListener(MouseEvent.MOUSE_OVER,buyGun2Text);
         firstScr.Things2.addEventListener(MouseEvent.MOUSE_OUT,buyGun2TextR);
         firstScr.Things3.addEventListener(MouseEvent.CLICK,buyGun3);
         firstScr.Things3.addEventListener(MouseEvent.MOUSE_OVER,buyGun3Text);
         firstScr.Things3.addEventListener(MouseEvent.MOUSE_OUT,buyGun3TextR);
         firstScr.Things4.addEventListener(MouseEvent.CLICK,buyGun4);
         firstScr.Things4.addEventListener(MouseEvent.MOUSE_OVER,buyGun4Text);
         firstScr.Things4.addEventListener(MouseEvent.MOUSE_OUT,buyGun4TextR);
         firstScr.Things5.addEventListener(MouseEvent.CLICK,buyGun5);
         firstScr.Things5.addEventListener(MouseEvent.MOUSE_OVER,buyGun5Text);
         firstScr.Things5.addEventListener(MouseEvent.MOUSE_OUT,buyGun5TextR);
         firstScr.addBlood.addEventListener(MouseEvent.CLICK,addBloo);
         firstScr.addBlood.addEventListener(MouseEvent.MOUSE_OVER,addBloodText);
         firstScr.addBlood.addEventListener(MouseEvent.MOUSE_OUT,addBloodTextR);
         firstScr.Bomb.addEventListener(MouseEvent.CLICK,buyBomb);
         firstScr.Bomb.addEventListener(MouseEvent.MOUSE_OVER,buyBombText);
         firstScr.Bomb.addEventListener(MouseEvent.MOUSE_OUT,buyBombTextR);
         MouseMove.thirdGun.visible = false;
         MouseMove.mouseMove.visible = false;
         MouseMove.fourthGun.visible = false;
         MouseMove.fifthGun.visible = false;
         MouseMove.starMove.visible = false;
         firstScr.NextLevel.buttonMode = true;
         firstScr.addEventListener(Event.ENTER_FRAME,firstLevel);
         firstScr.NextLevel.mouseChildren = false;
      }
      
      private function buyGun4(e:MouseEvent) : void
      {
         if(gunBool4 == true)
         {
            if(money >= 30)
            {
               GunManager.setGun(new Gun4());
               firstScr.Things4.alpha = 0.4;
               firstScr.Things4.mouseEnabled = false;
               money -= 30;
               gunChange1 = "gun4";
               trace(gunChange1);
               trace(money);
               if(MouseMove.soundBool == true)
               {
                  soundBuyGun = new SoundBuyGun();
                  soundBuyGun.play();
               }
               gunArr[3] = gunChange1;
               SelectGun.alpha4 = 1;
               newGunArr.push(gunArr[3]);
               GunManager.buyBullet(BulletType4.TYPE,new BulletType4(bulletCount4));
               firstScr.Bullet4.mouseEnabled = true;
            }
         }
         gunBool4 = false;
      }
      
      private function bullet3Count(e:Event) : void
      {
         itTxt.info_txt.text = "散弹枪的子弹以及数量" + bulletCount3 + "/200";
      }
      
      private function addBloodText(e:MouseEvent) : void
      {
         itText();
         itTxt.addEventListener(Event.ENTER_FRAME,addBlo);
      }
      
      private function addBullet5(e:MouseEvent) : void
      {
         if(money > 7)
         {
            if(bulletCount5 <= 275)
            {
               bulletCount5 += 25;
               money -= 7;
               trace("bulletCount5");
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType5.TYPE,new BulletType5(bulletCount5));
            }
            else if(bulletCount5 > 275 && bulletCount5 < 300)
            {
               bulletCount5 = 300;
               money -= 7;
               trace("bulletCount5");
               if(MouseMove.soundBool == true)
               {
                  soundBuyBullet = new SoundBuyBullet();
                  soundBuyBullet.play();
               }
               GunManager.buyBullet(BulletType5.TYPE,new BulletType5(bulletCount5));
            }
         }
      }
      
      private function buyGun3TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Things3.removeEventListener(Event.ENTER_FRAME,addGun3Txt);
      }
      
      private function buyGun1Txt(e:Event) : void
      {
         itTxt.info_txt.text = "双管枪：射速较慢，射击范围较小";
      }
      
      private function judge(e:KeyboardEvent) : void
      {
         delayBool = false;
         ++index;
         if(keyBool == false)
         {
            if(bombNumber > 0)
            {
               --bombNumber;
            }
         }
         keyBool = true;
         if(index >= newGunArr.length)
         {
            index = 0;
         }
         delay = setTimeout(clear,3000);
      }
      
      private function firstLevel(e:Event) : void
      {
         if(money < 0)
         {
            money = 0;
         }
         firstScr.ttttt.text = money.toString();
         if(gunBool1 == false || gunBool2 == false || gunBool3 == false || gunBool4 == false || gunBool5 == false)
         {
            firstScr.NextLevel.mouseEnabled = true;
            firstScr.NextLevel.alpha = 1;
            firstScr.NextLevel.addEventListener(MouseEvent.CLICK,start);
            firstScr.NextLevel.removeEventListener(Event.ENTER_FRAME,firstLevel);
         }
         else
         {
            firstScr.NextLevel.mouseEnabled = false;
            firstScr.NextLevel.alpha = 0.8;
         }
      }
      
      private function bullet2TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bullet2.removeEventListener(Event.ENTER_FRAME,bullet2Count);
      }
      
      private function bulletShow() : void
      {
         if(gunChange1 == "gun1")
         {
            mouseM.stick();
         }
         else if(gunChange1 == "gun2")
         {
            mouseM.star();
         }
         else if(gunChange1 == "gun3")
         {
            mouseM.third();
         }
         else if(gunChange1 == "gun4")
         {
            mouseM.fourth();
         }
         else if(gunChange1 == "gun5")
         {
            mouseM.fifth();
         }
      }
      
      private function bullet1Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Bullet1.addEventListener(Event.ENTER_FRAME,bullet1Count);
      }
      
      private function bullet2Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Bullet2.addEventListener(Event.ENTER_FRAME,bullet2Count);
      }
      
      private function bullet5TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bullet1.removeEventListener(Event.ENTER_FRAME,bullet5Count);
      }
      
      private function bullet5Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Bullet5.addEventListener(Event.ENTER_FRAME,bullet5Count);
      }
      
      public function keyRemove() : void
      {
         ShootGame.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,changeShoot);
         ShootGame.getStage().removeEventListener(KeyboardEvent.KEY_UP,judge);
      }
      
      private function bullet4Count(e:Event) : void
      {
         itTxt.info_txt.text = "组合枪的子弹以及数量" + bulletCount4 + "/400";
      }
      
      private function bullet4Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Bullet4.addEventListener(Event.ENTER_FRAME,bullet4Count);
      }
      
      private function mouseKeep(e:Event) : void
      {
         itTxt.x = ShootGame.getStage().mouseX - 0.5 * itTxt.width;
         itTxt.y = ShootGame.getStage().mouseY - itTxt.height;
      }
      
      private function buyGun4TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Things4.removeEventListener(Event.ENTER_FRAME,addGun4Txt);
      }
      
      private function addGun2Txt(e:Event) : void
      {
         itTxt.info_txt.text = "激光枪：射速中等，射击范围中等";
      }
      
      private function bullet3Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Bullet3.addEventListener(Event.ENTER_FRAME,bullet3Count);
      }
      
      private function buyBomb(e:MouseEvent) : void
      {
         if(money > 2)
         {
            if(bombNumber < 5)
            {
               money -= 2;
               ++bombNumber;
               if(MouseMove.soundBool == true)
               {
                  soundBuyBomb = new SoundBuyBomb();
                  soundBuyBomb.play();
               }
            }
         }
      }
      
      private function clear() : void
      {
         gunLike.visible = false;
      }
      
      private function addBullet3(e:MouseEvent) : void
      {
         if(money > 3)
         {
            if(bulletCount3 <= 175)
            {
               bulletCount3 += 25;
               money -= 3;
               trace(bulletCount3);
               soundBuyBullet = new SoundBuyBullet();
               soundBuyBullet.play();
               GunManager.buyBullet(BulletType3.TYPE,new BulletType3(bulletCount3));
            }
            else if(bulletCount3 > 175 && bulletCount3 < 200)
            {
               bulletCount3 = 200;
               money -= 3;
               trace(bulletCount3);
               soundBuyBullet = new SoundBuyBullet();
               soundBuyBullet.play();
               GunManager.buyBullet(BulletType3.TYPE,new BulletType3(bulletCount3));
            }
         }
      }
      
      private function addGun5Txt(e:Event) : void
      {
         itTxt.info_txt.text = "高能枪：射速较极快，射击范围中等";
      }
      
      private function bullet3TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bullet3.removeEventListener(Event.ENTER_FRAME,bullet3Count);
      }
      
      private function bullet5Count(e:Event) : void
      {
         itTxt.info_txt.text = "高能枪的子弹以及数量" + bulletCount5 + "/300";
      }
      
      private function buyBombTextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bomb.removeEventListener(Event.ENTER_FRAME,addBomb);
      }
      
      private function changeShoot(event:KeyboardEvent) : void
      {
         var bomb:NewBomb = null;
         if(!isCanChangeGun)
         {
            return;
         }
         switch(event.keyCode)
         {
            case 81:
               delayBool = false;
               SelectGun.select();
               gunLike.visible = true;
               gunChange1 = newGunArr[index];
               if(delayBool == false)
               {
                  clearTimeout(delay);
               }
               if(gunArr[0] == newGunArr[index])
               {
                  GunManager.setGun(new Gun1());
                  GunManager.show();
                  gunChange1 = "gun1";
                  mouseM.stick();
               }
               else if(gunArr[1] == newGunArr[index])
               {
                  GunManager.setGun(new Gun2());
                  gunChange1 = "gun2";
                  GunManager.show();
                  mouseM.star();
               }
               else if(gunArr[2] == newGunArr[index])
               {
                  GunManager.setGun(new Gun3());
                  gunChange1 = "gun3";
                  GunManager.show();
                  mouseM.third();
               }
               else if(gunArr[3] == newGunArr[index])
               {
                  GunManager.setGun(new Gun4());
                  GunManager.show();
                  mouseM.fourth();
                  gunChange1 = "gun4";
               }
               else if(gunArr[4] == newGunArr[index])
               {
                  GunManager.setGun(new Gun5());
                  GunManager.show();
                  gunChange1 = "gun5";
                  mouseM.fifth();
               }
               break;
            case 32:
               if(keyBool == true)
               {
                  if(ShootGame.getStage().mouseX < 360 || ShootGame.getStage().mouseX > 500)
                  {
                     if(bombNumber > 0)
                     {
                        if(ShootGame.getStage().mouseY < 400)
                        {
                           bomb = new NewBomb();
                           ConSprite.con2.addChildAt(bomb,0);
                           bomb.scaleX = bomb.scaleY = 0.7;
                           bomb.gotoAndStop(1);
                           bombBool = true;
                           bomb.x = ShootGame.getStage().mouseX;
                           bomb.y = ShootGame.getStage().mouseY;
                           keyBool = false;
                           ConSprite.con2.addEventListener(Event.ENTER_FRAME,downBomb);
                        }
                     }
                  }
               }
         }
      }
      
      private function bullet1Count(e:Event) : void
      {
         itTxt.info_txt.text = "双管枪的子弹及数量" + bulletCount1 + "/100";
      }
      
      private function start(e:MouseEvent) : void
      {
         ShootGame.getStage().focus = ShootGame.getStage();
         GunManager.show();
         Mouse.hide();
         stageScrene = true;
         ShootGame.getRoot().removeChild(container);
         scr = new ScreneNew();
         container2.addChild(scr);
         scr.x = -10;
         scr.y = -10;
         bigThings = new BigThings();
         container2.addChild(bigThings);
         bigThings.visible = true;
         bigThings.x = 480;
         bigThings.y = 250;
         qtxt = new Qtxt();
         container2.addChild(qtxt);
         qtxt.scaleX = qtxt.scaleY = 0.9;
         qtxt.y = 73;
         qtxt.x = 412;
         MouseMove.bulletBlood.visible = true;
         bloodShow = new BloodShow();
         container2.addChild(bloodShow);
         bloodShow.x = 330;
         bloodShow.y = 20;
         bulletShow();
         dispatchEvent(new Event(ON_BUY_GUN));
         GunManager.on();
         bListener = true;
         ShootGame.getStage().addEventListener(KeyboardEvent.KEY_DOWN,changeShoot);
         ShootGame.getStage().addEventListener(KeyboardEvent.KEY_UP,judge);
         gunLike = new GunLik();
         container2.addChild(gunLike);
         gunLike.y = 200;
         gunLike.visible = false;
      }
      
      private function addBomb(e:Event) : void
      {
         itTxt.info_txt.text = "炸弹：空格键来使用投掷     数量：" + bombNumber;
      }
      
      private function downBomb(e:Event) : void
      {
         var mc:MovieClip = null;
         var num:uint = uint(ConSprite.con2.numChildren);
         for(var i:uint = 0; i < num; i++)
         {
            mc = ConSprite.con2.getChildAt(i) as MovieClip;
            if(mc.y < 400)
            {
               mc.y += 10;
            }
         }
         if(ConSprite.con2.numChildren == 0)
         {
            ConSprite.con2.removeEventListener(Event.ENTER_FRAME,downBomb);
         }
      }
      
      private function buyGun2Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Things2.addEventListener(Event.ENTER_FRAME,addGun2Txt);
      }
      
      private function buyGun4Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Things4.addEventListener(Event.ENTER_FRAME,addGun4Txt);
      }
      
      private function buyGun5Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Things5.addEventListener(Event.ENTER_FRAME,addGun5Txt);
      }
      
      private function addBloo(e:MouseEvent) : void
      {
         if(money > 2)
         {
            if(MouseMove.bloodNumber <= 880)
            {
               MouseMove.bloodNumber += 10;
               money -= 2;
            }
            else if(MouseMove.bloodNumber > 880 && MouseMove.bloodNumber < 900)
            {
               MouseMove.bloodNumber = 900;
               money -= 2;
            }
         }
      }
      
      private function addBloodTextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         itTxt.removeEventListener(Event.ENTER_FRAME,addBlo);
      }
      
      private function buyGun3Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Things3.addEventListener(Event.ENTER_FRAME,addGun3Txt);
      }
      
      private function buyGun1TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Things1.removeEventListener(Event.ENTER_FRAME,buyGun1Txt);
      }
      
      private function buyGun5TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Things5.removeEventListener(Event.ENTER_FRAME,addGun5Txt);
      }
      
      public function gameOver() : void
      {
         bombNumber = 0;
         money = 100;
         bulletCount1 = 20;
         bulletCount2 = 100;
         bulletCount3 = 25;
         bulletCount4 = 75;
         bulletCount5 = 50;
         gunBool1 = true;
         gunBool2 = true;
         gunBool3 = true;
         gunBool4 = true;
         gunBool5 = true;
         MouseMove.bloodNumber = 900;
         LevelObserver.level = 1;
      }
      
      private function itText() : void
      {
         itTxt = new taskTip3();
         container.addChild(itTxt);
         itTxt.x = ShootGame.getStage().mouseX - 0.5 * itTxt.width;
         itTxt.y = ShootGame.getStage().mouseY - itTxt.height;
      }
      
      private function bullet4TextR(e:MouseEvent) : void
      {
         itTxt.visible = false;
         firstScr.Bullet4.removeEventListener(Event.ENTER_FRAME,bullet4Count);
      }
      
      private function addGun4Txt(e:Event) : void
      {
         itTxt.info_txt.text = "组合枪：射速较快，射击范围较小";
      }
      
      private function buyGun1Text(e:MouseEvent) : void
      {
         itText();
         firstScr.Things1.addEventListener(Event.ENTER_FRAME,buyGun1Txt);
      }
      
      private function bullet2Count(e:Event) : void
      {
         itTxt.info_txt.text = "激光枪的子弹以及数量" + bulletCount2 + "/500";
      }
   }
}


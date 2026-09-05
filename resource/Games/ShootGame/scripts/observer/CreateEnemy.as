package observer
{
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import stone.BaseStone;
   import subject.MouseMove;
   import subject.ShootGameSubject;
   
   public class CreateEnemy implements IShootGameObserver
   {
      
      public static var REPEAT_COUN:int;
      
      public static var DELAY_TIME:Number;
      
      public static var stoneArray:Array = [];
      
      private var timer:Timer;
      
      private var levelNew:newLevel;
      
      private var stoneMCArray:Array = [];
      
      private var startBool:Boolean;
      
      private var n:Number;
      
      private var m:Number;
      
      private var dela:uint;
      
      private var s:ShootGameSubject;
      
      private var gunObsever:BuyGunObserver;
      
      public function CreateEnemy(s:ShootGameSubject)
      {
         super();
         s.register(this);
      }
      
      private function compHandler(event:TimerEvent) : void
      {
         EventManager.dispatchEvent(new Event(EventManager.CREATE_COMPLETE));
      }
      
      public function setGunObserver(i:BuyGunObserver) : void
      {
         gunObsever = i;
         gunObsever.addEventListener(BuyGunObserver.ON_BUY_GUN,onBuyGun);
      }
      
      public function gameStart() : void
      {
      }
      
      private function onBuyGun(event:Event) : void
      {
         levelNew = new newLevel();
         ShootGame.getRoot().addChild(levelNew);
         levelNew.x = -140;
         levelNew.y = -200;
         BuyGunObserver.isCanChangeGun = false;
         if(LevelObserver.level == 1)
         {
            levelNew.levelText.text = "飞船进入陨石地带了，保护好导航仪。";
         }
         if(LevelObserver.level == 2)
         {
            levelNew.levelText.text = "新一批的陨石又飞过来了，这种陨石的速度非常快，要保护好导航仪。";
         }
         if(LevelObserver.level == 3)
         {
            levelNew.levelText.text = "出现越来越多种类的陨石了，千万不要乱了阵脚。";
         }
         if(LevelObserver.level == 4)
         {
            levelNew.levelText.text = "出现了对导航仪冲击力相当大的陨石，千万不要让陨石砸到导航仪。";
         }
         if(LevelObserver.level == 5)
         {
            levelNew.levelText.text = "这次飞来的陨石速度非常快，眼明手快的将其击碎。";
         }
         if(LevelObserver.level == 6)
         {
            levelNew.levelText.text = "有更多的陨石过来了，记得补充好武器的弹药。";
         }
         if(LevelObserver.level == 7)
         {
            levelNew.levelText.text = "陨石形成了流星雨砸过来了，记得把导航仪修补一下。";
         }
         if(LevelObserver.level == 8)
         {
            levelNew.levelText.text = "多种多样的陨石组合而来了，做好全方面的准备。";
         }
         if(LevelObserver.level == 9)
         {
            levelNew.levelText.text = "无数的超速陨石飞来了，冷静的将其击碎。";
         }
         if(LevelObserver.level == 10)
         {
            levelNew.levelText.text = "飞船进入最后的大片的陨石区了，做好完全的准备后迎接最后一战！";
         }
         startBool = true;
         dela = setTimeout(gameS,3000);
         levelNew.addEventListener(MouseEvent.CLICK,interrupt);
      }
      
      private function stopGame(e:Event) : void
      {
         if(MouseMove.bloodNumber <= 0)
         {
            timer.stop();
            ShootGame.getRoot().removeEventListener(Event.ENTER_FRAME,stopGame);
         }
         if(ShootGame.boolStop == false)
         {
            timer.stop();
            ShootGame.getRoot().removeEventListener(Event.ENTER_FRAME,stopGame);
            ShootGame.boolStop = true;
         }
      }
      
      private function timerHandler(event:TimerEvent) : void
      {
         if(stoneArray.length == 0)
         {
            return;
         }
         var len:uint = stoneArray.length;
         var cls:* = stoneArray[Math.floor(Math.random() * len)];
         var stone:BaseStone = new cls();
         stoneMCArray.push(stone);
      }
      
      private function gameS() : void
      {
         if(startBool == true)
         {
            ShootGame.getRoot().removeChild(levelNew);
            LevelObserver.addBool = true;
            timer.start();
         }
         BuyGunObserver.isCanChangeGun = true;
         ShootGame.getRoot().addEventListener(Event.ENTER_FRAME,stopGame);
      }
      
      private function interrupt(e:MouseEvent) : void
      {
         gameS();
         startBool = false;
      }
      
      public function gameOver() : void
      {
         var i:BaseStone = null;
         for each(i in stoneMCArray)
         {
            i.clear();
         }
         stoneMCArray = [];
      }
      
      public function create() : void
      {
         timer = new Timer(DELAY_TIME,REPEAT_COUN);
         timer.addEventListener(TimerEvent.TIMER,timerHandler);
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,compHandler);
      }
   }
}


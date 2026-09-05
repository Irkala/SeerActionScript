package observer
{
   import flash.events.Event;
   import flash.ui.Mouse;
   import stone.AStone;
   import stone.BStone;
   import stone.CStone;
   import stone.ConSprite;
   import stone.DStone;
   import stone.EStone;
   import stone.FStone;
   import stone.GStone;
   import stone.HStone;
   import stone.IStone;
   import stone.JStone;
   import subject.MouseMove;
   import subject.ShootGameSubject;
   
   public class LevelObserver implements IShootGameObserver
   {
      
      public static var level:Number = 1;
      
      public static var addBool:Boolean = true;
      
      private var s:ShootGameSubject;
      
      private var levelNew:newLevel;
      
      private var gameCount:Number = 0;
      
      public function LevelObserver(s:ShootGameSubject)
      {
         super();
         s.register(this);
      }
      
      private function onCreateCompHandler(event:Event) : void
      {
         ConSprite.con.addEventListener(Event.ENTER_FRAME,still);
      }
      
      public function gameOver() : void
      {
         EventManager.removeEventListener(EventManager.CREATE_COMPLETE,onCreateCompHandler);
         LevelObserver.level = 1;
      }
      
      private function removeLevelNew() : void
      {
         ShootGame.getRoot().removeChild(levelNew);
      }
      
      private function still(e:Event) : void
      {
         var j:uint = 0;
         if(ConSprite.con.numChildren == 0)
         {
            if(ShootGame.boolStop == true)
            {
               ++level;
               addBool = false;
               if(level < 11)
               {
                  gameCount += 100;
                  trace(gameCount);
                  BuyGunObserver.addPanel();
                  CreateEnemy.stoneArray = [];
                  ConSprite.con.removeEventListener(Event.ENTER_FRAME,still);
                  nextLevel();
                  if(level != 1)
                  {
                     BuyGunObserver.addPanel2();
                  }
                  MouseMove.disappear();
                  Mouse.show();
               }
               else
               {
                  ConSprite.con.removeEventListener(Event.ENTER_FRAME,still);
                  ShootGame.applyBtn.visible = true;
                  ShootGame.applyBtn.mouseEnabled = true;
                  Mouse.show();
                  levelNew = new newLevel();
                  ShootGame.getRoot().addChild(levelNew);
                  levelNew.x = -140;
                  levelNew.y = -200;
                  levelNew.levelText.text = "我们已经安全的度过陨石地带。" + "您得到积分为 " + (LevelObserver.level * 200 + BuyGunObserver.money);
                  ShootGame.boolStop = false;
                  BuyGunObserver.bombNumber = 0;
                  for(j = 0; j < ConSprite.con2.numChildren; j++)
                  {
                     ConSprite.con2.removeChildAt(j);
                     ConSprite.con2.removeChildAt(0);
                  }
               }
            }
         }
      }
      
      public function gameStart() : void
      {
         EventManager.addEventListener(EventManager.CREATE_COMPLETE,onCreateCompHandler);
         trace("关卡");
         nextLevel();
      }
      
      public function nextLevel() : void
      {
         if(level == 1)
         {
            MouseMove.bloodNumber = 900;
            CreateEnemy.DELAY_TIME = 500;
            CreateEnemy.REPEAT_COUN = 18;
            CreateEnemy.stoneArray = [AStone,BStone];
            trace(level);
         }
         else if(level == 2)
         {
            trace("555555555555");
            CreateEnemy.DELAY_TIME = 450;
            CreateEnemy.REPEAT_COUN = 26;
            CreateEnemy.stoneArray = [CStone,DStone];
            trace(level);
         }
         else if(level == 3)
         {
            CreateEnemy.DELAY_TIME = 400;
            CreateEnemy.REPEAT_COUN = 32;
            CreateEnemy.stoneArray = [CStone,DStone,FStone,GStone];
            trace(level);
         }
         else if(level == 4)
         {
            CreateEnemy.DELAY_TIME = 350;
            CreateEnemy.REPEAT_COUN = 40;
            CreateEnemy.stoneArray = [DStone,EStone,FStone];
            trace(level);
         }
         else if(level == 5)
         {
            CreateEnemy.DELAY_TIME = 300;
            CreateEnemy.REPEAT_COUN = 46;
            CreateEnemy.stoneArray = [BStone,DStone,EStone,FStone,GStone];
            trace(level);
         }
         else if(level == 6)
         {
            CreateEnemy.DELAY_TIME = 250;
            CreateEnemy.REPEAT_COUN = 40;
            CreateEnemy.stoneArray = [CStone,FStone,HStone,GStone];
            trace(level);
         }
         else if(level == 7)
         {
            CreateEnemy.DELAY_TIME = 200;
            CreateEnemy.REPEAT_COUN = 72;
            CreateEnemy.stoneArray = [EStone,HStone];
            trace(level);
         }
         else if(level == 8)
         {
            CreateEnemy.DELAY_TIME = 200;
            CreateEnemy.REPEAT_COUN = 60;
            CreateEnemy.stoneArray = [AStone,BStone,CStone,DStone,EStone,IStone,GStone];
            trace(level);
         }
         else if(level == 9)
         {
            CreateEnemy.DELAY_TIME = 200;
            CreateEnemy.REPEAT_COUN = 66;
            CreateEnemy.stoneArray = [BStone,CStone,DStone,EStone,FStone,GStone,HStone,JStone];
            trace(level);
         }
         else if(level == 10)
         {
            CreateEnemy.DELAY_TIME = 180;
            CreateEnemy.REPEAT_COUN = 150;
            CreateEnemy.stoneArray = [AStone,BStone,CStone,DStone,EStone,FStone,GStone,HStone,IStone,JStone];
            trace(level);
         }
         var c:CreateEnemy = ShootGame.getCon("CreateEnemy") as CreateEnemy;
         c.create();
      }
   }
}


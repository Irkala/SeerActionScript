package com.robot.module.game.shieldGame.com.taomee.container
{
   import com.robot.module.game.shieldGame.com.taomee.element.BombMC;
   import com.robot.module.game.shieldGame.com.taomee.element.CircleMC;
   import com.robot.module.game.shieldGame.com.taomee.element.ExplodeMC;
   import com.robot.module.game.shieldGame.com.taomee.element.GamePreView;
   import com.robot.module.game.shieldGame.com.taomee.element.HouseMC;
   import com.robot.module.game.shieldGame.com.taomee.element.MovieClipObject;
   import com.robot.module.game.shieldGame.com.taomee.element.PauseUI;
   import com.robot.module.game.shieldGame.com.taomee.element.TimerMC;
   import com.robot.module.game.shieldGame.com.taomee.element.ToolbarMC;
   import com.robot.module.game.shieldGame.com.taomee.event.GameStateEvent;
   import com.robot.module.game.shieldGame.com.taomee.utils.MCLoader;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   import flash.ui.Mouse;
   import flash.utils.Timer;
   
   public class GameContainer extends Sprite
   {
      
      public var pauseLayer:Sprite;
      
      public var bombNum:uint = 1;
      
      public var power:uint = 1000;
      
      public var exploderMC:MovieClipObject;
      
      public var pauseUI:PauseUI;
      
      public var circleList:Array = [];
      
      public var houseLayer:Sprite;
      
      public var GAME_HEIGHT:uint = 560;
      
      public var deSound:Sound;
      
      public var GAME_WIDTH:uint = 960;
      
      public var swfLib:MCLoader;
      
      private var timebar:TimerMC;
      
      private var trans:SoundTransform;
      
      public var mcSound:Sound;
      
      public var my_score:uint = 0;
      
      private var timer:Timer;
      
      public var bgSound:Sound;
      
      public var houseNum:uint = 5;
      
      public var bombLayer:Sprite;
      
      public var isPauseMuisc:Boolean = false;
      
      private var mouseCursor:MovieClip;
      
      private var currentNum:uint = 0;
      
      public var houseList:Array = [];
      
      public var bombList:Array = [];
      
      public var circleLayer:Sprite;
      
      public var ceSound:Sound;
      
      public var isPause:Boolean = false;
      
      private var sc1:SoundChannel;
      
      private var score_add:uint = 1;
      
      private var toolbar:ToolbarMC;
      
      public function GameContainer(swflib:MCLoader = null)
      {
         super();
         this.swfLib = swflib;
         mouseCursor = this.swfLib.getMC("cursor",new cursor());
         this.bombLayer = new Sprite();
         this.circleLayer = new Sprite();
         this.houseLayer = new Sprite();
         this.pauseLayer = new Sprite();
         houseLayer.addChild(this.swfLib.getMC("BG",new BG()));
         this.addChild(houseLayer);
         this.addChild(bombLayer);
         this.addChild(circleLayer);
         this.addChild(pauseLayer);
         this.addChild(mouseCursor);
         trans = new SoundTransform();
         trans.volume = 1;
         bgSound = new backsound();
         mcSound = new mouseclicksound();
         ceSound = new circleexplodersound();
         deSound = new dieexpldersound();
         this.addEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
         playMusic();
         var gamePreView:GamePreView = new GamePreView(this);
         this.addEventListener("PREGAMEVIEWFINISH",startGame);
      }
      
      public function reStartGame() : void
      {
         isPause = false;
         Mouse.hide();
         playMusic();
         toolbar.setPauseBtnState();
         stage.addEventListener(MouseEvent.CLICK,mouseClickHandler);
         stage.addEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
      }
      
      private function startGame(e:GameStateEvent) : void
      {
         this.removeEventListener("PREGAMEVIEWFINISH",startGame);
         initHouse(houseNum);
         this.addEventListener(Event.ENTER_FRAME,onEnterFrame);
         reStartGame();
      }
      
      public function pauseGame() : void
      {
         isPause = true;
         Mouse.show();
         pauseMusic();
         stage.removeEventListener(MouseEvent.CLICK,mouseClickHandler);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
      }
      
      public function onEnterFrame(eo:Event) : void
      {
         var xx:Number = NaN;
         var i:BombMC = null;
         if(!this.isPause)
         {
            ++currentNum;
            my_score += score_add;
            xx = GAME_WIDTH;
            if(currentNum % 24 == 0)
            {
               if(currentNum % 480 == 0)
               {
                  score_add += 10;
                  ++bombNum;
                  if(currentNum % 2400 == 0)
                  {
                     trace("***");
                     creatBomb(4,xx,0,1);
                  }
               }
               creatBomb(bombNum,xx);
            }
            for each(i in this.bombList)
            {
               i.EnterFrame();
            }
            toolbar.EnterFrame();
            timebar.EnterFrame();
            if(exploderMC)
            {
               exploderMC.EnterFrame();
            }
            if(this.houseList.length == 0)
            {
               gameover();
               this.dispatchEvent(new GameStateEvent("GAMEOVER",0,0));
            }
         }
      }
      
      private function addedToStageHandle(eo:Event) : void
      {
         this.removeEventListener(Event.ADDED_TO_STAGE,addedToStageHandle);
         GAME_WIDTH = this.stage.stageWidth;
         GAME_HEIGHT = this.stage.stageHeight;
      }
      
      public function creatBomb(bombNum:uint, xx:Number = 0, yy:Number = 0, advanceBombType:uint = 0) : void
      {
         var bomb:BombMC = null;
         var area:Number = 0;
         for(var i:uint = 0; i < bombNum; i++)
         {
            if(this.houseList.length > 0)
            {
               do
               {
                  area = Math.floor(Math.random() * houseNum);
               }
               while(!houseList[area]);
               area = houseList[area]._mc.x + Math.random() * 300 - 80;
            }
            else
            {
               area = Math.random() * GAME_WIDTH;
            }
            bomb = new BombMC(this,xx * Math.random(),yy,area,advanceBombType);
            this.bombList.push(bomb);
         }
      }
      
      public function gameState() : uint
      {
         var state:Number = this.houseList.length / this.houseNum;
         if(state <= 0.5)
         {
            return 30;
         }
         if(state > 0.5 && state < 1)
         {
            return 60;
         }
         if(state == 1)
         {
            return 100;
         }
         return 0;
      }
      
      public function playMusic() : void
      {
         isPauseMuisc = false;
         if(!sc1)
         {
            sc1 = bgSound.play(0,1000,trans);
         }
      }
      
      public function gameover() : void
      {
         isPause = true;
         isPauseMuisc = true;
         sc1.stop();
         sc1 = null;
         bgSound = null;
         mcSound = null;
         ceSound = null;
         deSound = null;
         trans = null;
         stage.removeEventListener(MouseEvent.CLICK,mouseClickHandler);
         stage.removeEventListener(MouseEvent.MOUSE_MOVE,mouseMoveHandler);
         this.removeEventListener(Event.ENTER_FRAME,onEnterFrame);
         destroyObject();
      }
      
      public function pauseMusic() : void
      {
         isPauseMuisc = true;
         if(sc1)
         {
            sc1.stop();
            sc1 = null;
         }
      }
      
      private function destroyObject() : void
      {
         var i:* = undefined;
         var j:* = undefined;
         var m:uint = 0;
         try
         {
            Mouse.show();
            for(i in circleList)
            {
               circleList[i].die(true);
            }
            for(j in bombList)
            {
               bombList[j].die();
            }
            if(exploderMC)
            {
               (exploderMC as ExplodeMC).die();
            }
            for(m = 1; m < this.numChildren; m++)
            {
               this.removeChildAt(m);
            }
         }
         catch(e:Error)
         {
            trace(e.message);
         }
      }
      
      private function timerHandler(e:TimerEvent) : void
      {
         var count:int = (e.currentTarget as Timer).currentCount;
         if(count % 10 == 0)
         {
            score_add += 1;
         }
      }
      
      private function mouseMoveHandler(event:MouseEvent) : void
      {
         mouseCursor.x = stage.mouseX;
         mouseCursor.y = stage.mouseY;
         event.updateAfterEvent();
      }
      
      private function mouseClickHandler(event:MouseEvent) : void
      {
         var circle:CircleMC = null;
         if(power > 120 && stage.mouseY < 490)
         {
            power -= 120;
            circle = new CircleMC(this,stage.mouseX,stage.mouseY);
            this.circleList.push(circle);
            if(!isPauseMuisc)
            {
               mcSound.play(0,0,trans);
            }
         }
      }
      
      public function createPauseUI() : void
      {
         pauseUI = new PauseUI(this,400,150);
      }
      
      public function initHouse(num:uint) : void
      {
         var house:HouseMC = null;
         for(var i:uint = 0; i < num; i++)
         {
            house = new HouseMC(this,60 + 170 * i,395);
            this.houseList.push(house);
         }
         toolbar = new ToolbarMC(this,20,485);
         timebar = new TimerMC(this,420,20);
      }
   }
}


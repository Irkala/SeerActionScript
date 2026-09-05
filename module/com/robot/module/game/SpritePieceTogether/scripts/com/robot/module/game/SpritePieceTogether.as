package com.robot.module.game
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.module.game.spritePieceTogether.SpritePiece;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.ui.Keyboard;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpritePieceTogether extends Sprite implements IModule
   {
      
      private var qita:MovieClip;
      
      private var chuansongMC:MovieClip;
      
      private var mainUI:MovieClip;
      
      private var _pieceTimer:Timer;
      
      private var startBtn:MovieClip;
      
      private var clickMC:MovieClip;
      
      private var timeMC:MovieClip;
      
      private var xita:MovieClip;
      
      private var count:uint = 100;
      
      private var startPointArr:Array = [];
      
      private var _pieceIndexArr:Array = [0,1,2,3,4,5,6,7,8,9];
      
      private var qitaBgMC:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var timer:Timer;
      
      private var xitaBgMC:MovieClip;
      
      private var _pieceCount:uint;
      
      private var countTxt:TextField;
      
      private var bClicked:Boolean = false;
      
      public function SpritePieceTogether()
      {
         super();
      }
      
      public function show() : void
      {
         if(!mainUI)
         {
            setup();
         }
         if(DisplayUtil.hasParent(mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClickPiece(evt:MouseEvent) : void
      {
         var name:String = null;
         var hitName:String = null;
         var hitMC:MovieClip = null;
         var rotation:Number = NaN;
         var mc:MovieClip = evt.currentTarget as MovieClip;
         if(bClicked)
         {
            name = mc.name;
            rotation = mc.rotation;
            if(name.split("_")[0] == "SpriteOne")
            {
               hitName = "hitOne_" + mc.name.split("_")[1];
               hitMC = qita[hitName];
               if(hitMC == null)
               {
                  backToStart(mc);
                  return;
               }
               if(mc.hitTestObject(hitMC) && rotation == 0)
               {
                  qitaBgMC.gotoAndStop(2);
                  hitMC.gotoAndStop(2);
                  checekPieceArr(mc.type);
                  DisplayUtil.removeForParent(mc);
                  mc.removeEventListener(Event.ENTER_FRAME,onPieceEntFrame);
                  bClicked = false;
                  setTimeout(function():void
                  {
                     qitaBgMC.gotoAndStop(1);
                  },400);
               }
               else
               {
                  backToStart(mc);
               }
            }
            if(name.split("_")[0] == "SpriteTwo")
            {
               hitName = "hitTwo_" + mc.name.split("_")[1];
               hitMC = xita[hitName];
               if(hitMC == null)
               {
                  backToStart(mc);
                  return;
               }
               if(mc.hitTestObject(hitMC) && rotation == 0)
               {
                  xitaBgMC.gotoAndStop(2);
                  hitMC.gotoAndStop(2);
                  checekPieceArr(mc.type);
                  DisplayUtil.removeForParent(mc);
                  mc.removeEventListener(Event.ENTER_FRAME,onPieceEntFrame);
                  bClicked = false;
                  setTimeout(function():void
                  {
                     xitaBgMC.gotoAndStop(1);
                  },400);
               }
               else
               {
                  backToStart(mc);
               }
            }
         }
         else
         {
            startPointArr = [mc.x,mc.y];
            bClicked = true;
            clickMC = mc;
            mainUI.addChild(mc);
            mc.removeEventListener(Event.ENTER_FRAME,onPieceEntFrame);
            mc.startDrag(true);
         }
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         if(count == 0)
         {
            _pieceTimer.removeEventListener(TimerEvent.TIMER,laySpritePiece);
            _pieceTimer.stop();
            _pieceTimer = null;
            timer.removeEventListener(TimerEvent.TIMER,onTimer);
            timer.stop();
            timer = null;
            chuansongMC.stop();
            this.loaderInfo.sharedEvents.dispatchEvent(new Event("GameFail"));
            trace("Game Over!");
            return;
         }
         --count;
         countTxt.text = count.toString();
      }
      
      private function onPieceEntFrame(evt:Event) : void
      {
         var mc:MovieClip = evt.currentTarget as MovieClip;
         mc.x -= 5.5;
         if(mc.x < -10)
         {
            mc.removeEventListener(MouseEvent.CLICK,onClickPiece);
            mc.removeEventListener(Event.ENTER_FRAME,onPieceEntFrame);
            DisplayUtil.removeForParent(mc);
            mc = null;
         }
      }
      
      public function hide() : void
      {
         if(_pieceTimer)
         {
            _pieceTimer.removeEventListener(TimerEvent.TIMER,laySpritePiece);
            _pieceTimer.stop();
            _pieceTimer = null;
         }
         if(timer)
         {
            timer.removeEventListener(TimerEvent.TIMER,onTimer);
            timer.stop();
            timer = null;
         }
         chuansongMC.stop();
         closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         startBtn.removeEventListener(MouseEvent.CLICK,onStartGame);
         MainManager.getStage().removeEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
         DisplayUtil.removeForParent(mainUI);
         mainUI = null;
      }
      
      private function addPiece() : void
      {
         if(_pieceIndexArr.length == 0)
         {
            trace("Pass Game!");
            return;
         }
         var index:uint = Math.random() * _pieceIndexArr.length;
         var mc:MovieClip = new SpritePiece(_pieceIndexArr[index]);
         var depth:uint = mainUI.getChildIndex(chuansongMC) + 1;
         mainUI.addChildAt(mc,depth);
         mc.buttonMode = true;
         mc.x = 980;
         mc.y = 470;
         mc.rotation = 90;
         mc.addEventListener(MouseEvent.CLICK,onClickPiece);
         mc.addEventListener(Event.ENTER_FRAME,onPieceEntFrame);
      }
      
      private function backToStart(mc:MovieClip) : void
      {
         bClicked = false;
         mc.stopDrag();
         mc.x = startPointArr[0];
         mc.y = startPointArr[1];
         mc.addEventListener(Event.ENTER_FRAME,onPieceEntFrame);
      }
      
      private function onStartGame(evt:MouseEvent) : void
      {
         startBtn.removeEventListener(MouseEvent.CLICK,onStartGame);
         startBtn.buttonMode = false;
         startBtn.mouseEnabled = false;
         startBtn.visible = false;
         timeMC.visible = true;
         timeMC.gotoAndPlay(2);
         timeMC.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            if(timeMC.currentFrame == timeMC.totalFrames)
            {
               timeMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               timeMC.stop();
               timer.start();
               countTxt.visible = true;
               chuansongMC.gotoAndPlay(2);
               addPiece();
               _pieceTimer.start();
            }
         });
      }
      
      private function onKeyDown(evt:KeyboardEvent) : void
      {
         if(bClicked)
         {
            if(evt.keyCode == Keyboard.SPACE)
            {
               clickMC.rotation += 45;
            }
         }
      }
      
      private function checekPieceArr(num:uint) : void
      {
         for(var i:uint = 0; i < _pieceIndexArr.length; i++)
         {
            if(_pieceIndexArr[i] == num)
            {
               _pieceIndexArr.splice(i,1);
            }
         }
         if(_pieceIndexArr.length == 0)
         {
            _pieceTimer.removeEventListener(TimerEvent.TIMER,laySpritePiece);
            _pieceTimer.stop();
            _pieceTimer = null;
            timer.removeEventListener(TimerEvent.TIMER,onTimer);
            timer.stop();
            timer = null;
            chuansongMC.stop();
            this.loaderInfo.sharedEvents.dispatchEvent(new Event("GamePass"));
            trace("Pass Game!");
         }
      }
      
      private function laySpritePiece(evt:TimerEvent) : void
      {
         addPiece();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event("GameClose"));
         hide();
      }
      
      public function destroy() : void
      {
         hide();
      }
      
      public function setup() : void
      {
         var i:uint;
         var hitOneName:String = null;
         var hitOneMC:MovieClip = null;
         var hitTwoName:String = null;
         var hitTwoMC:MovieClip = null;
         mainUI = new ui_SpritePieceTogether();
         chuansongMC = mainUI["chuansongMC"];
         chuansongMC.gotoAndStop(1);
         xita = mainUI["xita"];
         qita = mainUI["qita"];
         for(i = 0; i < 5; i++)
         {
            hitOneName = "hitOne_" + i;
            hitOneMC = qita[hitOneName];
            hitOneMC.gotoAndStop(1);
            hitTwoName = "hitTwo_" + i;
            hitTwoMC = xita[hitTwoName];
            hitTwoMC.gotoAndStop(1);
         }
         qitaBgMC = qita["qitaBgMC"];
         xitaBgMC = xita["xitaBgMC"];
         qitaBgMC.gotoAndStop(1);
         xitaBgMC.gotoAndStop(1);
         countTxt = mainUI["countTxt"];
         countTxt.text = count.toString();
         countTxt.visible = false;
         startBtn = mainUI["startBtn"];
         startBtn.buttonMode = true;
         startBtn.gotoAndStop(1);
         startBtn.addEventListener(MouseEvent.MOUSE_OVER,function(evt:MouseEvent):void
         {
            startBtn.gotoAndStop(2);
         });
         startBtn.addEventListener(MouseEvent.MOUSE_OUT,function(evt:MouseEvent):void
         {
            startBtn.gotoAndStop(1);
         });
         startBtn.addEventListener(MouseEvent.CLICK,onStartGame);
         _pieceTimer = new Timer(4000);
         _pieceTimer.addEventListener(TimerEvent.TIMER,laySpritePiece);
         timeMC = mainUI["timeMC"];
         timeMC.gotoAndStop(1);
         timeMC.visible = false;
         closeBtn = mainUI["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         timer = new Timer(1000);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         MainManager.getStage().addEventListener(KeyboardEvent.KEY_DOWN,onKeyDown);
      }
   }
}


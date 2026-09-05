package com.robot.module.game.divingGame
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import flash.utils.setTimeout;
   import gs.TweenLite;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class DivingGame extends Sprite
   {
      
      private var _remainTimer:Timer;
      
      private var _arrowHead:ArrowHead;
      
      private var rotationCnt:uint;
      
      private var _divingBlockCnt:uint;
      
      private var _power:Number;
      
      private var _block:Block;
      
      private var _startGamePanel:MovieClip;
      
      private var _player:Player;
      
      private var _guidePostMC:MovieClip;
      
      private var _divingBlock:Block;
      
      private var _timeCnt:uint = 300;
      
      private var _movingCnt:uint;
      
      private var _targetBlock:Block;
      
      private var _targetPoint:Point;
      
      private var vx:Number = 0;
      
      private var _movingBg_0:MovieClip;
      
      private var _movingBg_1:MovieClip;
      
      private var _timer:Timer;
      
      private var speed:Number;
      
      private var _barrierArr:Array;
      
      private var vy:Number = 0;
      
      private var ro:Number;
      
      private var gravity:Number = 5;
      
      private var _angle:Number;
      
      private var _len:Number = 420;
      
      private var _stroke:MovieClip;
      
      private var lineSprite:Sprite;
      
      private var _bg:MovieClip;
      
      private var _movingBgCont:Sprite;
      
      private var _startPoint:Point;
      
      private var _bBlock:Boolean = true;
      
      private var _timeCntMC:MovieClip;
      
      private var _barrierBlock:BarrierBlock;
      
      private var _barrier:Barrier;
      
      public function DivingGame()
      {
         _startPoint = new Point(150,300);
         _targetPoint = new Point();
         _barrierArr = [];
         super();
         _startGamePanel = new StartGamePanel();
         this.addChild(_startGamePanel);
         _startGamePanel["startBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(_startGamePanel);
            _startGamePanel = null;
            startGame();
         });
         _startGamePanel["helpBtn"].addEventListener(MouseEvent.CLICK,showHelpPane);
         _startGamePanel["closeBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(_startGamePanel);
            _startGamePanel = null;
            EventManager.dispatchEvent(new DynamicEvent("DivingGame_Over",0));
            LevelManager.showMapLevel();
         });
      }
      
      private function onPlayerEntFrame(evt:Event) : void
      {
         var mc:MovieClip = null;
         _player.x += speed * Math.abs(Math.cos(ro));
         _player.y -= speed * Math.abs(Math.sin(ro));
         vy += gravity;
         _player.y += vy;
         _player.rotation += 360 / rotationCnt;
         if(_player.hitTestObject(_barrier) || _player.hitTestObject(_barrierBlock.hitMC))
         {
            _player.removeEventListener(Event.ENTER_FRAME,onPlayerEntFrame);
            TweenLite.to(_player,1,{
               "x":_player.x - 200,
               "y":_player.y + 400
            });
            setTimeout(gameOver,1000);
            return;
         }
         if(_player.y >= _startPoint.y)
         {
            _player.mc.gotoAndStop(1);
            _arrowHead.addEventListener(MouseEvent.CLICK,onMosClick);
            _player.y = _startPoint.y;
            _player.removeEventListener(Event.ENTER_FRAME,onPlayerEntFrame);
            vy = 0;
            _player.rotation = 0;
            if(_player.hitTestObject(_targetBlock))
            {
               _player.x = _targetBlock.x;
               _player.y = _targetBlock.y - _player.height / 2;
               this.addChildAt(_player,this.numChildren - 1);
               TweenLite.to(_barrierBlock,1.5,{"x":-100});
               ++_divingBlockCnt;
               _guidePostMC.x = 47 * _divingBlockCnt;
               if(_divingBlockCnt == 10)
               {
                  _player.mc.gotoAndStop(2);
                  setTimeout(gamePass,1000);
                  return;
               }
               returnStart();
            }
            else
            {
               _player.visible = false;
               mc = new LostGameMC();
               this.addChild(mc);
               mc.x = _player.x + 40;
               mc.y = _player.y + 120;
               mc.rotation = 135;
               setTimeout(gameOver,1000);
            }
         }
      }
      
      private function onUpdateBg() : void
      {
         if(_movingBgCont.x <= -960 - 960 * _movingCnt)
         {
            ++_movingCnt;
         }
         if(_movingCnt % 2 == 0)
         {
            _movingBg_1.x = _movingBg_0.x + _movingBg_0.width;
         }
         else
         {
            _movingBg_0.x = _movingBg_1.x + _movingBg_1.width;
         }
      }
      
      public function startDive(r:Number, len:Number) : void
      {
         ro = r;
         rotationCnt = 2 * Math.abs(speed * Math.abs(Math.sin(r)) / gravity);
         _player.addEventListener(Event.ENTER_FRAME,onPlayerEntFrame);
      }
      
      private function returnStart() : void
      {
         TweenLite.to(_player,1,{
            "x":_startPoint.x,
            "y":_startPoint.y,
            "onComplete":divingComp
         });
         if(_bBlock)
         {
            _targetBlock = _block;
            TweenLite.to(_divingBlock,1,{
               "x":_startPoint.x,
               "onComplete":divingComp
            });
            TweenLite.to(_block,0.5,{
               "x":-100,
               "onComplete":divingComp
            });
            _block.x = 970;
            _targetPoint.x = Math.random() * 100 + 400;
            TweenLite.to(_block,1,{
               "x":_targetPoint.x,
               "onComplete":divingComp
            });
         }
         else
         {
            _targetBlock = _divingBlock;
            TweenLite.to(_block,1,{
               "x":_startPoint.x,
               "onComplete":divingComp
            });
            TweenLite.to(_divingBlock,0.5,{
               "x":-100,
               "onComplete":divingComp
            });
            _divingBlock.x = 970;
            _targetPoint.x = Math.random() * 100 + 400;
            TweenLite.to(_divingBlock,1,{
               "x":_targetPoint.x,
               "onComplete":divingComp
            });
         }
         if(_divingBlockCnt >= 3)
         {
            createBarrierBlock();
         }
         if(_divingBlockCnt >= 5)
         {
            createBarrier();
         }
         TweenLite.to(_movingBgCont,1,{
            "x":_movingBgCont.x - _targetPoint.x + _startPoint.x,
            "onUpdate":onUpdateBg
         });
      }
      
      private function initGame() : void
      {
         _timer = new Timer(30);
         _timer.addEventListener(TimerEvent.TIMER,onTimer);
         createBg();
         createStroke();
         createTimeCount();
         createMovingBg();
         createPlayer();
         createBlock();
         createDivingBlock();
         createArrowHead();
      }
      
      public function destroy() : void
      {
         TweenLite.killTweensOf(_player,true);
         TweenLite.killTweensOf(_block,true);
         TweenLite.killTweensOf(_divingBlock,true);
         TweenLite.killTweensOf(_movingBgCont,true);
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
         if(_timer)
         {
            _timer.stop();
            _timer.removeEventListener(TimerEvent.TIMER,onTimer);
            _timer = null;
         }
         if(_arrowHead)
         {
            _arrowHead.removeEventListener(MouseEvent.CLICK,onMosClick);
         }
         if(_player)
         {
            _player.removeEventListener(Event.ENTER_FRAME,onPlayerEntFrame);
            _player = null;
         }
         DisplayUtil.removeAllChild(this);
         _bg = null;
         _arrowHead = null;
         _block = null;
         _divingBlock = null;
      }
      
      private function createBlock() : void
      {
         _block = new Block();
         this.addChild(_block);
         _block.x = _startPoint.x;
         _block.y = _startPoint.y + _player.height / 2;
      }
      
      private function createTimeCount() : void
      {
         _timeCntMC = new TimeCountMC();
         this.addChild(_timeCntMC);
         _remainTimer = new Timer(1000);
         _remainTimer.addEventListener(TimerEvent.TIMER,function(evt:TimerEvent):void
         {
            --_timeCnt;
            _timeCntMC["timeTxt"].text = _timeCnt;
            if(_timeCnt == 0)
            {
               gameOver();
               return;
            }
         });
         _remainTimer.start();
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         _barrier.x -= 10;
         if(_barrier.x <= -20)
         {
            _barrier.x = 970;
         }
      }
      
      private function gameOver() : void
      {
         var gameOverPanel:MovieClip = null;
         destroy();
         gameOverPanel = new GameOverMC();
         this.addChild(gameOverPanel);
         gameOverPanel["confirmBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(gameOverPanel);
            gameOverPanel = null;
            EventManager.dispatchEvent(new DynamicEvent("DivingGame_Over",_divingBlockCnt));
         });
         LevelManager.showMapLevel();
      }
      
      private function createBarrierBlock() : void
      {
         var distance:Number = NaN;
         var dis:Number = NaN;
         var r:Number = Math.random();
         if(r < 0.3)
         {
            this.addChild(_barrierBlock);
            distance = _targetPoint.x - _startPoint.x;
            dis = _startPoint.x + distance / 2 - 50 * Math.random();
            _barrierBlock.x = 970;
            TweenLite.to(_barrierBlock,1,{"x":dis});
         }
      }
      
      private function gamePass() : void
      {
         var gamePassPanel:MovieClip = null;
         destroy();
         gamePassPanel = new PassGameMC();
         this.addChild(gamePassPanel);
         gamePassPanel["confirmBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(gamePassPanel);
            gamePassPanel = null;
            EventManager.dispatchEvent(new DynamicEvent("DivingGame_Pass",10));
         });
         LevelManager.showMapLevel();
      }
      
      private function onEntFrame(evt:Event) : void
      {
         _angle = Math.atan2(this.stage.mouseY - _arrowHead.y,this.stage.mouseX - _arrowHead.x);
         _arrowHead.rotation = _angle * 180 / Math.PI;
         var bShow:Boolean = checkIsShowAH(this.stage.mouseX,this.stage.mouseY);
         _arrowHead.visible = bShow;
      }
      
      private function createDivingBlock() : void
      {
         _divingBlock = new Block();
         this.addChild(_divingBlock);
         _divingBlock.x = _startPoint.x + Math.random() * 300 + 300;
         _divingBlock.y = _startPoint.y + _player.height / 2;
         _targetBlock = _divingBlock;
         _barrierBlock = new BarrierBlock();
         _barrierBlock.x = 970;
         _barrierBlock.y = _startPoint.y + _player.height / 2;
         _barrierArr.push(_barrierBlock);
         _barrier = new Barrier();
         _barrier.x = 970;
         _barrier.y = 250;
         _barrierArr.push(_barrier);
      }
      
      private function checkIsShowAH(tx:Number, ty:Number) : Boolean
      {
         var frame:uint = 0;
         _power = Math.sqrt((tx - _arrowHead.x) * (tx - _arrowHead.x) + (ty - _arrowHead.y) * (ty - _arrowHead.y));
         if(_power <= _len && tx >= _startPoint.x && ty <= _startPoint.y)
         {
            frame = Math.round(_power / _len * _arrowHead.mc.totalFrames);
            _arrowHead.mc.gotoAndStop(frame);
            speed = frame * 2.5;
            return true;
         }
         return false;
      }
      
      private function createMovingBg() : void
      {
         _movingBgCont = new Sprite();
         this.addChild(_movingBgCont);
         _movingBgCont.y = 350;
         _movingBg_0 = new MovingBgMC();
         _movingBgCont.addChild(_movingBg_0);
         _movingBg_1 = new MovingBgMC();
         _movingBgCont.addChild(_movingBg_1);
         _movingBg_1.x = _movingBg_0.x + _movingBg_0.width;
      }
      
      private function drawLine() : void
      {
         lineSprite.graphics.clear();
         lineSprite.graphics.lineStyle(2,16711935);
         lineSprite.graphics.moveTo(this.stage.mouseX,this.stage.mouseY);
         lineSprite.graphics.lineTo(2 * _power * Math.cos(_angle) + _startPoint.x,_startPoint.y + _player.height / 2);
      }
      
      private function divingComp() : void
      {
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
         _bBlock = !_bBlock;
      }
      
      private function createBg() : void
      {
         _bg = new BgMC();
         this.addChild(_bg);
         lineSprite = new Sprite();
         this.addChild(lineSprite);
      }
      
      private function createStroke() : void
      {
         _stroke = new StrokeMC();
         _stroke.x = 200;
         _stroke.y = 50;
         this.addChild(_stroke);
         _guidePostMC = _stroke["guidepostMC"];
      }
      
      private function createBarrier() : void
      {
         this.addChild(_barrier);
         _timer.start();
      }
      
      private function onMosClick(evt:MouseEvent) : void
      {
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
         _arrowHead.removeEventListener(MouseEvent.CLICK,onMosClick);
         _player.mc.gotoAndStop(2);
         setTimeout(startDive,500,_angle,_power);
         _arrowHead.visible = false;
      }
      
      private function initEvent() : void
      {
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
         _arrowHead.addEventListener(MouseEvent.CLICK,onMosClick);
      }
      
      private function startGame() : void
      {
         LevelManager.hideMapLevel();
         initGame();
         initEvent();
      }
      
      private function createArrowHead() : void
      {
         _arrowHead = new ArrowHead();
         _arrowHead.x = _player.x;
         _arrowHead.y = _player.y + _player.height / 2;
         this.addChild(_arrowHead);
         this.swapChildren(_player,_arrowHead);
         _arrowHead.mouseChildren = false;
      }
      
      private function createPlayer() : void
      {
         _player = new Player();
         _player.x = _startPoint.x;
         _player.y = _startPoint.y;
         this.addChild(_player);
      }
      
      private function showHelpPane(evt:MouseEvent) : void
      {
         var helpMC:MovieClip = null;
         DisplayUtil.removeForParent(_startGamePanel);
         _startGamePanel = null;
         helpMC = new HelpMC();
         this.addChild(helpMC);
         helpMC["startBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(helpMC);
            helpMC = null;
            startGame();
         });
         helpMC["closeBtn"].addEventListener(MouseEvent.CLICK,function():void
         {
            DisplayUtil.removeForParent(helpMC);
            helpMC = null;
            EventManager.dispatchEvent(new DynamicEvent("DivingGame_Over",0));
            LevelManager.showMapLevel();
         });
      }
   }
}


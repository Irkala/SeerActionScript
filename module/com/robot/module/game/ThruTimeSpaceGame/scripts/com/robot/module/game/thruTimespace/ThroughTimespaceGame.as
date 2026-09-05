package com.robot.module.game.thruTimespace
{
   import com.robot.core.manager.GamePlatformManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.setTimeout;
   import org.taomee.utils.DisplayUtil;
   
   public class ThroughTimespaceGame extends Sprite
   {
      
      public static var own:Sprite;
      
      private var _acc:Number = 0.001;
      
      private var _coursePotionMC:MovieClip;
      
      private var _helpPanel:MovieClip;
      
      private var _player:Player;
      
      private var _speedSizeMC:MovieClip;
      
      private var _startGamePanel:MovieClip;
      
      private var _speed:Number = 0.01;
      
      private var _bdArr:Array;
      
      private var _passedCnt:uint = 0;
      
      private var _playerPositionMC:MovieClip;
      
      private var _currentDoor:uint = 0;
      
      private var _gamePassPanel:MovieClip;
      
      private var _bg:MovieClip;
      
      private var _barrierDoor_0:BarrierDoor;
      
      private var _barrierDoor_1:BarrierDoor;
      
      private var _barrierDoor_2:BarrierDoor;
      
      private var _currentBD:BarrierDoor;
      
      private var _gameOverPanel:MovieClip;
      
      public function ThroughTimespaceGame()
      {
         _bdArr = [];
         super();
         own = this;
         _startGamePanel = new ThruTS_StartGamePanel();
         _helpPanel = new ThruTS_HelpPanel();
         _startGamePanel["closeBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            _startGamePanel["closeBtn"].removeEventListener(MouseEvent.CLICK,arguments.callee);
            DisplayUtil.removeForParent(_startGamePanel);
            _startGamePanel = null;
            GamePlatformManager.gameOver(0,0);
         });
         _startGamePanel["helpBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            _startGamePanel["helpBtn"].removeEventListener(MouseEvent.CLICK,arguments.callee);
            DisplayUtil.removeForParent(_startGamePanel);
            _startGamePanel = null;
            own.addChild(_helpPanel);
         });
         _startGamePanel["startBtn"].addEventListener(MouseEvent.CLICK,startGame);
         this.addChild(_startGamePanel);
         _helpPanel["closeBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            _helpPanel["closeBtn"].removeEventListener(MouseEvent.CLICK,arguments.callee);
            DisplayUtil.removeForParent(_helpPanel);
            _helpPanel = null;
            GamePlatformManager.gameOver(0,0);
         });
         _helpPanel["startBtn"].addEventListener(MouseEvent.CLICK,startGame);
      }
      
      private function onEntFrame(evt:Event) : void
      {
         switch(_currentDoor)
         {
            case 0:
               _currentBD = _barrierDoor_0;
               barrierMove(_barrierDoor_0);
               break;
            case 1:
               _currentBD = _barrierDoor_1;
               barrierMove(_barrierDoor_1);
               break;
            case 2:
               _currentBD = _barrierDoor_2;
               barrierMove(_barrierDoor_2);
         }
         _player.move();
         _playerPositionMC["mc"].x = _player.x / 480 * 68;
         _playerPositionMC["mc"].y = _player.y / 280 * 60;
      }
      
      private function init() : void
      {
         _bg = new ThruTimespace_BgMC();
         this.addChild(_bg);
         _bg.x = 480;
         _bg.y = 280;
         _barrierDoor_0 = new BarrierDoor(0);
         this.addChild(_barrierDoor_0);
         _barrierDoor_0.type = 0;
         _barrierDoor_1 = new BarrierDoor(1);
         this.addChild(_barrierDoor_1);
         _barrierDoor_1.type = 1;
         _barrierDoor_2 = new BarrierDoor(2);
         this.addChild(_barrierDoor_2);
         _barrierDoor_2.type = 2;
         _bdArr = [_barrierDoor_0,_barrierDoor_1,_barrierDoor_2];
         switchBDStatus();
         _coursePotionMC = new CoursePositionMC();
         this.addChild(_coursePotionMC);
         _coursePotionMC.x = 250;
         _coursePotionMC.y = 520;
         _speedSizeMC = new SpeedSizeMC();
         this.addChild(_speedSizeMC);
         _speedSizeMC.x = 112;
         _speedSizeMC.y = 10;
         _speedSizeMC["mc"].gotoAndStop(1);
         _playerPositionMC = new PlayerPositionMC();
         this.addChild(_playerPositionMC);
         _player = new Player();
         this.addChild(_player);
         _player.x = 480;
         _player.y = 280;
      }
      
      private function addEvent() : void
      {
         this.addEventListener(Event.ENTER_FRAME,onEntFrame);
      }
      
      private function setBDStatus(bd:BarrierDoor) : void
      {
         var type:uint = bd.type;
         switch(type)
         {
            case 0:
               bd.scaleX = 0.6;
               bd.scaleY = 0.6;
               bd.alpha = 0.6;
               bd.x = 480;
               bd.y = 280;
               break;
            case 1:
               bd.scaleX = 0.4;
               bd.scaleY = 0.4;
               bd.alpha = 0.4;
               bd.x = 480;
               bd.y = 280;
               break;
            case 2:
               bd.scaleX = 0.2;
               bd.scaleY = 0.2;
               bd.alpha = 0.2;
               bd.x = 480;
               bd.y = 280;
         }
      }
      
      private function switchBDStatus() : void
      {
         var bd:BarrierDoor = null;
         var type:uint = 0;
         for each(bd in _bdArr)
         {
            bd.type = type;
            setBDStatus(bd);
            type++;
         }
      }
      
      private function barrierMove(bd:BarrierDoor) : void
      {
         var r:uint = 0;
         var passGameMC:MovieClip = null;
         bd.alpha += 0.1;
         _acc *= 1.1;
         bd.scaleX += _speed + _acc;
         bd.scaleY += _speed + _acc;
         if(bd.scaleX >= 1.5 && bd.scaleX <= 2)
         {
            if(!bd.mc.hitTestPoint(_player.x,_player.y,true))
            {
               removeEvent();
               _player.mc.gotoAndStop(2);
               setTimeout(function():void
               {
                  DisplayUtil.FillColor(_player.mc["mc"]["mc"],MainManager.actorInfo.nonoColor);
               },50);
               setTimeout(function():void
               {
                  var gameOverMC:MovieClip = null;
                  gameOverMC = new ThruTS_GameOverPanel();
                  own.addChild(gameOverMC);
                  gameOverMC.x = 275;
                  gameOverMC.y = 150;
                  gameOverMC["confirmBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
                  {
                     DisplayUtil.removeForParent(gameOverMC);
                     destroy();
                     GamePlatformManager.gameOver(_passedCnt * 10,_passedCnt * 10);
                  });
               },1000);
            }
         }
         if(bd.scaleX > 2)
         {
            bd.alpha -= 0.4;
         }
         if(bd.scaleX >= 4)
         {
            _acc = 0.001;
            r = 1 + Math.floor(Math.random() * bd.mc.totalFrames);
            bd.mc.gotoAndStop(r);
            _bdArr.shift();
            _bdArr.push(bd);
            switchBDStatus();
            ++_passedCnt;
            _coursePotionMC["arrowheadMC"].x = 58 * _passedCnt - 12;
            if(_passedCnt >= 10)
            {
               removeEvent();
               passGameMC = new ThruTS_GamePassPanel();
               this.addChild(passGameMC);
               passGameMC.x = 275;
               passGameMC.y = 150;
               passGameMC["confirmBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
               {
                  DisplayUtil.removeForParent(passGameMC);
                  destroy();
                  GamePlatformManager.gameOver(_passedCnt * 10,_passedCnt * 10);
               });
            }
            ++_currentDoor;
            if(_currentDoor == 3)
            {
               _currentDoor = 0;
            }
            switch(_passedCnt)
            {
               case 2:
                  _speed = 0.02;
                  break;
               case 4:
                  _speed = 0.03;
                  break;
               case 6:
                  _speed = 0.04;
                  break;
               case 8:
                  _speed = 0.05;
            }
            _speedSizeMC["mc"].gotoAndStop(_passedCnt * 5);
         }
      }
      
      private function removeEvent() : void
      {
         var bd:BarrierDoor = null;
         this.removeEventListener(Event.ENTER_FRAME,onEntFrame);
         for each(bd in _bdArr)
         {
            if(bd)
            {
               bd.destroy();
            }
         }
         if(_bg)
         {
            _bg.gotoAndStop(1);
         }
      }
      
      public function destroy() : void
      {
         LevelManager.showMapLevel();
         removeEvent();
         DisplayUtil.removeAllChild(this);
         _bg = null;
         _player = null;
         _barrierDoor_0 = null;
         _barrierDoor_1 = null;
         _barrierDoor_2 = null;
         _coursePotionMC = null;
         _speedSizeMC = null;
         _playerPositionMC = null;
         _startGamePanel = null;
         _helpPanel = null;
         _gamePassPanel = null;
         _gameOverPanel = null;
         _currentBD = null;
      }
      
      private function startGame(evt:MouseEvent) : void
      {
         if(_startGamePanel)
         {
            DisplayUtil.removeForParent(_startGamePanel);
            _startGamePanel = null;
         }
         if(_helpPanel)
         {
            DisplayUtil.removeForParent(_helpPanel);
            _helpPanel = null;
         }
         init();
         LevelManager.hideMapLevel();
         setTimeout(function():void
         {
            addEvent();
         },2000);
      }
   }
}


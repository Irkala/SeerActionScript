package com.robot.module.task.YoufuHideAndSeekTask
{
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   import org.taomee.utils.DisplayUtil;
   
   public class HideAndSeekGame extends Sprite
   {
      
      private var _introducePanel:Sprite = null;
      
      private var _youfuMC:MovieClip = null;
      
      private var _gamePanelMC:MovieClip = null;
      
      private var _timer:Timer;
      
      private var _rCount:uint = 5;
      
      private var _closeBtn:SimpleButton = null;
      
      private var _startGameBtn:SimpleButton = null;
      
      private var _gamePanel:Sprite = null;
      
      private var _introduceMC:MovieClip = null;
      
      private var _positionArr:Array = [new Point(50,150),new Point(380,120),new Point(220,260)];
      
      private var _cloud:Cloud = null;
      
      public function HideAndSeekGame()
      {
         super();
         init();
      }
      
      private function init() : void
      {
         _gamePanel = new Sprite();
         _gamePanelMC = new GamePanelMC();
         _gamePanel.addChild(_gamePanelMC);
         for(var i:int = 0; i < _positionArr.length; i++)
         {
            _cloud = new Cloud(_positionArr[i]);
            _cloud.name = String(i);
            _gamePanel.addChild(_cloud);
            _cloud.buttonMode = true;
            _cloud.addEventListener(MouseEvent.CLICK,onCloudClick);
         }
         _closeBtn = new CloseBtn();
         _closeBtn.x = 568.5;
         _closeBtn.y = 1.8;
         _introducePanel = new Sprite();
         this.addChild(_introducePanel);
         _introduceMC = new IntroduceYouFuMC();
         _introducePanel.addChild(_introduceMC);
         _introducePanel.x = 90;
         _introducePanel.y = 100;
         _startGameBtn = new StartGameBtn();
         _introducePanel.addChild(_startGameBtn);
         _startGameBtn.x = 147;
         _startGameBtn.y = 147;
         _startGameBtn.addEventListener(MouseEvent.CLICK,onStartGame);
      }
      
      private function onStartGame(evt:MouseEvent) : void
      {
         _startGameBtn.removeEventListener(MouseEvent.CLICK,onStartGame);
         DisplayUtil.removeForParent(_introducePanel);
         this.addChild(_gamePanel);
         this.addChild(_closeBtn);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseGame);
         _gamePanel.mouseChildren = false;
         _youfuMC = new YoufuMC();
         var i:uint = Math.floor(Math.random() * _positionArr.length);
         var cloud:Cloud = _gamePanel.getChildByName(String(i)) as Cloud;
         cloud.containsYoufu(_youfuMC);
         cloud.hasChild = true;
         _youfuMC.addEventListener(Event.ENTER_FRAME,onYoufuHide);
      }
      
      private function onCloudClick(evt:MouseEvent) : void
      {
         var cloud:Cloud = null;
         _gamePanel.mouseChildren = false;
         cloud = evt.currentTarget as Cloud;
         cloud.mc.gotoAndPlay(25);
         _youfuMC.visible = true;
         _youfuMC.gotoAndPlay(35);
         _youfuMC.addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            if(_youfuMC.currentFrame == _youfuMC.totalFrames)
            {
               _youfuMC.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               if(cloud.hasChild)
               {
                  trace("Find it!");
                  TasksManager.complete(406,0,function():void
                  {
                     destroy();
                  });
               }
               else
               {
                  Alarm.show("不要气馁哦，再来试试看吧！相信我们一定可以把这个小家伙找出来。",destroy);
               }
            }
         });
      }
      
      private function onCloseGame(evt:MouseEvent) : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseGame);
         destroy();
      }
      
      private function onTimer(evt:TimerEvent) : void
      {
         var cloud:Cloud = null;
         var i:uint = Math.floor(Math.random() * 5);
         while(_rCount == i)
         {
            i = Math.floor(Math.random() * 5);
         }
         var arr:Array = [];
         switch(i)
         {
            case 0:
               arr = [_positionArr[1],_positionArr[0],_positionArr[2]];
               break;
            case 1:
               arr = [_positionArr[1],_positionArr[2],_positionArr[0]];
               break;
            case 2:
               arr = [_positionArr[2],_positionArr[0],_positionArr[1]];
               break;
            case 3:
               arr = [_positionArr[2],_positionArr[1],_positionArr[0]];
               break;
            case 4:
               arr = [_positionArr[0],_positionArr[2],_positionArr[1]];
         }
         for(var j:uint = 0; j < _positionArr.length; j++)
         {
            cloud = _gamePanel.getChildByName(String(j)) as Cloud;
            cloud.move(arr[j]);
         }
         _rCount = i;
      }
      
      private function onYoufuHide(evt:Event) : void
      {
         if(_youfuMC.currentFrame == 35)
         {
            _youfuMC.removeEventListener(Event.ENTER_FRAME,onYoufuHide);
            _youfuMC.visible = false;
            _timer = new Timer(1000,10);
            _timer.addEventListener(TimerEvent.TIMER,onTimer);
            _timer.addEventListener(TimerEvent.TIMER_COMPLETE,onComplete);
            _timer.start();
         }
      }
      
      public function destroy() : void
      {
         DisplayUtil.removeForParent(_gamePanel);
         DisplayUtil.removeForParent(_closeBtn);
         _gamePanel = null;
         _closeBtn = null;
         if(_timer)
         {
            _timer.removeEventListener(TimerEvent.TIMER,onTimer);
            _timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onComplete);
         }
      }
      
      private function onComplete(evt:TimerEvent) : void
      {
         _timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onComplete);
         _gamePanel.mouseChildren = true;
      }
   }
}


package com.robot.module.task
{
   import com.robot.app.task.taskUtils.taskDialog.NpcTipDialog;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.text.TextField;
   import flash.utils.Timer;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class MonkeyKongfu extends Sprite implements IModule
   {
      
      private var _clamBtn:SimpleButton;
      
      private var fra:int;
      
      private var _haomiao:int = 99;
      
      private var _timeInt:int = 29;
      
      private var _sound:Sound;
      
      private var _timeTxt:TextField;
      
      private var _time:Timer;
      
      private var _closeBtn:SimpleButton;
      
      private var _roke2:MovieClip;
      
      private var _roke3:MovieClip;
      
      private var _roke4:MovieClip;
      
      private var _mainUI:MovieClip;
      
      private var jint:int = 0;
      
      private var _roke1:MovieClip;
      
      private var sc:SoundChannel;
      
      private var rondamInt:int;
      
      private var _clambar:MovieClip;
      
      private var isJ:Boolean = false;
      
      private var isT:Boolean = false;
      
      private var _monkey:MovieClip;
      
      public function MonkeyKongfu()
      {
         super();
      }
      
      private function etenterHandler(e:Event) : void
      {
         var tempM:MovieClip = e.currentTarget as MovieClip;
         var tempmm:MovieClip = tempM.parent.parent as MovieClip;
         if(tempM.name == "roke1")
         {
            if(tempM.currentFrame == 2)
            {
               if(tempM.roke1)
               {
                  if(tempM.roke1.currentFrame == 5)
                  {
                     tempM.roke1.gotoAndStop(1);
                     tempM.gotoAndStop(1);
                     tempmm.gotoAndStop(1);
                     tempM.removeEventListener(Event.ENTER_FRAME,etenterHandler);
                     return;
                  }
               }
            }
            return;
         }
         if(tempM.currentFrame == 2)
         {
            if(tempM.roke)
            {
               if(tempM.roke.currentFrame == 5)
               {
                  tempM.roke.gotoAndStop(1);
                  tempM.gotoAndStop(1);
                  tempmm.gotoAndStop(1);
                  tempM.removeEventListener(Event.ENTER_FRAME,etenterHandler);
               }
            }
         }
      }
      
      public function show() : void
      {
         sc = _sound.play(0,999);
         _mainUI.board_mc.visible = true;
         LevelManager.appLevel.addChild(_mainUI);
         _closeBtn = _mainUI.closeBtn;
         _closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      public function destroy() : void
      {
         if(sc)
         {
            sc.stop();
         }
         _time.stop();
         _mainUI.removeEventListener(Event.ENTER_FRAME,eventHandler);
         DisplayUtil.removeForParent(_mainUI);
         removeAdd();
         _mainUI = null;
         _time = null;
         _sound = null;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function gameWin() : void
      {
         hide();
         TasksManager.complete(402,0);
      }
      
      private function rokeDown(e:MouseEvent) : void
      {
         MovieClip(e.currentTarget).gotoAndStop(2);
         e.currentTarget.addEventListener(Event.ENTER_FRAME,etenterHandler);
      }
      
      private function clickHandler(e:MouseEvent) : void
      {
         _mainUI.board_mc.visible = false;
         _mainUI.addEventListener(Event.ENTER_FRAME,eventHandler);
         addTimer();
      }
      
      private function addTimer() : void
      {
         _time = new Timer(1000,30);
         _time.start();
         _time.addEventListener(TimerEvent.TIMER,timerHandler);
         _time.addEventListener(TimerEvent.TIMER_COMPLETE,timerComHandler);
      }
      
      private function removeAdd() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _roke2.roke.roke.removeEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke1.roke.roke.removeEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke3.roke.roke.removeEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke4.roke.roke1.removeEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _clamBtn.removeEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         _time.stop();
         _time.removeEventListener(TimerEvent.TIMER,timerHandler);
         _time.removeEventListener(TimerEvent.TIMER_COMPLETE,timerComHandler);
         _mainUI.removeEventListener(Event.ENTER_FRAME,eventHandler);
      }
      
      private function timerComHandler(event:TimerEvent) : void
      {
         gameWin();
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         if(sc)
         {
            sc.stop();
         }
         if(_time)
         {
            _time.stop();
            _time = new Timer(1000,30);
            _timeInt = 29;
            _timeTxt.text = "30";
         }
         if(_clambar)
         {
            _clambar.bar.gotoAndStop(1);
         }
         _mainUI.removeEventListener(Event.ENTER_FRAME,eventHandler);
         DisplayUtil.removeForParent(_mainUI,false);
      }
      
      private function timerHandler(event:TimerEvent) : void
      {
         _timeTxt.text = _timeInt.toString();
         --_timeInt;
         if(isJ)
         {
            if(jint >= 5)
            {
               gameOver();
            }
            ++jint;
         }
         fra = _clambar.bar.currentFrame;
         _clambar.bar.gotoAndStop(fra + 7);
         rondamInt = Math.random() * 60;
         if(rondamInt < 5)
         {
            if(_roke1.currentFrame == 1)
            {
               _roke1.gotoAndPlay(2);
            }
         }
         if(rondamInt < 10 && rondamInt > 5)
         {
            if(_roke2.currentFrame == 1)
            {
               _roke2.gotoAndPlay(2);
            }
         }
         if(rondamInt < 15 && rondamInt > 10)
         {
            if(_roke3.currentFrame == 1)
            {
               _roke3.gotoAndPlay(2);
            }
         }
         if(rondamInt < 20 && rondamInt > 15)
         {
            trace("_roke4.currentFrame==1:" + _roke4.currentFrame);
            if(_roke4.currentFrame == 1)
            {
               _roke4.gotoAndPlay(2);
            }
         }
      }
      
      private function hitMonkey() : void
      {
         _clambar.bar.gotoAndStop(fra + 4);
         if(_monkey)
         {
            if(_monkey.currentFrame != 77)
            {
               _monkey.gotoAndStop(77);
            }
         }
      }
      
      private function mouseDownHandler(e:MouseEvent) : void
      {
         isT = true;
         fra = _clambar.bar.currentFrame;
         _clambar.bar.gotoAndStop(fra - 2);
      }
      
      private function gameOver() : void
      {
         hide();
         NpcTipDialog.show("非常抱歉，你的小火猴没能通过考验。继续努力哦，克服了急躁，才能更快的进步。",null,NpcTipDialog.GUARD);
      }
      
      private function eventHandler(e:Event) : void
      {
         fra = _clambar.bar.currentFrame;
         if(fra > 144)
         {
            isJ = true;
         }
         else
         {
            isJ = false;
            jint = 0;
         }
         if(_roke1.currentFrame == 55 || _roke2.currentFrame == 55 || _roke3.currentFrame == 55 || _roke4.currentFrame == 39)
         {
            hitMonkey();
         }
      }
      
      public function setup() : void
      {
         _sound = new monkey_BackSound();
         _mainUI = new monkey_MainUI();
         _timeTxt = _mainUI["time_txt"];
         _clambar = _mainUI["clamBar_mc"];
         _clamBtn = _mainUI["clam_btn"];
         _monkey = _mainUI["MonkeyUI"];
         _monkey.stop();
         _timeTxt.text = "0";
         _clambar.bar.gotoAndStop(1);
         _roke1 = _mainUI.rokeUI["roke1"];
         _roke2 = _mainUI.rokeUI["roke2"];
         _roke3 = _mainUI.rokeUI["roke3"];
         _roke4 = _mainUI.rokeUI["roke4"];
         _roke2.roke.roke.addEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke1.roke.roke.addEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke3.roke.roke.addEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke4.roke.roke1.addEventListener(MouseEvent.MOUSE_DOWN,rokeDown);
         _roke1.roke.roke.useHandCursor = _roke4.roke.roke1.useHandCursor = _roke2.roke.roke.useHandCursor = _roke3.roke.roke.useHandCursor = false;
         _roke1.gotoAndStop(1);
         _roke2.gotoAndStop(1);
         _roke3.gotoAndStop(1);
         _roke4.gotoAndStop(1);
         _clamBtn.addEventListener(MouseEvent.MOUSE_DOWN,mouseDownHandler);
         _mainUI.board_mc.yes_btn.addEventListener(MouseEvent.CLICK,clickHandler);
      }
   }
}


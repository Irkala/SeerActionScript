package com.robot.module.game
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.Timer;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class FishToothGame extends Sprite implements IModule
   {
      
      private var mainUI:Sprite;
      
      private var desPanel:MovieClip;
      
      private var perTxt:TextField;
      
      private var oldX:Number;
      
      private var startBtn:SimpleButton;
      
      private var bgMC:MovieClip;
      
      private var posList:Array = ["240|240","336|230","454|210","580|228","680|244","262|335","356|400","470|422","578|396","660|342"];
      
      private var bugTimer:Timer;
      
      private var isShot:Boolean = false;
      
      private var timer:Timer;
      
      private var bottle:MovieClip;
      
      private var closeBtn:SimpleButton;
      
      private var bugArray:Array = [];
      
      private var barMC:MovieClip;
      
      private var fishMC:MovieClip;
      
      private var p:Number;
      
      private var perMC:MovieClip;
      
      private var hitMC:MovieClip;
      
      private var clearNum:uint = 0;
      
      public function FishToothGame()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         barMC["time_txt"].text = "25";
         clearNum = 0;
         barMC["score_txt"].text = clearNum.toString();
         bugArray = [];
         p = 1;
         DisplayUtil.align(desPanel,null,AlignType.MIDDLE_CENTER);
         mainUI.addChild(desPanel);
         perMC.x = oldX;
         perTxt.text = "0%";
         LevelManager.gameLevel.addChild(mainUI);
      }
      
      private function closeGame(event:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         timer = new Timer(1000,25);
         timer.addEventListener(TimerEvent.TIMER,onTimer);
         timer.addEventListener(TimerEvent.TIMER_COMPLETE,onTimerComp);
         bugTimer = new Timer(1000);
         bugTimer.addEventListener(TimerEvent.TIMER,onBugTimer);
         mainUI = new Sprite();
         bgMC = new game_fishToothBg();
         barMC = new game_fishToothBar();
         barMC.y = MainManager.getStageHeight() - barMC.height;
         mainUI.addChild(bgMC);
         mainUI.addChild(barMC);
         perMC = barMC["perMC"];
         perTxt = barMC["per_txt"];
         perTxt.text = "0%";
         oldX = perMC.x;
         desPanel = new game_fishToothDesPanel();
         startBtn = desPanel["okBtn"];
         startBtn.addEventListener(MouseEvent.CLICK,startHandler);
         fishMC = bgMC["fishMC"];
         bottle = new game_fishToothBottle();
         hitMC = bottle["hitMC"];
         bottle.gotoAndStop(1);
         bottle.addEventListener(MouseEvent.CLICK,clickBottle);
         closeBtn = bgMC["close_btn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeGame);
      }
      
      private function startHandler(event:MouseEvent) : void
      {
         bottle.startDrag(true);
         isShot = false;
         DisplayUtil.removeForParent(desPanel);
         timer.start();
         mainUI.addChild(bottle);
         bugTimer.start();
         mainUI.addChild(closeBtn);
      }
      
      private function gameWin() : void
      {
         hide();
         TasksManager.complete(407,0,function(b:Boolean):void
         {
         });
      }
      
      private function onTimer(event:TimerEvent) : void
      {
         barMC["time_txt"].text = (timer.repeatCount - timer.currentCount).toString();
      }
      
      private function onBugTimer(event:TimerEvent) : void
      {
         if(bugArray.length > 6)
         {
            return;
         }
         var bug:MovieClip = new game_fishToothBug();
         var str:String = posList[Math.floor(Math.random() * posList.length)];
         var arr:Array = str.split("|");
         bug.x = arr[0];
         bug.y = arr[1];
         while(checkNewPos(bug))
         {
            str = posList[Math.floor(Math.random() * posList.length)];
            arr = str.split("|");
            bug.x = arr[0];
            bug.y = arr[1];
         }
         bugArray.push(bug);
         bgMC.addChild(bug);
      }
      
      private function checkNewPos(mc:MovieClip) : Boolean
      {
         var i:MovieClip = null;
         var b:Boolean = false;
         for each(i in bugArray)
         {
            if(mc.hitTestObject(i))
            {
               b = true;
               break;
            }
         }
         return b;
      }
      
      private function gameLost() : void
      {
         hide();
         Alarm.show("利牙鱼的蛀牙菌好像还是有很多哦，再来试试看吧！");
      }
      
      private function onFishEnter(event:Event) : void
      {
         p += 0.2;
         fishMC.y = -158 + Math.sin(p) * 10;
      }
      
      public function hide() : void
      {
         var i:MovieClip = null;
         for each(i in bugArray)
         {
            DisplayUtil.removeForParent(i);
         }
         DisplayUtil.removeForParent(mainUI,false);
         DisplayUtil.removeForParent(bottle,false);
         timer.stop();
         timer.reset();
         bugTimer.stop();
         bottle.stopDrag();
      }
      
      private function onTimerComp(event:TimerEvent) : void
      {
         if(clearNum < 25)
         {
            gameLost();
         }
      }
      
      private function checkHit() : void
      {
         var i:MovieClip = null;
         var per:Number = NaN;
         var p:Point = null;
         var index:int = 0;
         for each(i in bugArray)
         {
            p = i.localToGlobal(new Point());
            if(hitMC.hitTestPoint(p.x,p.y,true))
            {
               index = bugArray.indexOf(i);
               bugArray.splice(index,1);
               DisplayUtil.removeForParent(i);
               ++clearNum;
               break;
            }
         }
         barMC["score_txt"].text = clearNum.toString();
         per = clearNum / 15;
         perTxt.text = Math.floor(per * 100) + "%";
         perMC.x = oldX - perMC.width * per;
         trace("clearNum:",clearNum);
         if(clearNum >= 15)
         {
            gameWin();
         }
      }
      
      private function clickBottle(event:MouseEvent) : void
      {
         if(isShot)
         {
            return;
         }
         bottle.gotoAndPlay(2);
         isShot = true;
         bottle.addEventListener(Event.ENTER_FRAME,function(e:Event):void
         {
            if(bottle.currentFrame == bottle.totalFrames)
            {
               bottle.gotoAndStop(1);
               bottle.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               isShot = false;
            }
         });
         checkHit();
      }
      
      public function destroy() : void
      {
         hide();
         bottle.removeEventListener(MouseEvent.CLICK,clickBottle);
         timer.removeEventListener(TimerEvent.TIMER,onTimer);
         timer.removeEventListener(TimerEvent.TIMER_COMPLETE,onTimerComp);
         bugTimer.removeEventListener(TimerEvent.TIMER,onBugTimer);
         startBtn.removeEventListener(MouseEvent.CLICK,startHandler);
         startBtn = null;
         timer = null;
         bugTimer = null;
         barMC = null;
         bgMC = null;
         mainUI = null;
         bottle = null;
         hitMC = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,closeGame);
         closeBtn = null;
      }
   }
}


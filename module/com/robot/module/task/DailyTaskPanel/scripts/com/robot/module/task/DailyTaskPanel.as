package com.robot.module.task
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.task.dailyTask.icon.*;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Shape;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import gs.TweenLite;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class DailyTaskPanel extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var CURRENT_NUM:uint = 0;
      
      private var mainUI:MovieClip;
      
      private var iconContainer:Sprite;
      
      private var taskIcon:BaseDailyTaskIcon;
      
      private var iconArray:Array = [];
      
      private var prevBtn:SimpleButton;
      
      private var SHOW_NUM:uint = 5;
      
      private var giveUpBtn:SimpleButton;
      
      private var petPrev:Sprite;
      
      private var acceptBtn:SimpleButton;
      
      private var nextBtn:SimpleButton;
      
      private var SCROLL_NUM:uint;
      
      public function DailyTaskPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function canGiveUp() : void
      {
         acceptBtn.mouseEnabled = false;
         acceptBtn.filters = [ColorFilter.setGrayscale()];
         giveUpBtn.mouseEnabled = true;
         giveUpBtn.filters = [];
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      private function initTaskIcon() : void
      {
         var i:BaseDailyTaskIcon = null;
         mainUI.addChild(iconContainer);
         var mask:Shape = new Shape();
         mask.graphics.beginFill(0);
         mask.graphics.drawRect(55,75,335,96);
         mask.graphics.endFill();
         mainUI.addChild(mask);
         iconContainer.mask = mask;
         var count:uint = 0;
         for each(i in iconArray)
         {
            i.x = 60 + (i.width + 6) * count;
            i.y = 96;
            iconContainer.addChild(i);
            i.addEventListener(BaseDailyTaskIcon.CHOOSE,onChooseTask);
            ToolTipManager.add(i,i.des);
            i.checkStatus();
            count++;
         }
      }
      
      private function onChooseTask(event:Event) : void
      {
         var icon:BaseDailyTaskIcon = event.currentTarget as BaseDailyTaskIcon;
         if(icon == taskIcon)
         {
            return;
         }
         if(taskIcon)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(taskIcon.petID),function():void
            {
            });
            taskIcon.hide();
         }
         DisplayUtil.removeAllChild(petPrev);
         taskIcon = icon;
         taskIcon.show();
         ResourceManager.getResource(ClientConfig.getPetSwfPath(taskIcon.petID),onShowComplete,"pet");
         checkTaskStatus();
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
         if(taskIcon)
         {
            taskIcon.show();
         }
      }
      
      private function fiinish() : void
      {
         acceptBtn.mouseEnabled = false;
         acceptBtn.filters = [ColorFilter.setGrayscale()];
         giveUpBtn.mouseEnabled = false;
         giveUpBtn.filters = [ColorFilter.setGrayscale()];
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         var _showMc:MovieClip = null;
         var rect:Rectangle = null;
         var bmpData:BitmapData = null;
         var matrix:Matrix = null;
         var bmp:Bitmap = null;
         var S:uint = 3.5;
         _showMc = o as MovieClip;
         if(_showMc)
         {
            _showMc.gotoAndStop("rightdown");
            _showMc.addEventListener(Event.ENTER_FRAME,function():void
            {
               var mc:MovieClip = _showMc.getChildAt(0) as MovieClip;
               if(mc)
               {
                  mc.gotoAndStop(1);
                  _showMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               }
            });
            _showMc.scaleX = S;
            _showMc.scaleY = S;
            rect = _showMc.getRect(_showMc);
            bmpData = new BitmapData(_showMc.width,_showMc.height,true,0);
            matrix = new Matrix();
            matrix.scale(S,S);
            matrix.translate(-rect.x * S,-rect.y * S);
            bmpData.draw(_showMc,matrix);
            bmp = new Bitmap(bmpData,"auto",true);
            while(bmp.width > 120 || bmp.height > 160)
            {
               bmp.scaleX -= 0.5;
               bmp.scaleY -= 0.5;
            }
            bmp.x = -bmp.width / 2;
            bmp.y = -bmp.height;
            petPrev.addChild(bmp);
         }
      }
      
      private function onCompleteTask(event:DynamicEvent) : void
      {
         var i:BaseDailyTaskIcon = null;
         var id:uint = uint(event.paramObject);
         for each(i in iconArray)
         {
            if(i.taskID == id)
            {
               if(i == taskIcon)
               {
                  fiinish();
               }
               i.complete();
               break;
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function acceptHandler(event:MouseEvent) : void
      {
         TasksManager.accept(taskIcon.taskID,function(b:Boolean):void
         {
            if(b)
            {
               taskIcon.accept();
               Alarm.show("成功接受每日任务：" + TextFormatUtil.getRedTxt(taskIcon.des));
               canGiveUp();
            }
            else
            {
               Alarm.show("任务接受失败，请稍后再试！");
            }
         });
      }
      
      private function giveUpHandler(event:MouseEvent) : void
      {
         Answer.show("你确定要放弃该任务吗？",function():void
         {
            TasksManager.quit(taskIcon.taskID,function(b:Boolean):void
            {
               if(b)
               {
                  taskIcon.quit();
                  Alarm.show("你已经放弃了" + TextFormatUtil.getRedTxt(taskIcon.des));
                  canAccept();
               }
               else
               {
                  Alarm.show("放弃任务失败，请稍后再试！");
               }
            });
         });
      }
      
      private function prevHandler(event:MouseEvent) : void
      {
         var icon:BaseDailyTaskIcon = null;
         if(CURRENT_NUM > 0)
         {
            --CURRENT_NUM;
            icon = iconArray[0] as BaseDailyTaskIcon;
            TweenLite.to(iconContainer,0.5,{"x":-(icon.width + 6) * CURRENT_NUM});
         }
      }
      
      private function canAccept() : void
      {
         acceptBtn.mouseEnabled = true;
         acceptBtn.filters = [];
         giveUpBtn.mouseEnabled = false;
         giveUpBtn.filters = [ColorFilter.setGrayscale()];
      }
      
      private function nextHandler(event:MouseEvent) : void
      {
         var icon:BaseDailyTaskIcon = null;
         if(CURRENT_NUM < SCROLL_NUM)
         {
            ++CURRENT_NUM;
            icon = iconArray[0] as BaseDailyTaskIcon;
            TweenLite.to(iconContainer,0.5,{"x":-(icon.width + 6) * CURRENT_NUM});
         }
      }
      
      public function destroy() : void
      {
         var i:BaseDailyTaskIcon = null;
         EventManager.removeEventListener(RobotEvent.DAILY_TASK_COMPLETE,onCompleteTask);
         hide();
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         acceptBtn.removeEventListener(MouseEvent.CLICK,acceptHandler);
         giveUpBtn.removeEventListener(MouseEvent.CLICK,giveUpHandler);
         closeBtn = null;
         acceptBtn = null;
         giveUpBtn = null;
         mainUI = null;
         for each(i in iconArray)
         {
            i.removeEventListener(BaseDailyTaskIcon.CHOOSE,onChooseTask);
            ToolTipManager.remove(i);
            i.destroy();
         }
         iconArray = [];
      }
      
      public function setup() : void
      {
         iconContainer = new Sprite();
         mainUI = new ui_DailyTaskPanel();
         closeBtn = mainUI["closeBtn"];
         acceptBtn = mainUI["acceptBtn"];
         giveUpBtn = mainUI["giveUpBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         acceptBtn.addEventListener(MouseEvent.CLICK,acceptHandler);
         giveUpBtn.addEventListener(MouseEvent.CLICK,giveUpHandler);
         giveUpBtn.mouseEnabled = false;
         acceptBtn.mouseEnabled = false;
         prevBtn = mainUI["prevBtn"];
         nextBtn = mainUI["nextBtn"];
         prevBtn.addEventListener(MouseEvent.CLICK,prevHandler);
         nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);
         petPrev = new Sprite();
         petPrev.x = 95;
         petPrev.y = 337;
         mainUI.addChild(petPrev);
         iconArray.push(new DailyTaskIcon_407(mainUI),new DailyTaskIcon_406(mainUI),new DailyTaskIcon_401(mainUI),new DailyTaskIcon_402(mainUI),new DailyTaskIcon_403(mainUI),new DailyTaskIcon_404(mainUI),new DailyTaskIcon_405(mainUI));
         SCROLL_NUM = iconArray.length - SHOW_NUM;
         initTaskIcon();
         var icon:BaseDailyTaskIcon = iconArray[0] as BaseDailyTaskIcon;
         icon.choose();
         EventManager.addEventListener(RobotEvent.DAILY_TASK_COMPLETE,onCompleteTask);
      }
      
      private function checkTaskStatus() : void
      {
         trace(taskIcon.taskID);
         if(TasksManager.getTaskStatus(taskIcon.taskID) == TasksManager.UN_ACCEPT)
         {
            taskIcon.quit();
            canAccept();
         }
         else if(TasksManager.getTaskStatus(taskIcon.taskID) == TasksManager.COMPLETE)
         {
            taskIcon.complete();
            fiinish();
         }
         else
         {
            taskIcon.accept();
            canGiveUp();
         }
      }
   }
}


package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_64;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_64 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _iconMc:Sprite;
      
      private var _closeBtn:SimpleButton;
      
      private var _iconArr:Array = [];
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_64()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _introTxt = null;
         _closeBtn = null;
         _iconMc = null;
         _mainUI = null;
      }
      
      public function hide() : void
      {
         removeIcon();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         _mainUI.addChild(_iconMc);
         _iconMc.x = 60;
         _iconMc.y = 135;
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      public function setup() : void
      {
         _mainUI = new Main_Panel_64();
         _iconMc = new Sprite();
         _introTxt = _mainUI["txt"];
         _closeBtn = _mainUI["close_btn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      private function removeIcon() : void
      {
         while(_iconMc.numChildren > 0)
         {
            _iconMc.removeChildAt(0);
         }
      }
      
      private function taskStatus(arr:Array) : void
      {
         var infoStr:String = "";
         if(!arr[0])
         {
            infoStr = "    锻造奖杯的材料就在<font color=\'#ff0000\'>斯诺岩洞</font>里，你可以用头部射击来锻造！<font color=\'#ff0000\'>（记住不要用力过多哦！）</font>";
            changeTaskInfo(infoStr,[Material,"这个就是锻造奖杯的材料"]);
            return;
         }
         if(!arr[1])
         {
            infoStr = "    奖杯的样子已经出来咯，现在就差最后上色啦！族长说的棱镜应该就是右上角那个闪闪发光的东西吧！<font color=\'#ff0000\'>（先点击棱镜来改变它的颜色，再利用头部射击打它！）</font>";
            changeTaskInfo(infoStr,[SetColor,"先调整它的角度，再利用头部射击去打它吧！"]);
            return;
         }
         if(!arr[2])
         {
            infoStr = "    哇哦！第一次制作奖杯很不错哦！嘿嘿，快把制作好的奖杯给族长看看吧！";
            changeTaskInfo(infoStr,[Dalu,"我在斯诺星上呢"]);
            return;
         }
      }
      
      private function changeTaskInfo(str:String, taskIcons:Array) : void
      {
         removeIcon();
         _introTxt.htmlText = str;
         var _icon:SimpleButton = new (taskIcons[0] as Class)() as SimpleButton;
         _icon.x = 30;
         _iconMc.addChild(_icon);
         ToolTipManager.add(_icon,taskIcons[1]);
         _iconMc.x = (_mainUI.width - _iconMc.width) / 2 - 20;
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(TaskController_64.TASK_ID,taskStatus);
      }
   }
}


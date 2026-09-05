package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_133;
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
   public class TaskPanel_133 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      private var _iconMc:Sprite;
      
      public function TaskPanel_133()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function tasksStates(arr:Array) : void
      {
         var infoStr:String = "";
         if(!arr[0])
         {
            infoStr = "    我们在<font color=\'#ff0000\'>遗忘领域</font>里竟然看到了一个奇怪的赛尔！他到底是谁呢？快去问问他吧……";
            changeTaskInfo(infoStr,[{
               "icon":task_133_0,
               "state":arr[0],
               "tip":"快点击他问问吧"
            }]);
            return;
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            infoStr = "    根据史空说的琴谱点击铃铛草吧！他似乎相当的入迷陶醉哦！";
            changeTaskInfo(infoStr,[{
               "icon":task_133_1,
               "state":arr[1],
               "tip":"根据琴谱来弹奏吧"
            }]);
            return;
         }
         if(arr[1])
         {
            infoStr = "    月影花园是最美丽的一个地方，这里曾经有着格林和布鲁的故事！快带史空去那里看看吧……";
            changeTaskInfo(infoStr,[{
               "icon":task_133_2,
               "state":arr[2],
               "tip":"快去塔克星来到月影花园吧"
            }]);
            return;
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function changeTaskInfo(str:String, tasks:Array) : void
      {
         var i:uint = 0;
         var _icon:MovieClip = null;
         removeIcon();
         _introTxt.htmlText = str;
         if(tasks)
         {
            for(i = 0; i < tasks.length; i++)
            {
               _icon = new (tasks[i].icon as Class)() as MovieClip;
               _icon.x = 10 + (_icon.width + 5) * i;
               _iconMc.addChild(_icon);
               ToolTipManager.add(_icon,tasks[i].tip);
               if(tasks[i].state)
               {
               }
               _iconMc.x = (_mainUI.width - _iconMc.width) / 2 - 20;
            }
         }
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(TaskController_133.TASK_ID,tasksStates);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         _mainUI.addChild(_iconMc);
         _iconMc.x = 20;
         _iconMc.y = 135;
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      private function removeIcon() : void
      {
         while(_iconMc.numChildren > 0)
         {
            _iconMc.removeChildAt(0);
         }
      }
      
      private function onClose(e:MouseEvent) : void
      {
         this.hide();
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new MainPanel_133();
         _introTxt = _mainUI["task_txt"];
         _closeBtn = _mainUI["close_btn"];
         _iconMc = new Sprite();
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
      }
   }
}


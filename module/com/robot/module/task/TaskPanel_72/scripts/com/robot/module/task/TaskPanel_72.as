package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_72;
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
   public class TaskPanel_72 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _iconMc:Sprite;
      
      private var _closeBtn:SimpleButton;
      
      private var _iconArr:Array = [];
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_72()
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
         _iconMc.y = 130;
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      public function setup() : void
      {
         _mainUI = new Task72Panel();
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
            infoStr = "    使用船长身后的<font color=\'#ff0000\'>探测仪</font>找到飞船残骸区。那里很危险请做好准备。";
            changeTaskInfo(infoStr,[{
               "icon":remains0,
               "state":arr[0],
               "tip":"使用探测仪找到飞船残骸区"
            }]);
            return;
         }
         if(!arr[1])
         {
            infoStr = "    在露希欧星域<font color=\'#ff0000\'>飞船残骸区</font>找到相关线索，并寻回贾斯汀站长的核心芯片。";
            changeTaskInfo(infoStr,[{
               "icon":remains0,
               "state":arr[0],
               "tip":"使用探测仪找到飞船残骸区"
            },{
               "icon":remains1,
               "state":arr[1],
               "tip":"找到贾斯汀的残骸"
            }]);
            return;
         }
         if(!arr[2])
         {
            infoStr = "    在这块区域继续搜寻贾斯汀站长的核心芯片，越快越好。";
            changeTaskInfo(infoStr,[{
               "icon":remains0,
               "state":arr[0],
               "tip":"使用探测仪找到飞船残骸区"
            },{
               "icon":remains1,
               "state":arr[1],
               "tip":"找到贾斯汀的残骸"
            },{
               "icon":remains2,
               "state":arr[2],
               "tip":"找到贾斯汀的残骸"
            }]);
            return;
         }
         if(!arr[3])
         {
            infoStr = "    迪恩留下了核心芯片后扬长而去，这似乎是赛尔用的核心芯片，你决定先把它带回赛尔号给船长。";
            changeTaskInfo(infoStr,[{
               "icon":remains0,
               "state":arr[0],
               "tip":"使用探测仪找到飞船残骸区"
            },{
               "icon":remains1,
               "state":arr[1],
               "tip":"找到贾斯汀的残骸"
            },{
               "icon":remains2,
               "state":arr[2],
               "tip":"找到贾斯汀的残骸"
            },{
               "icon":shipper_mc,
               "state":arr[3],
               "tip":"把核心芯片带给船长"
            }]);
            return;
         }
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
               _icon.scaleX = 0.95 - tasks.length * 0.1;
               _icon.scaleY = 0.95 - tasks.length * 0.1;
               _icon.x = 15 + (_icon.width + 5) * i;
               _iconMc.addChild(_icon);
               ToolTipManager.add(_icon,tasks[i].tip);
               if(!tasks[i].state)
               {
                  _icon["finish_mc"].visible = false;
               }
               else
               {
                  _icon["finish_mc"].visible = true;
               }
               _iconMc.x = (_mainUI.width - _iconMc.width) / 2 - 20;
            }
         }
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(TaskController_72.TASK_ID,taskStatus);
      }
   }
}


package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_98;
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
   public class TaskPanel_98 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      private var _iconMc:Sprite;
      
      public function TaskPanel_98()
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
         if(!arr[2])
         {
            infoStr = "    那个背影是谁？是谁闯入了赛尔号！快跟上前去看个究竟吧！难道这又是海盗的阴谋？他好像朝<font color=\'#ff0000\'>飞船走廊</font>方向走去！";
            changeTaskInfo(infoStr,[{
               "icon":Icon98_0,
               "state":arr[1],
               "tip":"嘿嘿！就你也想追上我？"
            }]);
            return;
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            infoStr = "    可恶的艾里逊竟然大言不惭！！看我们不狠狠收拾你！要知道我们可是全副武装过了！竟然敢小瞧我们！<font color=\'#ff0000\'>（快点击艾里逊进行对战吧！）</font>";
            changeTaskInfo(infoStr,[{
               "icon":Icon98_1,
               "state":arr[2],
               "tip":"我就在动力室等你！你敢来吗？"
            }]);
            return;
         }
         if(Boolean(arr[4]) && !arr[5])
         {
            infoStr = "    收拾了那两个家伙！这下尼布就安全咯！快去告诉它吧！精灵是我们伙伴！我们又怎么能够允许它受伤呢！";
            changeTaskInfo(infoStr,[{
               "icon":Icon98_2,
               "state":arr[2],
               "tip":"我在实验室养伤"
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
         TasksManager.getProStatusList(TaskController_98.TASK_ID,tasksStates);
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
         _mainUI = new MainPanel_98();
         _introTxt = _mainUI["task_txt"];
         _closeBtn = _mainUI["close_btn"];
         _iconMc = new Sprite();
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
      }
   }
}


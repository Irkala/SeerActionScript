package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_79;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.utils.TextFormatUtil;
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
   public class TaskPanel_79 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _txt:TextField;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      public function TaskPanel_79()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         TasksManager.getProStatusList(TaskController_79.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _tip_mc.gotoAndStop(1);
               _txt.htmlText = "    与哈莫雷特相似的精灵电波应该就在" + TextFormatUtil.getRedTxt("塔克星") + "上！快去卡兰星系的" + TextFormatUtil.getRedTxt("尼古尔星") + "上找哈莫雷特一起去吧！";
               ToolTipManager.add(_tip_mc,"小个子，我就在卡兰星系的尼古尔星球上呢！");
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _tip_mc.gotoAndStop(2);
               _txt.htmlText = "    哈莫雷特的族人到底在哪里呢？快用" + TextFormatUtil.getRedTxt("精灵探测仪") + "来测绘一下它的大致方位吧！";
               ToolTipManager.add(_tip_mc,"快启动精灵探测仪吧！");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    这应该是哈莫的族人啊！但是它为什么攻击哈莫呢？这到底是怎么一回事？快把哈莫救出来吧！" + TextFormatUtil.getRedTxt("（点击哈莫雷特）");
               ToolTipManager.add(_tip_mc,"快点击哈莫雷特");
            }
         });
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         ToolTipManager.remove(_tip_mc);
         _tip_mc = null;
         _close_btn = null;
         mainUI = null;
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI_79();
         _close_btn = mainUI["close_btn"];
         _txt = mainUI["txt"];
         _tip_mc = mainUI["tip_mc"];
         _tip_mc.gotoAndStop(1);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


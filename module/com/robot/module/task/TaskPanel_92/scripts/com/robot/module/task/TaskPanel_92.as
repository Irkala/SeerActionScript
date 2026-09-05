package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_92;
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
   public class TaskPanel_92 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _txt:TextField;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      public function TaskPanel_92()
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
         TasksManager.getProStatusList(TaskController_92.TASK_ID,function(arr:Array):void
         {
            if(!arr[0] && !arr[1])
            {
               _tip_mc.gotoAndStop(1);
               _txt.htmlText = "    " + TextFormatUtil.getRedTxt("茜茜") + "正在" + TextFormatUtil.getRedTxt("地下室") + "里解读存储芯片，船长希望你先去那里协助她！" + TextFormatUtil.getRedTxt("（地下室就在机械室的左上角）");
               ToolTipManager.add(_tip_mc,"茜茜正在机械室的地下室里等你呢！");
            }
            else if(Boolean(arr[0]) && !arr[2])
            {
               _tip_mc.gotoAndStop(2);
               _txt.htmlText = "    与" + TextFormatUtil.getRedTxt("雷蒙教官") + "交谈，找到一种妥善的方案来唤醒贾斯汀站长";
               ToolTipManager.add(_tip_mc,"与雷蒙交谈");
            }
            else if(Boolean(arr[1]) && !arr[3])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    与" + TextFormatUtil.getRedTxt("肖恩博士") + "交谈，找到一种妥善的方案来唤醒贾斯汀站长";
               ToolTipManager.add(_tip_mc,"与肖恩交谈");
            }
            else if(Boolean(arr[2]) && !arr[4])
            {
               _tip_mc.gotoAndStop(4);
               _txt.htmlText = "    启动机械臂支架边上的" + TextFormatUtil.getRedTxt("能量屏障发生器。");
               ToolTipManager.add(_tip_mc,"安装并启动能量屏障发生器");
            }
            else if(Boolean(arr[3]) && !arr[5])
            {
               _tip_mc.gotoAndStop(5);
               _txt.htmlText = "    带上你的" + TextFormatUtil.getRedTxt("NoNo") + "来和肖恩博士对话";
               ToolTipManager.add(_tip_mc,"带上NoNo和肖恩博士对话");
            }
            else if(Boolean(arr[4]) && Boolean(!arr[6]) || Boolean(arr[5]) && Boolean(!arr[6]))
            {
               _tip_mc.gotoAndStop(6);
               _txt.htmlText = "    做好万全的准备，启动" + TextFormatUtil.getRedTxt("控制台") + "唤醒贾斯汀站长";
               ToolTipManager.add(_tip_mc,"启动控制台");
            }
            else if(Boolean(arr[6]) && !arr[7])
            {
               _tip_mc.gotoAndStop(7);
               _txt.htmlText = "    贾斯汀站长终于苏醒了，你迫不及待得要与归来的站长进行交谈。";
               ToolTipManager.add(_tip_mc,"与站长交谈");
            }
            else if(Boolean(arr[7]) && !arr[8])
            {
               _tip_mc.gotoAndStop(8);
               _txt.htmlText = "    贾斯汀站长已经回来了，不过" + TextFormatUtil.getRedTxt("船长") + "似乎还有事情要对你说";
               ToolTipManager.add(_tip_mc,"与船长交谈");
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
         mainUI = new TaskPanelUI_92();
         _close_btn = mainUI["close_btn"];
         _txt = mainUI["txt"];
         _tip_mc = mainUI["tip"];
         _tip_mc.gotoAndStop(1);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


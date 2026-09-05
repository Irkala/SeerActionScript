package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_75;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
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
   public class TaskPanel_75 extends Sprite implements IModule
   {
      
      private var _tip_0:MovieClip;
      
      private var _tip_1:MovieClip;
      
      private var _tip_2:MovieClip;
      
      private var _tip_3:MovieClip;
      
      private var _tip_4:MovieClip;
      
      private var mainUI:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      private var _txt:TextField;
      
      public function TaskPanel_75()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
         ToolTipManager.remove(_tip_mc);
         ToolTipManager.remove(_tip_0);
         ToolTipManager.remove(_tip_1);
         ToolTipManager.remove(_tip_2);
         ToolTipManager.remove(_tip_3);
         ToolTipManager.remove(_tip_4);
      }
      
      public function show() : void
      {
         TasksManager.getProStatusList(TaskController_75.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _tip_mc.gotoAndStop(1);
               _txt.htmlText = "    失去记忆的哈莫雷特，它正为自己找不到回家的路而犯愁呢！快去" + TextFormatUtil.getRedTxt("露希欧泥潭") + "把这个好消息告诉它吧！";
               ToolTipManager.add(_tip_mc,"我在露希欧泥潭等你的好消息呢！");
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _tip_mc.gotoAndStop(2);
               _txt.htmlText = "    目的地已经锁定，加大马力全速前进！卡兰星系——" + TextFormatUtil.getRedTxt("尼古尔星") + "，我们来咯！";
               ToolTipManager.add(_tip_mc,"快点击地图，向卡兰星系的尼古尔星前进吧！");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    硕大身躯的哈莫雷特依然有一份童心，既然来到了尼古尔星，那就让我们陪它好好玩一次吧！";
               ToolTipManager.add(_tip_mc,"快点点那朵奇怪的云吧！");
            }
            else if(Boolean(arr[2]) && !arr[3])
            {
               _tip_mc.gotoAndStop(4);
               _txt.htmlText = "    这一幕幕的片段到底是这么一回事？哈莫雷特怎么了？快去问问它吧……";
               ToolTipManager.add(_tip_mc,"快去问问哈莫雷特");
            }
            else if(Boolean(arr[3]) && !arr[4])
            {
               _tip_mc.gotoAndStop(5);
               _txt.htmlText = "    快带着哈莫雷特去" + MainManager.actorInfo.nick + "去" + TextFormatUtil.getRedTxt("尼古尔峭壁") + "找那群可恶的家伙！我们一定要帮助哈莫雷特重拾信心！";
               ToolTipManager.add(_tip_mc,"走！带着哈莫雷特一起前往尼古尔峭壁！");
            }
            else if(Boolean(arr[4]) && !arr[5])
            {
               _tip_mc.gotoAndStop(6);
               _txt.htmlText = "    快来布置一下吧！我相信和哈莫体型差不多的投影足以吓跑那群家伙！（根据以下操作，一步步来实行吧。）";
               ToolTipManager.add(_tip_mc,"快使用钻头凿出一个模型吧！");
            }
            else if(Boolean(arr[5]) && !arr[6])
            {
               _tip_mc.visible = false;
               _tip_0.visible = true;
               _tip_1.visible = true;
               _txt.htmlText = "    快来布置一下吧！我相信和哈莫体型差不多的投影足以吓跑那群家伙！（根据以下操作，一步步来实行吧。）";
               ToolTipManager.add(_tip_0,"快使用钻头凿出一个模型吧！");
               ToolTipManager.add(_tip_1,"点击那些植被，这样光线就能投射下来了！");
            }
            else if(Boolean(arr[6]) && !arr[7])
            {
               _tip_mc.visible = false;
               _tip_0.visible = false;
               _tip_1.visible = false;
               _tip_2.visible = true;
               _tip_3.visible = true;
               _tip_4.visible = true;
               _txt.htmlText = "    快来布置一下吧！我相信和哈莫体型差不多的投影足以吓跑那群家伙！（根据以下操作，一步步来实行吧。）";
               ToolTipManager.add(_tip_2,"快使用钻头凿出一个模型吧！");
               ToolTipManager.add(_tip_3,"点击那朵云，这样光线就能投射下来了！");
               ToolTipManager.add(_tip_4,"快用捡起一块小石头朝那个山洞扔一下吧！");
            }
            else if(Boolean(arr[7]) && !arr[8])
            {
               _tip_mc.visible = true;
               _tip_0.visible = false;
               _tip_1.visible = false;
               _tip_2.visible = false;
               _tip_3.visible = false;
               _tip_4.visible = false;
               _txt.htmlText = "    你用你的聪明智慧巧胜了可恶的坏精灵！相信哈莫已经有足够的信心咯！再去鼓励鼓励它吧！（哈莫雷特刚才去" + TextFormatUtil.getRedTxt("尼古尔星了") + "）";
               _tip_mc.gotoAndStop(7);
               ToolTipManager.add(_tip_mc,"快鼓励鼓励哈莫雷特吧！");
            }
         });
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI_75();
         _close_btn = mainUI["close_btn"];
         _txt = mainUI["txt"];
         _tip_mc = mainUI["tip_mc"];
         _tip_0 = mainUI["tip_0"];
         _tip_1 = mainUI["tip_1"];
         _tip_2 = mainUI["tip_2"];
         _tip_3 = mainUI["tip_3"];
         _tip_4 = mainUI["tip_4"];
         _tip_0.visible = false;
         _tip_1.visible = false;
         _tip_2.visible = false;
         _tip_3.visible = false;
         _tip_4.visible = false;
         _tip_mc.gotoAndStop(1);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         _close_btn = null;
         mainUI = null;
         _txt = null;
         _tip_0 = null;
         _tip_1 = null;
         _tip_2 = null;
         _tip_3 = null;
         _tip_4 = null;
      }
   }
}


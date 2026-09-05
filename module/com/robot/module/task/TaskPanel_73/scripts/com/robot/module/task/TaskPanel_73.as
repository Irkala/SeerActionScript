package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_73;
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
   public class TaskPanel_73 extends Sprite implements IModule
   {
      
      private var _tip_0:MovieClip;
      
      private var _tip_1:MovieClip;
      
      private var _tip_2:MovieClip;
      
      private var _tip_3:MovieClip;
      
      private var _tip_4:MovieClip;
      
      private var mainUI:MovieClip;
      
      private var close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      private var _txt:TextField;
      
      public function TaskPanel_73()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function show() : void
      {
         TasksManager.getProStatusList(TaskController_73.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _tip_mc.gotoAndStop(1);
               ToolTipManager.add(_tip_mc,"我正在机械室呢！");
               _txt.htmlText = "迪恩盗取了赛尔号SR-01的图纸和配方，如果想与他们抗衡我们只有加紧对于SR-02的研制！快去和" + TextFormatUtil.getRedTxt("机械室茜茜") + "商讨一下吧！";
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _tip_mc.gotoAndStop(2);
               ToolTipManager.add(_tip_mc,"快点击SR-02研发设计台");
               _txt.htmlText = "海盗随时可能再次攻击赛尔号，我们必须加紧研制SR-02！先去" + TextFormatUtil.getRedTxt("地下室") + "点击" + TextFormatUtil.getRedTxt("SR-02研发设计台") + "绘制一下电子图纸吧！" + TextFormatUtil.getRedTxt("（茜茜的正下方就是地下室的入口哦！）");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _tip_mc.gotoAndStop(3);
               ToolTipManager.add(_tip_mc,"快进入SR-02锻造室进行锻造吧！");
               _txt.htmlText = "已经绘制了SR-02的机械图纸，请点击机器人HELP让它为您介绍一些关于SR-02的融合过程吧。" + TextFormatUtil.getRedTxt("（请点击机器人HELP）");
            }
            else if(Boolean(arr[2]) && !arr[3])
            {
               _tip_mc.gotoAndStop(4);
               ToolTipManager.add(_tip_mc,"找出装置的启动机关");
               _txt.htmlText = "根据机器人HELP的提示，依次来启动SR-02锻造装置吧！机器人HELP：请您先点击SR-02锻造室的开关。";
            }
            else if(Boolean(arr[3]) && !arr[4])
            {
               _txt.htmlText = "根据机器人HELP的提示，依次来启动SR-02锻造装置吧！机器人HELP：闸门已经打开，请您将右上角的LUC金属放入履带内。";
               mainUI.gotoAndStop(2);
            }
            else if(Boolean(arr[4]) && !arr[5])
            {
               _txt.htmlText = "根据机器人HELP的提示，依次来启动SR-02锻造装置吧！机器人HELP：装备上火焰喷射器，用头部射击来加大火力！";
               mainUI.gotoAndStop(3);
            }
         });
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI_73();
         close_btn = mainUI["close_btn"];
         _tip_mc = mainUI["tip_mc"];
         _tip_mc.gotoAndStop(1);
         _txt = mainUI["txt"];
         close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
         mainUI.gotoAndStop(1);
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
         close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         mainUI = null;
         close_btn = null;
         _tip_mc = null;
         _txt = null;
      }
   }
}


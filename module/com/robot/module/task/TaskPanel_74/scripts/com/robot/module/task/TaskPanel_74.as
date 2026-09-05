package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_74;
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
   public class TaskPanel_74 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _txt:TextField;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      public function TaskPanel_74()
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
         TasksManager.getProStatusList(TaskController_74.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _txt.htmlText = "    爱丽丝请你帮她去" + TextFormatUtil.getRedTxt("露希欧星泥潭") + "找到叽里呱啦和唔哩哇啦两兄弟，调停他们的纷争。";
               _tip_mc.gotoAndStop(1);
               ToolTipManager.add(_tip_mc,"露希欧星泥潭去调停两个兄弟之间的纷争。");
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _txt.htmlText = "    唔喱哇啦要你帮忙一起挖开岩壁，找到藏在里面的稀有矿石，记得装上" + TextFormatUtil.getRedTxt("采矿钻头") + "哦";
               _tip_mc.gotoAndStop(2);
               ToolTipManager.add(_tip_mc,"和唔喱哇啦一起挖开岩壁破口");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _txt.htmlText = "    在山洞中发现了很多稀有矿石，你和唔喱哇啦决定一起把" + TextFormatUtil.getRedTxt("矿石") + "搬运会飞船";
               _tip_mc.gotoAndStop(3);
               ToolTipManager.add(_tip_mc,"搬运矿石回飞船");
            }
            else if(Boolean(arr[2]) && !arr[3])
            {
               _txt.htmlText = "    我们似乎惊扰了巨大精灵的休息....不管这么多了，总之先和唔哩哇啦一起" + TextFormatUtil.getRedTxt("制伏") + "它。";
               _tip_mc.gotoAndStop(4);
               ToolTipManager.add(_tip_mc,"制伏巨大的精灵");
            }
            else if(Boolean(arr[3]) && !arr[4])
            {
               _txt.htmlText = "    用" + TextFormatUtil.getRedTxt("通讯器") + "看看他是否知道这只精灵的来历。";
               _tip_mc.gotoAndStop(5);
               ToolTipManager.add(_tip_mc,"使用通讯器与博士取得联系");
            }
            else if(Boolean(arr[4]) && !arr[5])
            {
               _txt.htmlText = "    回到" + TextFormatUtil.getRedTxt("实验室") + "找博士打听神秘精灵的分析情况。";
               _tip_mc.gotoAndStop(6);
               ToolTipManager.add(_tip_mc,"去博士那里了解一下神秘精灵的分析报告");
            }
            else if(Boolean(arr[5]) && !arr[6])
            {
               _txt.htmlText = "    博士已经答应帮失忆的精灵探访家园并且弄清它的来历，你要把这个好消息告诉还在" + TextFormatUtil.getRedTxt("露希欧星泥潭") + "的神秘精灵。";
               _tip_mc.gotoAndStop(7);
               ToolTipManager.add(_tip_mc,"快去告诉神秘精灵那个好消息。");
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
         hide();
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         mainUI = null;
         _close_btn = null;
         _tip_mc = null;
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI_74();
         _close_btn = mainUI["close_btn"];
         _tip_mc = mainUI["tip_mc"];
         _tip_mc.gotoAndStop(1);
         _txt = mainUI["txt"];
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


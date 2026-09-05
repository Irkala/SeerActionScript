package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_81;
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
   public class TaskPanel_81 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _txt:TextField;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      public function TaskPanel_81()
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
         TasksManager.getProStatusList(TaskController_81.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _tip_mc.gotoAndStop(1);
               _txt.htmlText = "    尼古尔星上出现了新精灵的踪迹，快前往那里看看吧！可能会有惊喜哦！" + TextFormatUtil.getRedTxt("尼古尔星") + "是卡兰星系的第一颗星球哦。";
               ToolTipManager.add(_tip_mc,"尼古尔星，卡兰星系的第一颗星球。");
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _tip_mc.gotoAndStop(2);
               _txt.htmlText = "    这个难道就是博士说的精灵吗？那家伙怎么突然钻进了花蕊？" + TextFormatUtil.getRedTxt("（快点击花蕊看看吧！）");
               ToolTipManager.add(_tip_mc,"快点击尼古尔星右边的花蕊");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    哼哼！气死我了！竟然以大欺小！作为精灵的伙伴，我可不能袖手旁观！看我不收拾你！";
               ToolTipManager.add(_tip_mc,"快点它进行精灵对战吧！");
            }
            else if(Boolean(arr[2]) && !arr[3])
            {
               _tip_mc.gotoAndStop(4);
               _txt.htmlText = "    奇怪了！小家伙好像有话要说？我不是已经帮它收拾了追赶它的家伙们吗？这……" + TextFormatUtil.getRedTxt("（快点它问问吧！）");
               ToolTipManager.add(_tip_mc,"它似乎有话要说!快问问它吧！");
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
         mainUI = new TaskPanel81_UI();
         _close_btn = mainUI["close_btn"];
         _txt = mainUI["txt"];
         _tip_mc = mainUI["tip_mc"];
         _tip_mc.gotoAndStop(1);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


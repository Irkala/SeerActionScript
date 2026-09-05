package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_84;
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
   public class TaskPanel_84 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _txt:TextField;
      
      private var _close_btn:SimpleButton;
      
      private var _tip_mc:MovieClip;
      
      public function TaskPanel_84()
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
         TasksManager.getProStatusList(TaskController_84.TASK_ID,function(arr:Array):void
         {
            if(!arr[0])
            {
               _tip_mc.gotoAndStop(1);
               _txt.htmlText = "    去" + TextFormatUtil.getRedTxt("发明室") + "找肖恩博士，看看他有没有让植物快速成长的机器！";
               ToolTipManager.add(_tip_mc,"去找肖恩帮忙！");
            }
            else if(Boolean(arr[0]) && !arr[1])
            {
               _tip_mc.gotoAndStop(2);
               _txt.htmlText = "    把克洛斯巨木的种子埋入" + TextFormatUtil.getRedTxt("塔克星") + "的土堆中，然后使用光合增幅器使让快速成长。";
               ToolTipManager.add(_tip_mc,"埋入种子并使用光合增幅器");
            }
            else if(Boolean(arr[1]) && !arr[2])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    克洛斯星巨木看来成长得不错，你得和爱丽丝一起来保护它免遭沙尘暴的侵袭。" + TextFormatUtil.getRedTxt("（必须有草系精灵跟随哦）");
               ToolTipManager.add(_tip_mc,"带上草系精灵和爱丽丝一起对抗沙尘暴");
            }
            else if(Boolean(arr[2]) && !arr[3])
            {
               _tip_mc.gotoAndStop(3);
               _txt.htmlText = "    你和草系精灵一起阻挡了塔克星上的沙暴侵袭，保护了克洛斯星巨木，爱丽丝应该会非常感谢你的作为。";
               ToolTipManager.add(_tip_mc,"与爱丽丝对话");
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
         mainUI = new Task84PanelUI();
         _close_btn = mainUI["close_btn"];
         _txt = mainUI["txt"];
         _tip_mc = mainUI["tip"];
         _tip_mc.gotoAndStop(1);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


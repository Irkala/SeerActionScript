package com.robot.module.task
{
   import com.robot.app.task.control.TasksController;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_91 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_91()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function setVisible(arr:Array) : void
      {
         var i:uint = 0;
         var nameStr:String = null;
         var name:String = null;
         var mc:MovieClip = null;
         for(var j:uint = 0; j < 4; j++)
         {
            nameStr = "icon_" + j;
            if(_mainUI[nameStr])
            {
               _mainUI[nameStr].visible = false;
            }
         }
         for each(i in arr)
         {
            name = "icon_" + i;
            mc = _mainUI[name];
            if(mc)
            {
               mc.visible = true;
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(91,taskStatus);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
         EventManager.dispatchEvent(new Event(TasksController.TASKPANEL_CLOSE));
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_91_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"快装备上高压水枪，瞄准布鲁灌输水源");
         ToolTipManager.add(_mainUI["icon_1"],"快带上你的水系精灵伙伴吧！记得带在身边哦");
         ToolTipManager.add(_mainUI["icon_2"],"快点击布鲁，把它放入水里吧");
         ToolTipManager.add(_mainUI["icon_3"],"快走近点看看");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    布鲁是因为呆在沙漠地带长期缺水，所以现在奄奄一息！快用<font color=\'#ff0000\'>高压水枪</font>灌输一点水给它吧!<font color=\'#ff0000\'>(你可以在机械室领取到高压水枪)</font>";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "    通过高压水枪的水源灌输，布鲁似乎有点起色了！带上你的精灵伙伴，用它的技能特效可能能帮助到布鲁更快的恢复哦！";
            setVisible([1]);
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    布鲁一直是生活在水里的，我想把它放入水里应该是最好的办法了！事不宜迟！赶快行动吧！";
            setVisible([2]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    快看！那颗陨石的坠落！它似乎有动静啊！快走近点看看吧！";
            setVisible([3]);
         }
      }
   }
}


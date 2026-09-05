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
   public class TaskPanel_96 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_96()
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
         for(var j:uint = 0; j < 3; j++)
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
         TasksManager.getProStatusList(96,taskStatus);
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
         _mainUI = new TaskPanel_96_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"去发明室领取NoNo");
         ToolTipManager.add(_mainUI["icon_1"],"带上你的NoNo到发明室来找我");
         ToolTipManager.add(_mainUI["icon_2"],"回基地为NoNo加载 “跟随模式芯片”");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    在发明室左侧<font color=\'#ff0000\'>NoNo领取处</font>领取你的NoNo后去找发明家肖恩！";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            setVisible([0]);
            _introTxt.htmlText = "      在发明室左侧<font color=\'#ff0000\'>NoNo领取处</font>领取你的NoNo后去找发明家肖恩！";
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    你的NoNo已经回到基地中了，别着急，先去肖恩老师那里了解下NoNo的能力吧！";
            setVisible([1]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    回到基地为你的NoNo加载<font color=\'#ff0000\'>跟随模式芯片</font>，并带它一起去发明室找发明家肖恩！";
            setVisible([2]);
         }
      }
   }
}


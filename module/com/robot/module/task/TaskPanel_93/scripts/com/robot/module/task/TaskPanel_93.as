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
   public class TaskPanel_93 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_93()
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
         for(var j:uint = 0; j < 5; j++)
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
         TasksManager.getProStatusList(93,taskStatus);
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
         _mainUI = new TaskPanel_93_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"云霄星最高层");
         ToolTipManager.add(_mainUI["icon_1"],"快点击浮空鱼挡在它前面！");
         ToolTipManager.add(_mainUI["icon_2"],"快点击提亚斯挡在它前面！");
         ToolTipManager.add(_mainUI["icon_3"],"快去云霄星告诉毛毛吧！");
         ToolTipManager.add(_mainUI["icon_4"],"快走近点看看");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    听毛毛说<font color=\'#ff0000\'>云霄星最高层</font>似乎出了点麻烦，现在需要你马上去现场看看！事不宜迟……";
         if(!arr[0])
         {
            setVisible([0]);
            _introTxt.htmlText = "    听毛毛说<font color=\'#ff0000\'>云霄星最高层</font>似乎出了点麻烦，现在需要你马上去现场看看！事不宜迟……";
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "    眼看那精灵被提亚斯打倒在地上，不行！我们如果不替那个精灵挡一下，它一定会受伤的！";
            setVisible([1]);
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    那群精灵似乎准备发动攻击了！怎么办！提亚斯可不能受伤啊！她还需要孵化她的蛋呢……";
            setVisible([2]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    毛毛可能已经急坏了！快去告诉它们和好的事情吧！大团圆结局万岁！快去<font color=\'#ff0000\'>云霄星</font>找毛毛吧！";
            setVisible([3]);
         }
      }
   }
}


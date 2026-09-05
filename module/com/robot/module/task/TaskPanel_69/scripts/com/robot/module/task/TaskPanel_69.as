package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
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
   public class TaskPanel_69 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_69()
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
         TasksManager.getProStatusList(69,taskStatus);
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
      }
      
      public function destroy() : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_69_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"从瞭望舱破口出去迎击海盗");
         ToolTipManager.add(_mainUI["icon_1"],"用头部射击攻击阻挡去路的海盗机甲");
         ToolTipManager.add(_mainUI["icon_2"],"快去问问船长下一步的方案");
         ToolTipManager.add(_mainUI["icon_3"],"探测装置就在船长身后，选定找到的陨石群");
         ToolTipManager.add(_mainUI["icon_4"],"与船长交谈");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    为了阻止对方的主炮发射，快去<font color=\'#ff0000\'>瞭望舱</font>破口向敌方飞船进发吧，你们是赛尔号上的最后一道屏障了！一定要打败他们！";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "    海盗的飞船就在眼前，你能打败这些来犯的海盗吗？为了荣耀与和平！";
            setVisible([1]);
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    赛尔号遭到海盗飞船的主炮攻击，船体严重受损，快去<font color=\'#ff0000\'>船长室</font>向船长打听一下我们下一步要怎么办？";
            setVisible([2]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    使用船长身后的探测装置，找到离这里最近的大型陨石群，然后回报船长。";
            setVisible([3]);
         }
         if(Boolean(arr[3]) && !arr[4])
         {
            _introTxt.htmlText = "    船长使用赛尔号的全息影像诱导飞船成功骗过了海盗们，飞船也耗尽了大部分的能源。";
            setVisible([4]);
         }
      }
   }
}


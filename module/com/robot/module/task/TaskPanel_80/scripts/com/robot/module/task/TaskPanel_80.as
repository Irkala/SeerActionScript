package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_80 extends Sprite implements IModule
   {
      
      private var _closeBtn:MovieClip;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_80()
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
         TasksManager.getProStatusList(80,taskStatus);
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
         _mainUI = new TaskPanel_80_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"茜茜正在机械室的地下室里等你呢！");
         ToolTipManager.add(_mainUI["icon_1"],"分离出贾斯汀的记忆准备升级芯片！");
         ToolTipManager.add(_mainUI["icon_2"],"完成贾斯汀机体的组装吧");
         ToolTipManager.add(_mainUI["icon_3"],"问问茜茜如何启动站长机体");
         ToolTipManager.add(_mainUI["icon_4"],"问问茜茜接下来如何是好");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    贾斯汀站长危在旦夕，快去和地下室里的茜茜商讨一下如何来唤醒贾斯汀站长吧！<font color=\'#ff0000\'>（地下室就在机械室的左上角）</font>";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "    茜茜决定冒险用最新技术来完善贾斯汀的芯片，这样或许就能解决同步率的问题。先使用<font color=\'#ff0000\'>芯片强化机</font>分离出贾斯汀的记忆。";
            setVisible([1]);
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    贾斯汀站长的升级版芯片已经完成，接下来让我们在<font color=\'#ff0000\'>操作台</font>上开始组装他的机体吧。";
            setVisible([2]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    看来贾斯汀站长的机体已经组装完成了，剩下就是要启动他的机体，去问问茜茜要怎么来操作吧。";
            setVisible([3]);
         }
         if(Boolean(arr[3]) && !arr[4])
         {
            _introTxt.htmlText = "    贾斯汀站长发生了不明原因的失控，看来这次救治已经失败了。问问茜茜接下来该怎么办吧。";
            setVisible([4]);
         }
         if(Boolean(arr[4]) && !arr[5])
         {
            _introTxt.htmlText = "    贾斯汀站长发生了不明原因的失控，看来这次救治已经失败了。问问茜茜接下来该怎么办吧。";
            setVisible([4]);
         }
      }
   }
}


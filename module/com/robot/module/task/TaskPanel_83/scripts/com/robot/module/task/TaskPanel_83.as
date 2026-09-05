package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_83 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var closeButton:MovieClip;
      
      private var eventNum:Number = 0;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_83()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         LevelManager.openMouseEvent();
         if(eventNum == 20)
         {
            MainManager.getRoot().dispatchEvent(new Event("PLAYMOVIE_OVER"));
         }
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_83_ui();
         _introTxt = _mainUI["introTxt"];
         closeButton = _mainUI["closeBtn"];
         closeButton.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"快过去看看！");
         ToolTipManager.add(_mainUI["icon_1"],"快点击那图黑影问问他吧！");
         eventNum = 0;
      }
      
      private function setVisible(arr:Array) : void
      {
         var i:uint = 0;
         var nameStr:String = null;
         var name:String = null;
         var mc:MovieClip = null;
         for(var j:uint = 0; j < 2; j++)
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
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(83,taskStatus);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.closeMouseEvent();
         checkTask();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    那个黑影说的考验到底是什么呢？咦！那个小赛尔好像需要帮助？快过去看看吧";
         if(!arr[0])
         {
            _introTxt.htmlText = "   那个黑影说的考验到底是什么呢？咦！那个小赛尔好像需要帮助？快过去看看吧";
            setVisible([0]);
         }
         else if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "    哇！那个赛尔原来是那黑影变的？？它究竟想干嘛吖！快去问问它吧……";
            eventNum = 20;
            setVisible([1]);
         }
         else if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    哇哦！不错啊，那家伙还给我上了一堂课，不对啊！我还是没有看到它的真身，快点它问问吧！";
            ToolTipManager.add(_mainUI["icon_1"],"快点黑影吧！");
            setVisible([1]);
         }
      }
   }
}


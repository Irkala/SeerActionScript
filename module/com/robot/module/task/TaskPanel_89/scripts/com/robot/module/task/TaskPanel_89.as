package com.robot.module.task
{
   import com.robot.app.freshFightLevel.FightLevelModel;
   import com.robot.app.task.control.TaskController_89;
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
   public class TaskPanel_89 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var starName:Number = 0;
      
      private var closeButton:MovieClip;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_89()
      {
         super();
      }
      
      public function destroy() : void
      {
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         LevelManager.openMouseEvent();
         if(starName == 2 && TaskController_89.eableToGoing == "canGoing")
         {
            LevelManager.closeMouseEvent();
            FightLevelModel.setUp();
            TaskController_89.eableToGoing = "canNotGo";
         }
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
         TasksManager.getProStatusList(89,taskStatus);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         starName = 0;
         _mainUI = new TaskPanel_89_ui();
         _introTxt = _mainUI["introTxt"];
         closeButton = _mainUI["closeBtn"];
         closeButton.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"入口就在我的右下方");
         ToolTipManager.add(_mainUI["icon_1"],"我在教官办公室里等你！");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "   试炼之塔，这是一个新手们的训练场所！现在请你先找到<font color=\'#FF0000\'>" + "试炼之塔" + "</font>的入口。";
         if(!arr[0])
         {
            _introTxt.htmlText = "   试炼之塔，这是一个新手们的训练场所！现在请你先找到<font color=\'#FF0000\'>" + "试炼之塔" + "</font>的入口。";
            setVisible([0]);
         }
         else if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "   雷蒙教官已经下达的第一道任务，那就是通过<font color=\'#FF0000\'>" + "试炼之塔" + "</font>的10层考验！磨练才刚刚开始，快点击试炼之塔的入口开始磨练吧！";
            starName = 2;
            setVisible([0]);
            ToolTipManager.add(_mainUI["icon_0"],"快进入试炼之塔，开始磨练吧！");
         }
         else if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    看来你已经出色的完成了10层<font color=\'#FF0000\'>" + "试炼之塔" + "</font>的磨练！好吧快去<font color=\'#FF0000\'>" + "雷蒙教官" + "</font>这里交取任务吧！他正在<font color=\'#FF0000\'>" + "教官办公室" + "</font>等你呢！";
            ToolTipManager.add(_mainUI["icon_1"],"我在教官办公室里等你！");
            setVisible([1]);
         }
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
   }
}


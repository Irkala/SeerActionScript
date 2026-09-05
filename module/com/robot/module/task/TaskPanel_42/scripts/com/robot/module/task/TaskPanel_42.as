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
   public class TaskPanel_42 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var _taskID:uint = 42;
      
      public function TaskPanel_42()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
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
      
      private function onClose(param1:MouseEvent) : void
      {
         hide();
         EventManager.dispatchEvent(new Event(TasksController.TASKPANEL_CLOSE));
      }
      
      private function taskStatus(param1:Array) : void
      {
         _introTxt.htmlText = "    曾经的赫尔卡星究竟是怎样的面目？曾经的他又发生了什么才变成现在的机械废墟？\r（注意：拜伦号的<font color=\'#ff0000\'>神秘空间</font>中暗藏着一道时空之门，触发机关即可回到千年前的赫尔卡星，揭晓\"赫尔卡星千年之谜\"）";
         if(!param1[0])
         {
            setVisible([0]);
         }
         if(Boolean(param1[0]) && !param1[1])
         {
            _introTxt.htmlText = "    寻觅到<font color=\'#ff0000\'>赫尔卡长老</font>，才能了解更多关于赫尔卡星千年之谜的事情。\r（注意：赫尔卡星历史书上记载，长老应该就在千年前赫尔卡星的精灵圣殿中）";
            setVisible([1]);
         }
         if(Boolean(param1[1]) && !param1[2])
         {
            _introTxt.htmlText = "    想要打败机械巨人营救赫尔卡星人，只有研究出比卡塔精灵更厉害的机械精灵！\r（注意：快去<font color=\'#ff0000\'>千年前的赫尔卡星</font>与古代巨型机器人对战，拖延时间帮助侠客成功护送卡塔回到实验室）";
            setVisible([2]);
         }
         if(Boolean(param1[2]) && !param1[3])
         {
            _introTxt.htmlText = "    快回<font color=\'#ff0000\'>实验室</font>问问博士吧！他一定会有办法制造出比赫尔卡特更厉害的机械精灵。\r（注意：时空之门随时都有可能关闭，一定要抓紧时间！）";
            setVisible([3]);
         }
         if(Boolean(param1[3]) && !param1[4])
         {
            _introTxt.htmlText = "    从博士这里已经领取到了研究机械精灵的装置，快回到<font color=\'#ff0000\'>精灵圣殿</font>进行机械精灵制造吧！\r（注意：时空之门随时都有可能关闭，一定要抓紧时间！）";
            setVisible([4]);
         }
         if(Boolean(param1[4]) && !param1[5])
         {
            _introTxt.htmlText = "    通过从博士这里领取的研究机械精灵的装置，你成功地帮助赫尔卡星长老制造出了比卡塔精灵更厉害的机械精灵，快回去告诉<font color=\'#ff0000\'>爱丽丝</font>这个好消息吧！\r";
            setVisible([5]);
         }
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_42_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"前往神秘空间开启时空之门");
         ToolTipManager.add(_mainUI["icon_1"],"寻觅赫尔卡长老");
         ToolTipManager.add(_mainUI["icon_2"],"与赫尔卡巨人对战协助侠客将卡塔带回实验室");
         ToolTipManager.add(_mainUI["icon_3"],"回到实验室询问博士");
         ToolTipManager.add(_mainUI["icon_4"],"前往精灵圣殿制造机械精灵");
         ToolTipManager.add(_mainUI["icon_5"],"提交任务");
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(_taskID,taskStatus);
      }
      
      private function setVisible(param1:Array) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:String = null;
         var _loc4_:String = null;
         var _loc5_:MovieClip = null;
         var _loc6_:uint = 0;
         while(_loc6_ < 5)
         {
            _loc3_ = "icon_" + _loc6_;
            if(_mainUI[_loc3_])
            {
               _mainUI[_loc3_].visible = false;
            }
            _loc6_++;
         }
         for each(_loc2_ in param1)
         {
            _loc4_ = "icon_" + _loc2_;
            _loc5_ = _mainUI[_loc4_];
            if(_loc5_)
            {
               _loc5_.visible = true;
            }
         }
      }
      
      public function destroy() : void
      {
      }
   }
}


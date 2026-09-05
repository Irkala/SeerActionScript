package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_70;
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
   public class TaskPanel_70 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _iconMc:Sprite;
      
      private var _closeBtn:SimpleButton;
      
      private var _iconArr:Array = [];
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_70()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _introTxt = null;
         _closeBtn = null;
         _iconMc = null;
         _mainUI = null;
      }
      
      public function hide() : void
      {
         removeIcon();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         _mainUI.addChild(_iconMc);
         _iconMc.x = 60;
         _iconMc.y = 135;
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         checkTask();
      }
      
      public function setup() : void
      {
         _mainUI = new Main_Panel_70();
         _iconMc = new Sprite();
         _introTxt = _mainUI["txt"];
         _closeBtn = _mainUI["close_btn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      private function removeIcon() : void
      {
         while(_iconMc.numChildren > 0)
         {
            _iconMc.removeChildAt(0);
         }
      }
      
      private function taskStatus(arr:Array) : void
      {
         var infoStr:String = "";
         if(!arr[0])
         {
            infoStr = "    赛尔号受到炮击，内部损坏严重，为避免重要物资被气压挤出船体，<font color=\'#ff0000\'>空气外泄区域</font>需要紧急封锁！看到<font color=\'#ff0000\'>船长室</font>上方的<font color=\'#ff0000\'>气动阀门</font>没？确认区域后拉下它！要快！";
            changeTaskInfo(infoStr,[valveMC,"气动阀门",false]);
            return;
         }
         if(!arr[1])
         {
            infoStr = "    空气外泄区域已经确定，并启动了密闭甲板。快把这一情况报知<font color=\'#ff0000\'>船长罗杰</font>吧。";
            changeTaskInfo(infoStr,[valveMC,"气动阀门",true]);
            return;
         }
         if(!arr[2] && !arr[3] && !arr[4])
         {
            infoStr = "    <font color=\'#ff0000\'>动力室</font>尚有部分燃火情况，请即刻装备好<font color=\'#ff0000\'>高压水枪</font>，对火苗使用<font color=\'#ff0000\'>头部射击</font>效果。<font color=\'#ff0000\'>（还没有高压水枪的赛尔快到机械室领取）</font>";
            changeTaskInfo(infoStr,[fireMC,"动力室",false]);
            return;
         }
         if(!arr[5])
         {
            infoStr = "    动力室所有燃火已经扑灭，船内危机已经解除，快向<font color=\'#ff0000\'>船长罗杰</font>报告这一好消息吧！";
            changeTaskInfo(infoStr,[shipperMC,"我在船长室等你呢"]);
            return;
         }
      }
      
      private function changeTaskInfo(str:String, taskIcons:Array) : void
      {
         removeIcon();
         _introTxt.htmlText = str;
         var _icon:MovieClip = new (taskIcons[0] as Class)() as MovieClip;
         _icon.x = 30;
         _icon.buttonMode = true;
         _iconMc.addChild(_icon);
         if(taskIcons.length > 2)
         {
            ToolTipManager.add(_icon,taskIcons[1]);
            if(taskIcons[2])
            {
               if(_icon["finish_mc"])
               {
                  _icon["finish_mc"].visible = true;
               }
            }
            else if(_icon["finish_mc"])
            {
               _icon["finish_mc"].visible = false;
            }
         }
         _iconMc.x = (_mainUI.width - _iconMc.width) / 2 - 20;
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(TaskController_70.TASK_ID,taskStatus);
      }
   }
}


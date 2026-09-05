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
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel_95 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _mc_0:MovieClip;
      
      private var _mc_1:MovieClip;
      
      private var _mc_2:MovieClip;
      
      private var _mainUI:MovieClip;
      
      private var _taskID:uint = 95;
      
      public function TaskPanel_95()
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
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
         EventManager.dispatchEvent(new Event(TasksController.TASKPANEL_CLOSE));
         if(_mc_0.visible && _mc_1.visible && _mc_2.visible)
         {
            EventManager.dispatchEvent(new Event("get_all_gains"));
            _mc_0.visible = false;
            _mc_1.visible = false;
            _mc_2.visible = false;
         }
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    先遣队的两位勇士已经在<font color=\'#ff0000\'>瞭望舱</font>等你了！快去找他们吧！这次进入黑色旋涡！十分危险！一定要加倍小心……";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            _introTxt.htmlText = "   那个精灵竟然出奇的厉害啊！把我们的精灵胶囊都吃掉了！我们只有团结起来用<font color=\'#ff0000\'>头部射击</font>打它！接招吧！（你可以通过传送舱第一个入口进入拉姆神秘世界）";
            setVisible([1]);
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "   我们已经耽误了太长时间了！快去那个被称为摩尔庄园的地方找线索吧！<font color=\'#ff0000\'>传送舱</font>就有个临时的捷径入口！快去吧！";
            setVisible([2]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "   根据矿石追踪器，那个矿石应该就在旁边的地方！快去看看吧！";
            setVisible([3]);
         }
         if(Boolean(arr[3]) && !arr[4])
         {
            _introTxt.htmlText = "    为了消除那群骑士们的疑心！我们只有装上那个什么大红鼻子的！快采集这些果实装上去看看吧！（四处去看看可能会有发现）";
            setVisible([4]);
            EventManager.addEventListener("get_gains",getGains);
         }
         if(arr[4])
         {
            _mc_0.visible = false;
            _mc_1.visible = false;
            _mc_2.visible = false;
            if(!arr[5])
            {
               _introTxt.htmlText = "    那两个骑士就在<font color=\'#ff0000\'>拉姆世界丛林</font>里，快去给他们看看吧！或许可以过关哟！";
               setVisible([5]);
            }
         }
         if(Boolean(arr[5]) && !arr[6])
         {
            _introTxt.htmlText = "    那个长胡子的洋葱头说的很有道理哦！快点击<font color=\'#ff0000\'>嘟噜噜</font>看看吧！或许会有所发现呢！";
            setVisible([6]);
         }
         if(Boolean(arr[6]) && !arr[7])
         {
            _introTxt.htmlText = "    漩涡的困境已经解除了！快去<font color=\'#ff0000\'>船长室</font>复命吧！";
            setVisible([7]);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function getGains(evt:DynamicEvent) : void
      {
         var name:String = String(evt.paramObject);
         switch(name)
         {
            case "gains_0":
               _mc_0.visible = true;
               break;
            case "gains_1":
               _mc_1.visible = true;
               break;
            case "gains_2":
               _mc_2.visible = true;
         }
         show();
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_95_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         ToolTipManager.add(_mainUI["icon_0"],"我……我们在瞭望舱等你呐！");
         ToolTipManager.add(_mainUI["icon_1"],"用头部射击打它！");
         ToolTipManager.add(_mainUI["icon_2"],"快来传送舱进入摩尔庄园吧");
         ToolTipManager.add(_mainUI["icon_3"],"我们生活在拉姆世界丛林里");
         ToolTipManager.add(_mainUI["icon_4"],"找到这些果实吧");
         ToolTipManager.add(_mainUI["icon_5"],"我们就在拉姆世界丛林里巡逻");
         ToolTipManager.add(_mainUI["icon_6"],"点击嘟噜噜看看吧");
         ToolTipManager.add(_mainUI["icon_7"],"我正在船长室呢");
         _mc_0 = _mainUI["mc_0"];
         _mc_1 = _mainUI["mc_1"];
         _mc_2 = _mainUI["mc_2"];
         _mc_0.visible = false;
         _mc_1.visible = false;
         _mc_2.visible = false;
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(_taskID,taskStatus);
      }
      
      private function setVisible(arr:Array) : void
      {
         var i:uint = 0;
         var nameStr:String = null;
         var name:String = null;
         var mc:MovieClip = null;
         for(var j:uint = 0; j < 8; j++)
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
      
      public function destroy() : void
      {
      }
   }
}


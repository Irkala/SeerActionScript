package com.robot.module.task
{
   import com.robot.app.mapProcess.MapProcess_325;
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
   public class TaskPanel_97 extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _introTxt:TextField;
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_97()
      {
         super();
      }
      
      public function hide() : void
      {
         if(_mainUI)
         {
            DisplayUtil.removeForParent(_mainUI);
            _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         }
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
         TasksManager.getProStatusList(97,taskStatus);
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
         destroy();
         EventManager.dispatchEvent(new Event(TasksController.TASKPANEL_CLOSE));
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
         _introTxt = null;
         _closeBtn = null;
      }
      
      public function setup() : void
      {
         _mainUI = new TaskPanel_97_ui();
         _introTxt = _mainUI["introTxt"];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _mainUI["icon_1"]["ZeroChoose"].visible = false;
         _mainUI["icon_1"]["OneChoose"].visible = false;
         _mainUI["icon_1"]["TwoChoose"].visible = false;
         _mainUI["icon_3"]["item0"].visible = false;
         _mainUI["icon_3"]["item1"].visible = false;
         if(MapProcess_325.oneString == "click")
         {
            _mainUI["icon_1"]["ZeroChoose"].visible = true;
         }
         if(MapProcess_325.twoString == "click")
         {
            _mainUI["icon_1"]["OneChoose"].visible = true;
         }
         if(MapProcess_325.threeString == "click")
         {
            _mainUI["icon_1"]["TwoChoose"].visible = true;
         }
         if(MapProcess_325.visiteMaomao == "visited")
         {
            _mainUI["icon_3"]["item1"].visible = true;
         }
         if(MapProcess_325.vistiteEva == "visited")
         {
            _mainUI["icon_3"]["item0"].visible = true;
         }
         ToolTipManager.add(_mainUI["icon_0"],"有问题就来实验室找我");
         ToolTipManager.add(_mainUI["icon_1"]["icon0"],"蓝色摇晃的铃铛草");
         ToolTipManager.add(_mainUI["icon_1"]["icon1"],"紫色梦幻般的喷泉");
         ToolTipManager.add(_mainUI["icon_1"]["icon2"],"红色短笛花");
         ToolTipManager.add(_mainUI["icon_2"],"别吵我！我在艾迪星上睡觉！");
         ToolTipManager.add(_mainUI["icon_3"]["icon0"],"咿呀咿呀哟！伊娃喜欢塔克星哟！");
         ToolTipManager.add(_mainUI["icon_3"]["icon1"],"哇哇哇！毛毛在云霄星上呢！");
         ToolTipManager.add(_mainUI["icon_4"],"精灵演唱会已经开始咯！");
      }
      
      private function taskStatus(arr:Array) : void
      {
         _introTxt.htmlText = "    这个精灵竟然挡住了我们的去路，还不理我们！它的背后是不是有什么故事？快去<font color=\'#ff0000\'>实验室</font>问问博士吧，他可能会有相关的资料哦！";
         if(!arr[0])
         {
            setVisible([0]);
         }
         if(Boolean(arr[0]) && !arr[1])
         {
            setVisible([0]);
            _introTxt.htmlText = "      这个精灵竟然挡住了我们的去路，还不理我们！它的背后是不是有什么故事？快去<font color=\'#ff0000\'>实验室</font>问问博士吧，他可能会有相关的资料哦！";
         }
         if(Boolean(arr[1]) && !arr[2])
         {
            _introTxt.htmlText = "    能够吸引帕尼的只有音乐，所以我们只要在<font color=\'#ff0000\'>艾迪星</font>上找到有关于音乐的东西，我们就能够唤醒它咯！";
            setVisible([1]);
         }
         if(Boolean(arr[2]) && !arr[3])
         {
            _introTxt.htmlText = "    艾迪星不愧是名副其实的音乐星，这里竟然还藏了这么多音乐器材！这下应该能够吸引帕诺的注意力咯！快去给它看看吧！";
            setVisible([2]);
         }
         if(Boolean(arr[3]) && !arr[4])
         {
            _introTxt.htmlText = "    舞台怎么可以孤零零的呢！我这就去帮帕尼找<font color=\'#ff0000\'>毛毛</font>和<font color=\'#ff0000\'>伊娃</font>帮忙！相信这会是一场别开生面的精灵演唱会！";
            setVisible([3]);
         }
         if(Boolean(arr[4]) && !arr[5])
         {
            _introTxt.htmlText = "    嘿嘿！已经邀请了两位精灵界出了名的音乐家咯！快回<font color=\'#ff0000\'>艾迪星</font>看看吧！精灵的演唱会会是怎么样的呢？";
            setVisible([4]);
         }
      }
   }
}


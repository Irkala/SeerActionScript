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
   public class TaskPanel_58 extends Sprite implements IModule
   {
      
      private var _introTxt:TextField;
      
      private var _tipsArr:Array = ["可恶的大脚怪就被关在陷阱里","快点一下大脚怪吧！","那个大脚怪就在斯诺岩洞里","照着大脚怪的样子快去拉一下藤蔓吧","快点它和它较量吧！","快带他们走吧！","我在斯诺星上"];
      
      private var _introTxtArr:Array = ["我们是不是可以跟踪大脚怪，找出幕后的真凶呢？我想一切谜题都可以解开哦!<font color=\'#ff0000\'>（快点击陷阱，放出大脚怪吧！）</font>","嘘！跟踪大脚怪可不是个容易事！我们必须和它保持距离！<font color=\'#ff0000\'>（先用鼠标先点一下大脚怪，根据它的行走路线来跟踪，小心不要跟太近哦！）</font>","那个大脚怪进入斯诺岩洞了！快跟进去看个究竟！<font color=\'#ff0000\'>（进入斯诺岩洞后，记得点击大脚怪哦）</font>","那个藤蔓估计就是机关点！<font color=\'#ff0000\'>（快点击左上角的藤蔓看看吧！）</font>","那个家伙实在太可恶了！我一定要替米鲁族们出出气！也为那两个小不点！<font color=\'#ff0000\'>（快点击那个家伙进行精灵对战吧！）</font>","米鲁两兄妹的爸爸妈妈都被困了这么久，快把他们救出去吧！<font color=\'#ff0000\'>（快点米鲁两兄妹的父母）</font>","救出了被困已久的米鲁父母，还看到了亲人重逢！这真是个好消息！快去告诉达鲁切尔族长吧！<font color=\'#ff0000\'>（快点达鲁切尔）</font>"];
      
      private var _closeBtn:SimpleButton;
      
      private var _iconArr:Array = [];
      
      private var _mainUI:MovieClip;
      
      public function TaskPanel_58()
      {
         super();
      }
      
      public function destroy() : void
      {
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
      
      public function setup() : void
      {
         var name:String = null;
         _mainUI = new TaskPanel_58_ui();
         _introTxt = _mainUI["introTxt"];
         _introTxt.htmlText = "    " + _introTxtArr[0];
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         for(var i:uint = 0; i < 7; i++)
         {
            name = "icon_" + i;
            if(i != 0)
            {
               _mainUI[name].visible = false;
            }
            _iconArr.push(_mainUI[name]);
            ToolTipManager.add(_mainUI[name],_tipsArr[i]);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         hide();
      }
      
      private function taskStatus(arr:Array) : void
      {
         var name:String = null;
         var mc:MovieClip = null;
         for(var i:uint = 0; i < arr.length - 1; i++)
         {
            name = "icon_" + (i + 1).toString();
            mc = _mainUI[name];
            if(arr[i])
            {
               mc.visible = true;
               _introTxt.htmlText = "    " + _introTxtArr[i + 1];
            }
            else
            {
               mc.visible = false;
            }
         }
      }
      
      private function checkTask() : void
      {
         TasksManager.getProStatusList(58,taskStatus);
      }
   }
}


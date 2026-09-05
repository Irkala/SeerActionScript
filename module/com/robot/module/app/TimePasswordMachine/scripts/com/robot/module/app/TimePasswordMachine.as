package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.module.app.timePasswordMachine.InputPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TimePasswordMachine extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var mainPanel:MovieClip;
      
      private var goBtn:SimpleButton;
      
      private var inputPanel:InputPanel;
      
      private var txt:TextField;
      
      private var desCloseBtn:SimpleButton;
      
      private var knowPanel:MovieClip;
      
      private var knowMoreBtn:SimpleButton;
      
      public function TimePasswordMachine()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainPanel);
         DisplayUtil.removeForParent(knowPanel);
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function show() : void
      {
         hide();
         DisplayUtil.align(mainPanel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainPanel);
         if(inputPanel)
         {
            inputPanel.hide();
         }
      }
      
      private function goHandler(event:MouseEvent) : void
      {
         hide();
         if(!inputPanel)
         {
            inputPanel = new InputPanel();
            inputPanel.addEventListener(Event.CLOSE,onSuccess);
         }
         inputPanel.show();
      }
      
      private function closeDes(event:MouseEvent) : void
      {
         DisplayUtil.removeForParent(knowPanel);
      }
      
      public function setup() : void
      {
         mainPanel = new timePassword_main_panel();
         closeBtn = mainPanel["closeBtn"];
         goBtn = mainPanel["goBtn"];
         knowMoreBtn = mainPanel["knowMoreBtn"];
         txt = mainPanel["txt"];
         txt.text = "勇敢的" + MainManager.actorInfo.nick + "，你好！\r    时空密码是赛尔们在战斗中获得的奖励密码，在这里输入它，看看你将获得怎样的奖励吧！\r" + "    想要了解更多请查看时空密码说明图鉴。";
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         goBtn.addEventListener(MouseEvent.CLICK,goHandler);
         knowMoreBtn.addEventListener(MouseEvent.CLICK,knowHandler);
         knowPanel = new timeMachine_des_panel();
         desCloseBtn = knowPanel["closeBtn"];
         desCloseBtn.addEventListener(MouseEvent.CLICK,closeDes);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onSuccess(event:Event) : void
      {
         hide();
         if(inputPanel)
         {
            inputPanel.hide();
         }
      }
      
      public function destroy() : void
      {
         hide();
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         goBtn.removeEventListener(MouseEvent.CLICK,goHandler);
         knowMoreBtn.removeEventListener(MouseEvent.CLICK,knowHandler);
         closeBtn = null;
         goBtn = null;
         knowMoreBtn = null;
         if(inputPanel)
         {
            inputPanel.destroy();
            inputPanel = null;
         }
         knowPanel = null;
      }
      
      private function knowHandler(event:MouseEvent) : void
      {
         DisplayUtil.align(knowPanel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(knowPanel);
      }
   }
}


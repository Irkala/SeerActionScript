package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NewNoviceTaskGetItemPanel extends Sprite implements IModule
   {
      
      private var _sureBtn:SimpleButton;
      
      private var _mainUI:NewNoviceGetItem_MC;
      
      private var _txt:TextField;
      
      private const MSG_STR:String = TextFormatUtil.getRedTxt("新手帽,新手腰带") + "已经放入你的存储箱，快穿上它们试试吧！";
      
      public function NewNoviceTaskGetItemPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
         _txt = null;
         _sureBtn = null;
      }
      
      private function onSureHandler(e:MouseEvent) : void
      {
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         removeEvent();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function removeEvent() : void
      {
         _sureBtn.removeEventListener(MouseEvent.CLICK,onSureHandler);
         DragManager.remove(_mainUI["dragMc"]);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function addEvent() : void
      {
         _sureBtn.addEventListener(MouseEvent.CLICK,onSureHandler);
         DragManager.add(_mainUI["dragMc"],_mainUI);
      }
      
      public function setup() : void
      {
         _mainUI = new NewNoviceGetItem_MC();
         _txt = _mainUI["txt"];
         _sureBtn = _mainUI["okBtn"];
         _txt.htmlText = MSG_STR;
      }
   }
}


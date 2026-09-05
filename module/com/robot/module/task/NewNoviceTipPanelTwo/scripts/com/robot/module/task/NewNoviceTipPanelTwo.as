package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NewNoviceTipPanelTwo extends Sprite implements IModule
   {
      
      private var _cancelBtn:SimpleButton;
      
      private var _sureBtn:SimpleButton;
      
      private var _mainUI:FirstLoginMC_2;
      
      public function NewNoviceTipPanelTwo()
      {
         super();
      }
      
      private function onCancelHandler(e:MouseEvent) : void
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
      
      private function onSureHandler(e:MouseEvent) : void
      {
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function setup() : void
      {
         _mainUI = new FirstLoginMC_2();
         _sureBtn = _mainUI["sureBtn"];
         _cancelBtn = _mainUI["cancelBtn"];
      }
      
      public function removeEvent() : void
      {
         _sureBtn.removeEventListener(MouseEvent.CLICK,onSureHandler);
         _cancelBtn.removeEventListener(MouseEvent.CLICK,onCancelHandler);
         DragManager.remove(_mainUI["dragMc"]);
      }
      
      public function addEvent() : void
      {
         _sureBtn.addEventListener(MouseEvent.CLICK,onSureHandler);
         _cancelBtn.addEventListener(MouseEvent.CLICK,onCancelHandler);
         DragManager.add(_mainUI["dragMc"],_mainUI);
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
         _sureBtn = null;
         _cancelBtn = null;
      }
      
      public function init(data:Object = null) : void
      {
      }
   }
}


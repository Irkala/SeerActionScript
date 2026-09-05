package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class CongratulatePanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _panel:CongratulatePanelMc;
      
      public function CongratulatePanel()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function onOpenHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         _panel = new CongratulatePanelMc();
         _closeBtn = _panel["closeBtn"];
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
         _closeBtn = null;
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         hide();
      }
   }
}


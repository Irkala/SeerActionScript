package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ArmWarBookPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _mainPanel:ArmWarBookMc;
      
      public function ArmWarBookPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainPanel);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      public function show() : void
      {
         _mainPanel.gotoAndStop(1);
         LevelManager.appLevel.addChild(_mainPanel);
         _mainPanel.addEventListener(Event.CLOSE,onClose1Handler);
         DisplayUtil.align(_mainPanel,null,AlignType.MIDDLE_CENTER);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onClose1Handler(e:Event) : void
      {
         this.hide();
      }
      
      public function setup() : void
      {
         _mainPanel = new ArmWarBookMc();
         _mainPanel.gotoAndStop(1);
         _closeBtn = _mainPanel["closeBtn"];
      }
      
      public function destroy() : void
      {
         hide();
         _mainPanel = null;
         _closeBtn = null;
      }
   }
}


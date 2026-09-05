package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TeamBadgeExchangePanel extends Sprite implements IModule
   {
      
      private var _panel:TeamBadgeExchangeBookMc;
      
      public function TeamBadgeExchangePanel()
      {
         super();
      }
      
      public function hide() : void
      {
         _panel.removeEventListener(Event.CLOSE,onClose1Handler);
         _panel["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseHandler);
         DisplayUtil.removeForParent(_panel);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         _panel.gotoAndStop(1);
         _panel["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseHandler);
         _panel.addEventListener(Event.CLOSE,onClose1Handler);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
      }
      
      public function setup() : void
      {
         _panel = new TeamBadgeExchangeBookMc();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onClose1Handler(e:Event) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
      }
   }
}


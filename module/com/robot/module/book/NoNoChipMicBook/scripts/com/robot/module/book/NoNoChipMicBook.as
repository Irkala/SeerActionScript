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
   public class NoNoChipMicBook extends Sprite implements IModule
   {
      
      private var _panel:NoNoChipMix_MC;
      
      public function NoNoChipMicBook()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panel);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function setup() : void
      {
         _panel = new NoNoChipMix_MC();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         _panel["closeBtn"].removeEventListener(MouseEvent.CLICK,onClickHandler);
      }
      
      private function addEvent() : void
      {
         _panel["closeBtn"].addEventListener(MouseEvent.CLICK,onClickHandler);
      }
      
      public function destroy() : void
      {
         this.removeEvent();
         this.hide();
         _panel = null;
      }
   }
}


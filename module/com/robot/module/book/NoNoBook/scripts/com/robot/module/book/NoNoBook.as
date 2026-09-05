package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NoNoBook extends Sprite implements IModule
   {
      
      private var _panelMc:NoNoBook_MC;
      
      public function NoNoBook()
      {
         super();
      }
      
      public function destroy() : void
      {
         ToolTipManager.remove(_panelMc["closeBtn"]);
         hide();
         removeEvent();
         _panelMc = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panelMc);
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function onOpenHandler(e:Event) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function removeEvent() : void
      {
         _panelMc.removeEventListener(Event.OPEN,onOpenHandler);
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      private function onOperSuperNo(e:Event) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event("supernonooper"));
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _panelMc = new NoNoBook_MC();
         ToolTipManager.add(_panelMc["closeBtn"],"关闭");
         _panelMc.gotoAndStop(1);
      }
      
      public function addEvent() : void
      {
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _panelMc.addEventListener(Event.OPEN,onOpenHandler);
         _panelMc.addEventListener("supernonooper",onOperSuperNo);
      }
   }
}


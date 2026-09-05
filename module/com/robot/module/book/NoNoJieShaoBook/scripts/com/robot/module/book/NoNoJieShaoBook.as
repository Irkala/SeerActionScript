package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NoNoJieShaoBook extends Sprite implements IModule
   {
      
      private var _panel:SuperNONOJianJie_Mc;
      
      private var nr_mc:MovieClip;
      
      public function NoNoJieShaoBook()
      {
         super();
      }
      
      private function onOpenHandler(e:Event) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      public function setup() : void
      {
         _panel = new SuperNONOJianJie_Mc();
         nr_mc = _panel["si_mc"];
         ToolTipManager.add(_panel["closeBtn"],"关闭");
         _panel.gotoAndStop(1);
      }
      
      private function overBtnHandler(e:MouseEvent) : void
      {
         var j:int = nr_mc.nr_mc.nr_mc.numChildren - 1;
         var temp:SimpleButton = e.target as SimpleButton;
         nr_mc.nr_mc.nr_mc.setChildIndex(temp,j);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         ToolTipManager.remove(_panel["closeBtn"]);
         hide();
         removeEvent();
         _panel = null;
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function removeEvent() : void
      {
         _panel.removeEventListener(Event.OPEN,onOpenHandler);
         _panel["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      private function onNONOchange(e:Event) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event("nonobookchange"));
      }
      
      public function addEvent() : void
      {
         _panel["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _panel.addEventListener(Event.OPEN,onOpenHandler);
         _panel.addEventListener("nonobookchange",onNONOchange);
         _panel.addEventListener("changewudou",changewudou);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panel);
      }
      
      private function changewudou(e:Event) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event("changewudou"));
      }
      
      private function showBtn() : void
      {
         for(var i:int = 0; i < 10; i++)
         {
            nr_mc.nr_mc.nr_mc["b" + i].addEventListener(MouseEvent.MOUSE_OVER,overBtnHandler);
         }
      }
   }
}


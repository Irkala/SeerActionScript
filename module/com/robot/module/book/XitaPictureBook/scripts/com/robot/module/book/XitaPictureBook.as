package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.uic.UIProPageBar;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.DepthManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class XitaPictureBook extends Sprite implements IModule
   {
      
      private var _picMc:MovieClip;
      
      private var _proBar:UIProPageBar;
      
      private var _dragBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:Sprite;
      
      public function XitaPictureBook()
      {
         super();
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function destroy() : void
      {
         hide();
         _proBar.destroy();
         _proBar = null;
      }
      
      private function onClick(e:DynamicEvent) : void
      {
         _picMc.gotoAndStop((e.paramObject as int) + 1);
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(_mainUI);
         _mainUI.startDrag();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _proBar.removeEventListener(MouseEvent.CLICK,onClick);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _proBar.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      public function setup() : void
      {
         _mainUI = new UI_XitaPictureBook();
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         _picMc = _mainUI["picMc"];
         _picMc.gotoAndStop(1);
         _proBar = new UIProPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],1);
         _proBar.totalLength = _picMc.totalFrames;
      }
   }
}


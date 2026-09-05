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
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class RoomBook extends Sprite implements IModule
   {
      
      private var _proBar:UIProPageBar;
      
      private var _buyBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _pageMc:MovieClip;
      
      private var _mainUI:Sprite;
      
      private var _nonoBtn:MovieClip;
      
      public function RoomBook()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _proBar.destroy();
         _proBar = null;
         _closeBtn = null;
         _buyBtn = null;
         _pageMc = null;
         _mainUI = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onNonoDown(e:MouseEvent) : void
      {
         _nonoBtn.gotoAndStop(_nonoBtn.totalFrames);
      }
      
      public function setup() : void
      {
         _mainUI = new UI_RoomBookPanel();
         _closeBtn = _mainUI["closeBtn"];
         _pageMc = _mainUI["pageMc"];
         _nonoBtn = _mainUI["nonoBtn"];
         _nonoBtn.buttonMode = true;
         _nonoBtn.mouseChildren = false;
         _nonoBtn.gotoAndStop(1);
         _pageMc.gotoAndStop(1);
         _proBar = new UIProPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],1);
         _proBar.totalLength = _pageMc.totalFrames;
         _mainUI.x = 115;
         _mainUI.y = 50;
      }
      
      private function onNonoOut(e:MouseEvent) : void
      {
         _nonoBtn.removeEventListener(Event.ENTER_FRAME,onNonoFrame);
         _nonoBtn.gotoAndStop(1);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onNonoPage(e:MouseEvent) : void
      {
         _proBar.index = 25;
      }
      
      private function onProBarClick(e:DynamicEvent) : void
      {
         _pageMc.gotoAndStop(e.paramObject + 1);
      }
      
      private function onNonoFrame(e:Event) : void
      {
         if(_nonoBtn.currentFrame == _nonoBtn.totalFrames - 1)
         {
            _nonoBtn.removeEventListener(Event.ENTER_FRAME,onNonoFrame);
            _nonoBtn.gotoAndStop(_nonoBtn.totalFrames - 1);
         }
      }
      
      private function onNonoOver(e:MouseEvent) : void
      {
         _nonoBtn.gotoAndPlay(2);
         _nonoBtn.addEventListener(Event.ENTER_FRAME,onNonoFrame);
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _nonoBtn.removeEventListener(MouseEvent.ROLL_OVER,onNonoOver);
         _nonoBtn.removeEventListener(MouseEvent.ROLL_OUT,onNonoOut);
         _nonoBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onNonoDown);
         _nonoBtn.removeEventListener(MouseEvent.MOUSE_UP,onNonoPage);
         _nonoBtn.removeEventListener(Event.ENTER_FRAME,onNonoFrame);
         _proBar.removeEventListener(MouseEvent.CLICK,onProBarClick);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _nonoBtn.addEventListener(MouseEvent.ROLL_OVER,onNonoOver);
         _nonoBtn.addEventListener(MouseEvent.ROLL_OUT,onNonoOut);
         _nonoBtn.addEventListener(MouseEvent.MOUSE_DOWN,onNonoDown);
         _nonoBtn.addEventListener(MouseEvent.MOUSE_UP,onNonoPage);
         _proBar.addEventListener(MouseEvent.CLICK,onProBarClick);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         _mainUI["pageMc"].gotoAndStop(1);
         _proBar.index = 1;
         LevelManager.appLevel.addChild(_mainUI);
         addEvent();
      }
   }
}


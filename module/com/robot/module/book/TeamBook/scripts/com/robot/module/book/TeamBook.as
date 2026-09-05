package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.uic.UIProPageBar;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TeamBook extends Sprite implements IModule
   {
      
      private var _proBar:UIProPageBar;
      
      private var _buyBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _pageMc:MovieClip;
      
      private var _mainUI:Sprite;
      
      public function TeamBook()
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
      
      public function setup() : void
      {
         _mainUI = new UI_TeamBook();
         _closeBtn = _mainUI["closeBtn"];
         _pageMc = _mainUI["pageMc"];
         _pageMc.gotoAndStop(1);
         _proBar = new UIProPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],1);
         _proBar.totalLength = _pageMc.totalFrames;
         _mainUI.x = 115;
         _mainUI.y = 50;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
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
      
      private function onProBarClick(e:DynamicEvent) : void
      {
         _pageMc.gotoAndStop(e.paramObject + 1);
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _proBar.removeEventListener(MouseEvent.CLICK,onProBarClick);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _proBar.addEventListener(MouseEvent.CLICK,onProBarClick);
      }
   }
}


package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class StoneBook_534 extends Sprite implements IModule
   {
      
      private var _closeBTN:SimpleButton;
      
      private var _nextBTN:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var _prevBTN:SimpleButton;
      
      public function StoneBook_534()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         _closeBTN.removeEventListener(MouseEvent.CLICK,hide);
         _prevBTN.removeEventListener(MouseEvent.CLICK,onPrevClick);
         _nextBTN.removeEventListener(MouseEvent.CLICK,onNextClick);
      }
      
      private function onNextClick(e:MouseEvent) : void
      {
         _prevBTN.visible = true;
         _mainUI.gotoAndStop(_mainUI.currentFrame + 1);
         if(_mainUI.currentFrame == _mainUI.totalFrames)
         {
            _nextBTN.visible = false;
         }
      }
      
      private function onCloseClick(e:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_mainUI))
         {
            DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
            LevelManager.appLevel.addChild(_mainUI);
            _mainUI.gotoAndStop(1);
            _prevBTN.visible = false;
            _closeBTN.addEventListener(MouseEvent.CLICK,onCloseClick);
            _prevBTN.addEventListener(MouseEvent.CLICK,onPrevClick);
            _nextBTN.addEventListener(MouseEvent.CLICK,onNextClick);
         }
      }
      
      private function onPrevClick(e:MouseEvent) : void
      {
         _nextBTN.visible = true;
         _mainUI.gotoAndStop(_mainUI.currentFrame - 1);
         if(_mainUI.currentFrame == 1)
         {
            _prevBTN.visible = false;
         }
      }
      
      public function destroy() : void
      {
         hide();
      }
      
      public function setup() : void
      {
         _mainUI = new StoneBookUI_534();
         _closeBTN = _mainUI["close_btn"];
         _prevBTN = _mainUI["prev_btn"];
         _nextBTN = _mainUI["next_btn"];
      }
   }
}


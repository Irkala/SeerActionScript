package com.robot.module.app
{
   import com.robot.core.info.FitmentInfo;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetFitmentJNPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      public function PetFitmentJNPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      private function onClick(e:MouseEvent) : void
      {
         hide();
      }
      
      public function init(data:Object = null) : void
      {
         var info:FitmentInfo = data as FitmentInfo;
         if(info)
         {
            _mainUI.gotoAndStop("n" + info.id.toString());
         }
      }
      
      public function setup() : void
      {
         _mainUI = new UI_PetFitmentPanel();
         _closeBtn = _mainUI["closeBtn"];
      }
      
      public function destroy() : void
      {
         hide();
         _closeBtn = null;
         _mainUI = null;
      }
   }
}


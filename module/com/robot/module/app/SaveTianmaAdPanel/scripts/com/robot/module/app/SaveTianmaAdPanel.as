package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.ModuleManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SaveTianmaAdPanel extends Sprite implements IModule
   {
      
      private var _mainUI:SaveTianmaAdPanel_UI;
      
      public function SaveTianmaAdPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onCloseClick(event:MouseEvent) : void
      {
         _mainUI["close"].removeEventListener(MouseEvent.CLICK,onCloseClick);
         DisplayUtil.removeForParent(_mainUI,false);
         ModuleManager.destroyForInstance(this);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new SaveTianmaAdPanel_UI();
         _mainUI["close"].addEventListener(MouseEvent.CLICK,onCloseClick);
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
      }
   }
}


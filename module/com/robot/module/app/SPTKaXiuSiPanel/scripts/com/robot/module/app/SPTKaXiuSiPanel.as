package com.robot.module.app
{
   import com.robot.core.event.MapEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class SPTKaXiuSiPanel extends Sprite implements IModule
   {
      
      private var _mainUI:sptKaXiuSiPanelUI;
      
      public function SPTKaXiuSiPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         this._mainUI["closeBtn"].removeEventListener(MouseEvent.CLICK,this.onCloseBtn);
         MapManager.removeEventListener(MapEvent.MAP_DESTROY,this.onMap);
         DisplayUtil.removeForParent(this._mainUI);
         this._mainUI = null;
      }
      
      public function hide() : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         this._mainUI = new sptKaXiuSiPanelUI();
      }
      
      public function show() : void
      {
         this._mainUI["closeBtn"].addEventListener(MouseEvent.CLICK,this.onCloseBtn);
         MapManager.addEventListener(MapEvent.MAP_DESTROY,this.onMap);
         LevelManager.appLevel.addChild(this._mainUI);
         DisplayUtil.align(this._mainUI,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onCloseBtn(event:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onMap(event:MapEvent) : void
      {
         this.hide();
      }
   }
}


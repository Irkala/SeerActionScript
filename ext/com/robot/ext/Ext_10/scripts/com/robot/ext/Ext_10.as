package com.robot.ext
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.FitmentInfo;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.mode.AppModel;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_10 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _panel:AppModel;
      
      private var _info:FitmentInfo;
      
      public function Ext_10()
      {
         super();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
         if(_panel)
         {
            _panel.destroy();
            _panel = null;
         }
         _info = null;
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as FitmentInfo;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(_panel == null)
         {
            _panel = ModuleManager.getModule(ClientConfig.getAppModule("PetFitmentJNPanel"),"正在打开精灵发现纪念册");
            _panel.setup();
         }
         _panel.init(_info);
         _panel.show();
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
   }
}


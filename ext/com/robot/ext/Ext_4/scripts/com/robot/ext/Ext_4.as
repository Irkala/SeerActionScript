package com.robot.ext
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.mode.AppModel;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_4 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _panel:AppModel;
      
      public function Ext_4()
      {
         super();
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(_panel == null)
         {
            _panel = new AppModel(ClientConfig.getBookModule("XitaPictureBook"),"正在打开西塔珍贵的回忆图册");
            _panel.setup();
         }
         _panel.show();
      }
      
      public function init(data:Object = null) : void
      {
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
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
   }
}


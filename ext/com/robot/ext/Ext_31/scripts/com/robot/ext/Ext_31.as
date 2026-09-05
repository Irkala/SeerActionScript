package com.robot.ext
{
   import com.robot.app.control.PetBreedController;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_31 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      public function Ext_31()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClick(e:MouseEvent) : void
      {
         PetBreedController.show();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
   }
}


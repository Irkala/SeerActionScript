package com.robot.ext
{
   import com.robot.app.sceneInteraction.PetStorageController;
   import com.robot.core.mode.IFunUnit;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_1 extends Sprite implements IFunUnit
   {
      
      private var _doorMc:MovieClip;
      
      private var _sprite:Sprite;
      
      public function Ext_1()
      {
         super();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.ROLL_OVER,onOver);
         _sprite.removeEventListener(MouseEvent.ROLL_OUT,onOut);
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
         PetStorageController.destroy();
      }
      
      private function onClick(e:MouseEvent) : void
      {
         PetStorageController.show();
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.ROLL_OVER,onOver);
         _sprite.addEventListener(MouseEvent.ROLL_OUT,onOut);
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
         _doorMc = _sprite["doorMc"];
         _doorMc.addEventListener(Event.ENTER_FRAME,function(e:Event):void
         {
            _doorMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
            _doorMc.gotoAndStop(1);
         });
      }
      
      private function onOut(e:MouseEvent) : void
      {
         _doorMc.gotoAndStop(1);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onOver(e:MouseEvent) : void
      {
         _doorMc.play();
      }
   }
}


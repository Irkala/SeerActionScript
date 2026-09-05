package com.robot.ext
{
   import com.robot.core.info.FitmentInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_11 extends Sprite implements IFunUnit
   {
      
      private static var _mask:Shape;
      
      private var _sprite:Sprite;
      
      private var _info:FitmentInfo;
      
      public function Ext_11()
      {
         super();
      }
      
      private function onClick(e:MouseEvent) : void
      {
         setStatus();
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as FitmentInfo;
         setStatus();
      }
      
      private function setStatus() : void
      {
         if(_info.status)
         {
            if(_mask)
            {
               DisplayUtil.removeForParent(_mask);
            }
         }
         else
         {
            if(_mask == null)
            {
               _mask = new Shape();
               _mask.graphics.beginFill(0,0.5);
               _mask.graphics.drawRect(0,0,960,560);
               _mask.graphics.endFill();
            }
            LevelManager.mapLevel.addChild(_mask);
         }
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
         if(_mask)
         {
            DisplayUtil.removeForParent(_mask);
            _mask = null;
         }
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
   }
}


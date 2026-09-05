package com.robot.ext
{
   import com.robot.core.mode.AppModel;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.Utils;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_3 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _panel:AppModel;
      
      public function Ext_3()
      {
         super();
      }
      
      private function onClick(param1:MouseEvent) : void
      {
         var _loc2_:Class = null;
         _loc2_ = Utils.getClass("com.robot.app.nono.featureApp.App_700002");
         if(Boolean(_loc2_))
         {
            new _loc2_(uint(700002));
         }
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         this._sprite.removeEventListener(MouseEvent.CLICK,this.onClick);
         DisplayUtil.removeForParent(this._sprite);
         this._sprite = null;
         if(this._panel)
         {
            this._panel.destroy();
            this._panel = null;
         }
      }
      
      public function setup(param1:Sprite) : void
      {
         this._sprite = param1;
         this._sprite.addEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
}


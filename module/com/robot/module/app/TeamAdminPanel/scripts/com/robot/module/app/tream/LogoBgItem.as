package com.robot.module.app.tream
{
   import com.robot.core.manager.TaskIconManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import org.taomee.utils.DisplayUtil;
   
   public class LogoBgItem extends Sprite
   {
      
      public var num:uint;
      
      public var clsStr:String;
      
      private var isShowBg:Boolean;
      
      public var icon:MovieClip;
      
      public function LogoBgItem(isShowBg:Boolean = true)
      {
         var mc:MovieClip = null;
         super();
         this.isShowBg = isShowBg;
         this.mouseChildren = false;
         this.buttonMode = isShowBg;
         if(isShowBg)
         {
            mc = new ui_logoIconBg();
            addChild(mc);
         }
         addEventListener(MouseEvent.MOUSE_OVER,overBg);
         addEventListener(MouseEvent.MOUSE_OUT,outBg);
      }
      
      private function overBg(event:MouseEvent) : void
      {
         this.filters = [new GlowFilter(16711680,1,4,4,9)];
      }
      
      private function outBg(event:MouseEvent) : void
      {
         this.filters = [];
      }
      
      public function clear() : void
      {
         DisplayUtil.removeForParent(icon);
         this.mouseEnabled = false;
      }
      
      public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,overBg);
         removeEventListener(MouseEvent.MOUSE_OUT,outBg);
         icon = null;
      }
      
      public function set info(num:uint) : void
      {
         this.num = num;
         DisplayUtil.removeForParent(icon);
         clsStr = "icon_bg_" + num;
         icon = TaskIconManager.getIcon(clsStr) as MovieClip;
         var rect:Rectangle = icon.getRect(icon);
         if(isShowBg)
         {
            icon.x = (this.width - icon.width) / 2 - rect.x;
            icon.y = (this.height - icon.height) / 2 - rect.y;
         }
         else
         {
            icon.x = -rect.x;
            icon.y = -rect.y;
         }
         addChild(icon);
         this.mouseEnabled = true;
      }
   }
}


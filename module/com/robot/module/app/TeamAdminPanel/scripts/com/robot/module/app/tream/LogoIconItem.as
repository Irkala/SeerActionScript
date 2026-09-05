package com.robot.module.app.tream
{
   import com.robot.core.manager.TaskIconManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class LogoIconItem extends Sprite
   {
      
      private var txt_mc:MovieClip;
      
      public var num:uint;
      
      public var clsStr:String;
      
      public var icon:MovieClip;
      
      public var txt:TextField;
      
      private var isShowBg:Boolean;
      
      public var colorMC:MovieClip;
      
      public function LogoIconItem(isShowBg:Boolean = true)
      {
         var mc:MovieClip = null;
         super();
         this.isShowBg = isShowBg;
         this.mouseChildren = false;
         this.buttonMode = isShowBg;
         if(isShowBg)
         {
            mc = new ui_logoIconBg();
            mc.width = mc.height = 60;
            addChild(mc);
         }
         addEventListener(MouseEvent.MOUSE_OVER,overBg);
         addEventListener(MouseEvent.MOUSE_OUT,outBg);
      }
      
      private function outBg(event:MouseEvent) : void
      {
         this.filters = [];
      }
      
      public function destroy() : void
      {
         removeEventListener(MouseEvent.MOUSE_OVER,overBg);
         removeEventListener(MouseEvent.MOUSE_OUT,outBg);
         icon = null;
      }
      
      public function clear() : void
      {
         DisplayUtil.removeForParent(icon);
         this.mouseEnabled = false;
      }
      
      private function overBg(event:MouseEvent) : void
      {
         this.filters = [new GlowFilter(16711680,1,4,4,9)];
      }
      
      public function set info(num:uint) : void
      {
         this.num = num;
         DisplayUtil.removeForParent(icon);
         clsStr = "icon_" + num;
         icon = TaskIconManager.getIcon(clsStr) as MovieClip;
         colorMC = icon["colorMC"];
         DisplayUtil.removeForParent(txt);
         txt_mc = new txtMC();
         txt = txt_mc["txt"];
         txt.selectable = false;
         icon.addChild(txt_mc);
         DisplayUtil.align(txt_mc,colorMC.getRect(icon),AlignType.MIDDLE_CENTER);
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


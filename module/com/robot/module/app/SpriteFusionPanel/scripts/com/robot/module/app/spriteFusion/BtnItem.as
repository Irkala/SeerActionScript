package com.robot.module.app.spriteFusion
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class BtnItem extends Sprite
   {
      
      private var _info:BtnInfo;
      
      private var _mc:MovieClip;
      
      private var _icon:Sprite;
      
      public var type:uint;
      
      public function BtnItem()
      {
         super();
         _mc = new BtnItemBg();
         _mc.gotoAndStop(1);
         this.addChild(_mc);
         _icon = new Sprite();
         this.addChild(_icon);
      }
      
      public function get info() : BtnInfo
      {
         return _info;
      }
      
      public function get mc() : MovieClip
      {
         return _mc;
      }
      
      public function set info(i:BtnInfo) : void
      {
         _info = i;
         if(i)
         {
            ResourceManager.getResource(ItemXMLInfo.getIconURL(i.itemInfo.itemID),function(icon:MovieClip):void
            {
               DisplayUtil.removeAllChild(_icon);
               _icon.addChild(icon);
               icon.scaleX = 0.85;
               icon.scaleY = 0.85;
               ToolTipManager.add(_icon,ItemXMLInfo.getName(i.itemInfo.itemID));
            });
         }
      }
   }
}


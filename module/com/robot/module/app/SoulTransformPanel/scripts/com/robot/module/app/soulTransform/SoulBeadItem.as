package com.robot.module.app.soulTransform
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class SoulBeadItem extends Sprite
   {
      
      private var _mc:MovieClip;
      
      private var _icon:Sprite;
      
      private var _info:SoulBeadInfo;
      
      public function SoulBeadItem()
      {
         super();
         _mc = new SoulBeadItemBg();
         _mc.gotoAndStop(1);
         this.addChild(_mc);
         _icon = new Sprite();
         this.addChild(_icon);
      }
      
      public function get mc() : MovieClip
      {
         return _mc;
      }
      
      public function set info(i:SoulBeadInfo) : void
      {
         var url:String = null;
         _info = i;
         if(i.itemID != 0)
         {
            url = "resource/soulBead/icon/" + i.itemID + ".swf";
            ResourceManager.getResource(url,function(m:MovieClip):void
            {
               if(m)
               {
                  DisplayUtil.removeAllChild(_icon);
                  _icon.addChild(m);
                  m.scaleX = 1.5;
                  m.scaleY = 1.5;
               }
            });
         }
         else
         {
            DisplayUtil.removeAllChild(_icon);
         }
      }
      
      public function get info() : SoulBeadInfo
      {
         return _info;
      }
   }
}


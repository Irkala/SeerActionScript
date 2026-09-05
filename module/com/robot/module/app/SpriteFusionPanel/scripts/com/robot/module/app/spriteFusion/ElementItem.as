package com.robot.module.app.spriteFusion
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ElementItem extends Sprite
   {
      
      private var _info:ElementItemInfo;
      
      private var _mc:MovieClip;
      
      private var _icon:Sprite;
      
      public var type:uint;
      
      public function ElementItem()
      {
         super();
         _mc = new ElementItemBg();
         _mc.gotoAndStop(1);
         this.addChild(_mc);
         _icon = _mc["icon"];
      }
      
      public function setNum(n:int) : void
      {
         if(n <= 0)
         {
            setVisibel(false);
         }
         else
         {
            setVisibel(true);
         }
         _mc["cntTxt"].text = n;
      }
      
      public function get info() : ElementItemInfo
      {
         return _info;
      }
      
      public function get mc() : MovieClip
      {
         return _mc;
      }
      
      public function set info(i:ElementItemInfo) : void
      {
         _info = i;
         if(i)
         {
            ResourceManager.getResource(ItemXMLInfo.getIconURL(i.info.itemID),function(icon:MovieClip):void
            {
               DisplayUtil.removeAllChild(_icon);
               _icon.addChild(icon);
               icon.scaleX = 0.75;
               icon.scaleY = 0.75;
               ToolTipManager.add(_icon,ItemXMLInfo.getName(i.info.itemID));
               setNum(i.num);
            });
         }
         else
         {
            DisplayUtil.removeAllChild(_icon);
            setVisibel(false);
         }
      }
      
      private function setVisibel(b:Boolean) : void
      {
         if(!b)
         {
            _icon.visible = false;
            _mc["cntTxt"].visible = false;
            this.buttonMode = false;
            this.mouseEnabled = false;
            this.mouseChildren = false;
         }
         else
         {
            _icon.visible = true;
            _mc["cntTxt"].visible = true;
            this.buttonMode = true;
            this.mouseEnabled = true;
            this.mouseChildren = true;
         }
      }
   }
}


package com.robot.module.app.doodle
{
   import com.robot.core.config.xml.DoodleXMLInfo;
   import com.robot.core.info.item.DoodleInfo;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class DoodleListItem extends Sprite
   {
      
      private var _itemMc:Sprite;
      
      private var _colorMc:MovieClip;
      
      private var _info:DoodleInfo;
      
      public var index:int;
      
      private var _showMc:DisplayObject;
      
      private var _bgMc:MovieClip;
      
      public function DoodleListItem()
      {
         super();
         buttonMode = true;
         _itemMc = new UI_DoodleItemMc();
         _bgMc = _itemMc["bgMc"];
         _colorMc = _itemMc["colorMc"];
         addChild(_itemMc);
         _bgMc.visible = false;
      }
      
      private function onResLoad(o:DisplayObject) : void
      {
         _showMc = o;
         _showMc.x = _colorMc.x;
         _showMc.y = _colorMc.y + 15;
         _showMc.width = _colorMc.width;
         _showMc.height = _colorMc.height - 15;
         addChild(_showMc);
      }
      
      public function get info() : DoodleInfo
      {
         return _info;
      }
      
      public function setInfo(id:uint) : void
      {
         if(_info)
         {
            ResourceManager.cancel(_info.preURL,onResLoad);
         }
         _info = new DoodleInfo();
         _info.id = id;
         _info.color = DoodleXMLInfo.getColor(id);
         _info.price = DoodleXMLInfo.getPrice(id);
         _info.texture = DoodleXMLInfo.getTexture(id);
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         if(_info.texture != 0)
         {
            _info.URL = DoodleXMLInfo.getSwfURL(_info.texture);
            _info.preURL = DoodleXMLInfo.getPrevURL(_info.texture);
            ResourceManager.getResource(_info.preURL,onResLoad);
         }
         if(_info.color == 3355443)
         {
            _colorMc.visible = false;
         }
         else
         {
            _colorMc.visible = true;
            DisplayUtil.FillColor(_colorMc,_info.color);
         }
      }
      
      public function destroy() : void
      {
         _info = null;
         _showMc = null;
         _colorMc = null;
      }
      
      public function setSelect(b:Boolean) : void
      {
         if(b)
         {
            _bgMc.visible = true;
         }
         else
         {
            _bgMc.visible = false;
         }
      }
   }
}


package com.robot.module.app.xinpian
{
   import com.robot.core.config.ClientConfig;
   import flash.display.Loader;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.geom.Rectangle;
   import flash.net.URLRequest;
   import flash.text.TextField;
   import org.taomee.effect.ColorFilter;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.Utils;
   
   public class XinpianListItem extends Sprite
   {
      
      private var _sprite:Sprite;
      
      private var _load:Loader;
      
      private var _info:XinpianInfo;
      
      private var _txt:TextField;
      
      private var _newmc:Sprite;
      
      private var _hasmc:Sprite;
      
      private var _obj:Sprite;
      
      public function XinpianListItem()
      {
         super();
         _sprite = new UI_XinpianLQ_ListItem();
         _newmc = _sprite["newMc"];
         _hasmc = _sprite["hasMc"];
         _txt = _sprite["txt"];
         _newmc.visible = false;
         _hasmc.visible = false;
         _load = new Loader();
         _load.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoad);
         addChild(_sprite);
      }
      
      public function destroy() : void
      {
         _load.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoad);
         _load.unload();
         _load = null;
         _newmc = null;
         _hasmc = null;
         _txt = null;
         _sprite = null;
      }
      
      public function setHas(b:Boolean) : void
      {
         _hasmc.visible = b;
      }
      
      private function onLoad(e:Event) : void
      {
         var cla:Class = Utils.getClassFromLoader("item",_load);
         if(_load)
         {
            _obj = new cla() as Sprite;
            DisplayUtil.uniformScale(_obj,100);
            DisplayUtil.align(_obj,new Rectangle(0,20,110,120),AlignType.MIDDLE_CENTER);
            addChild(_obj);
            if(_info.isHas)
            {
               _obj.filters = [ColorFilter.setBrightness(-50)];
            }
            else
            {
               _obj.filters = [new GlowFilter(65535,1,15,15)];
            }
         }
      }
      
      public function clear() : void
      {
         _load.unload();
         if(_obj)
         {
            DisplayUtil.removeForParent(_obj);
            _obj = null;
         }
         _txt.text = "";
         _newmc.visible = false;
         _hasmc.visible = false;
         _info = null;
      }
      
      public function get info() : XinpianInfo
      {
         return _info;
      }
      
      public function set info(i:XinpianInfo) : void
      {
         _info = i;
         if(_info.isHas)
         {
            _hasmc.visible = true;
         }
         else if(_info.isNew)
         {
            _newmc.visible = true;
         }
         _txt.text = _info.name;
         if(_obj)
         {
            DisplayUtil.removeForParent(_obj);
            _obj = null;
         }
         _load.load(new URLRequest(ClientConfig.getNonoPath("chipprev/" + _info.id.toString())));
      }
      
      public function setNew(b:Boolean) : void
      {
         _newmc.visible = b;
      }
   }
}


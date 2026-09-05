package com.robot.module.app.machineDog
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class MixtureBgPanel extends Sprite
   {
      
      private var _bgMc:ChipMaterial_MC;
      
      private var _info:ExchangeItemInfo;
      
      private var _id:uint;
      
      private var _engMc:MovieClip;
      
      public function MixtureBgPanel()
      {
         super();
         _bgMc = new ChipMaterial_MC();
         addChild(_bgMc);
      }
      
      public function addIcon(info:ExchangeItemInfo) : void
      {
         if(info)
         {
            _info = info;
            _bgMc["txt"].text = String(_info.itemNum);
            _bgMc["txt"].mouseEnabled = false;
            ToolTipManager.add(this,_info.itemName);
            ResourceManager.getResource(ItemXMLInfo.getIconURL(_info.itemId),onComHandler);
         }
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         if(_engMc)
         {
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
         _engMc = mc as MovieClip;
         if(_engMc)
         {
            _bgMc["mc"].addChild(_engMc);
            _engMc.x = (_bgMc.width - _engMc.width) / 2;
            _engMc.y = (_bgMc.height - _engMc.height) / 2;
         }
      }
      
      public function addIconForId(id:uint) : void
      {
         _id = id;
         _bgMc["txt"].text = "";
         _bgMc["txt"].mouseEnabled = false;
         ToolTipManager.add(this,ItemXMLInfo.getName(id));
         ResourceManager.getResource(ItemXMLInfo.getIconURL(_id),onComHandler);
      }
      
      public function get chip() : MovieClip
      {
         var bt:BitmapData = new BitmapData(_engMc.width,_engMc.height);
         bt.draw(_engMc);
         var bp:Bitmap = new Bitmap();
         bp.bitmapData = bt;
         var sp:MovieClip = new MovieClip();
         sp.addChild(bp);
         return sp;
      }
      
      public function get info() : ExchangeItemInfo
      {
         return _info;
      }
      
      public function set info(info:ExchangeItemInfo) : void
      {
         _info = info;
         _bgMc["txt"].text = String(_info.itemNum);
      }
      
      public function removeIcon() : void
      {
         if(_bgMc)
         {
            _bgMc["txt"].text = "";
         }
         if(_engMc)
         {
            DisplayUtil.removeForParent(_engMc);
            _engMc = null;
         }
         if(_info)
         {
            ResourceManager.cancel(ItemXMLInfo.getIconURL(_info.itemId),onComHandler);
            _info = null;
            ToolTipManager.remove(this);
         }
      }
   }
}


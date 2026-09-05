package com.robot.module.app.machineDog
{
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.MainManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ChipListItem extends Sprite
   {
      
      private var _bgMc:ChipItem_MC;
      
      private var _info:SingleItemInfo;
      
      private var _iconMc:DisplayObject;
      
      public function ChipListItem()
      {
         super();
         _bgMc = new ChipItem_MC();
         this.addChild(_bgMc);
      }
      
      public function clear() : void
      {
         if(_bgMc)
         {
            ToolTipManager.remove(_bgMc);
            _bgMc["txt"].text = "";
         }
         if(_iconMc)
         {
            DisplayUtil.removeForParent(_iconMc);
            _iconMc = null;
         }
         if(_info)
         {
            ResourceManager.cancel(ItemXMLInfo.getIconURL(_info.itemID),onCancelHandler);
            _info = null;
         }
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         _iconMc = mc;
         _iconMc.x = (_bgMc.width - _iconMc.width) / 2;
         _iconMc.y = (_bgMc.height - _iconMc.height) / 2;
         _bgMc["mc"].addChild(_iconMc);
         if(MainManager.actorInfo.vip == 1 && (_iconMc as MovieClip).totalFrames > 1)
         {
            (_iconMc as MovieClip).gotoAndStop("vip");
         }
      }
      
      private function onCancelHandler(mc:DisplayObject) : void
      {
      }
      
      public function get info() : SingleItemInfo
      {
         return _info;
      }
      
      public function set info(info:SingleItemInfo) : void
      {
         _info = info;
         _bgMc["txt"].text = _info.itemNum.toString();
      }
      
      public function show(info:SingleItemInfo) : void
      {
         var name:String = null;
         _info = info;
         _bgMc["txt"].text = _info.itemNum.toString();
         if(MainManager.actorInfo.vip == 1)
         {
            name = ItemXMLInfo.getItemVipName(_info.itemID);
            if(name == "")
            {
               name = ItemXMLInfo.getName(_info.itemID);
            }
         }
         else
         {
            name = ItemXMLInfo.getName(_info.itemID);
         }
         ToolTipManager.add(_bgMc,name);
         ResourceManager.getResource(ItemXMLInfo.getIconURL(_info.itemID),onComHandler);
      }
   }
}


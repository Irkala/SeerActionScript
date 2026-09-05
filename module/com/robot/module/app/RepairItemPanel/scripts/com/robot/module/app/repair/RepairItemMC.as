package com.robot.module.app.repair
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.item.ClothInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class RepairItemMC extends Sprite
   {
      
      public static const REPAIR:String = "repair";
      
      private var container:MovieClip;
      
      private var _itemID:uint;
      
      private var repairBtn:SimpleButton;
      
      private var mc:MovieClip;
      
      public function RepairItemMC()
      {
         super();
         mc = new repair_listMC();
         addChild(mc);
         repairBtn = mc["repairBtn"];
         container = mc["container"];
         repairBtn.addEventListener(MouseEvent.CLICK,repairHandler);
      }
      
      private function onLoad(o:DisplayObject) : void
      {
         DisplayUtil.align(o,container.getBounds(container),AlignType.MIDDLE_CENTER);
         container.addChild(o);
      }
      
      public function get itemID() : uint
      {
         return _itemID;
      }
      
      public function destroy() : void
      {
         repairBtn.removeEventListener(MouseEvent.CLICK,repairHandler);
         mc = null;
         repairBtn = null;
         container = null;
      }
      
      public function set itemID(i:uint) : void
      {
         var info:SingleItemInfo = ItemManager.getClothInfo(i);
         mc["time_txt"].text = ItemXMLInfo.getName(i);
         mc["info_txt"].text = "修复价格:" + ClothInfo.getItemInfo(i).repairPrice;
         _itemID = i;
         ResourceManager.getResource(ItemXMLInfo.getIconURL(_itemID),onLoad,"item");
      }
      
      private function repairHandler(event:MouseEvent) : void
      {
         dispatchEvent(new Event(REPAIR));
         SocketConnection.send(CommandID.ITEM_REPAIR,1,itemID);
      }
   }
}


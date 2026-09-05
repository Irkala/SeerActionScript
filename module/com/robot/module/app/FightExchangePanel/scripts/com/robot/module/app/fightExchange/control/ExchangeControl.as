package com.robot.module.app.fightExchange.control
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.config.xml.TopFightExchangeXMLInfo;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.FightExchangePanel;
   import com.robot.module.app.fightExchange.mode.ExchangeCategoryData;
   import com.robot.module.app.fightExchange.mode.ExchangeItemData;
   import com.robot.module.app.fightExchange.view.MainView;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   
   public class ExchangeControl
   {
      
      private static var _categoryExchangeArr:Array;
      
      private static var _exchangeItem:ExchangeItemData;
      
      private static var _itemName:String;
      
      private static var _mainView:MainView;
      
      private static var _exchangeTipPanel:ExchangeTipPanelControl;
      
      public static var _honorValue:uint = 0;
      
      public function ExchangeControl(param1:FightExchangePanel)
      {
         super();
      }
      
      public static function get honorValue() : uint
      {
         return _honorValue;
      }
      
      public static function set honorValue(param1:uint) : void
      {
         _honorValue = param1;
      }
      
      public static function get categoryExchangeArr() : Array
      {
         return _categoryExchangeArr;
      }
      
      public static function setup(param1:MainView) : void
      {
         _mainView = param1;
         var _loc2_:* = 0;
         var _loc3_:ExchangeItemData = null;
         var _loc4_:Array = null;
         _categoryExchangeArr = [];
         var _loc5_:ExchangeCategoryData = new ExchangeCategoryData();
         _loc5_.catoryName = "精灵";
         var _loc6_:ExchangeCategoryData = new ExchangeCategoryData();
         _loc6_.catoryName = "装备";
         var _loc7_:ExchangeCategoryData = new ExchangeCategoryData();
         _loc7_.catoryName = "其它";
         var _loc8_:XMLList = TopFightExchangeXMLInfo.getExchangeList();
         var _loc9_:uint = uint(_loc8_.length());
         _loc2_ = int(_loc9_ - 1);
         while(_loc2_ >= 0)
         {
            trace("111111111111111111开始for循环" + _loc2_);
            _loc3_ = new ExchangeItemData(_loc8_[_loc2_]);
            switch(_loc3_.type)
            {
               case 1:
                  _loc5_.childrenItems.push(_loc3_);
                  break;
               case 2:
                  _loc6_.childrenItems.push(_loc3_);
                  break;
               case 3:
                  _loc7_.childrenItems.push(_loc3_);
            }
            _loc2_--;
         }
         _categoryExchangeArr.push(_loc5_);
         _categoryExchangeArr.push(_loc6_);
         _categoryExchangeArr.push(_loc7_);
      }
      
      public static function exchangeItem(param1:ExchangeItemData) : void
      {
         _exchangeItem = param1;
         if(_exchangeItem.type == 2 || _exchangeItem.type == 3)
         {
            _itemName = ItemXMLInfo.getName(_exchangeItem.itemID);
         }
         else
         {
            _itemName = PetXMLInfo.getName(_exchangeItem.itemID);
         }
         if(_exchangeItem.curExchange == 0)
         {
            Alarm.show("此物品可兑换数为0,无法兑换");
            return;
         }
         if(_exchangeTipPanel != null)
         {
            _exchangeTipPanel.destroy();
            _exchangeTipPanel = null;
         }
         _exchangeTipPanel = new ExchangeTipPanelControl();
         _exchangeTipPanel.setup();
         _exchangeTipPanel.init(_exchangeItem);
         _exchangeTipPanel.show();
      }
      
      private static function onExchangeHandler(param1:SocketEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:* = 0;
         var _loc5_:* = 0;
         SocketConnection.removeCmdListener(CommandID.EXCHANGE_ITEM,onExchangeHandler);
         Alarm.show("一个 <font color=\'#ff0000\'>" + _itemName + "</font>已经放到你的背包中了");
         var _loc6_:ByteArray = param1.data as ByteArray;
         var _loc7_:uint = _loc6_.readUnsignedInt();
         var _loc8_:uint = _loc6_.readUnsignedInt();
         var _loc9_:uint = _loc6_.readUnsignedInt();
         var _loc10_:uint = _loc6_.readUnsignedInt();
         var _loc11_:Number = 0;
         while(_loc11_ < _loc10_)
         {
            _loc2_ = _loc6_.readUnsignedInt();
            _loc3_ = _loc6_.readUnsignedInt();
            _loc11_++;
         }
      }
   }
}


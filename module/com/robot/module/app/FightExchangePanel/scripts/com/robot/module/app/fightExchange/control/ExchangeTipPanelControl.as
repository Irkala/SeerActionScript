package com.robot.module.app.fightExchange.control
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.PetInBagAlert;
   import com.robot.core.ui.alert.PetInStorageAlert;
   import com.robot.module.app.fightExchange.mode.ExChangeItemSuccessInfo;
   import com.robot.module.app.fightExchange.mode.ExchangeItemData;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class ExchangeTipPanelControl
   {
      
      private var _panel:ExChangeTipPanelMc;
      
      private var _cancelBtn:SimpleButton;
      
      private var _sureBtn:SimpleButton;
      
      private var _propTxt:TextField;
      
      private var _itemid:int = -1;
      
      private var _iconMc:Sprite;
      
      private var _preBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _numTxt:TextField;
      
      private var _nextBtn:SimpleButton;
      
      private var _itemCount:uint = 1;
      
      private var _exchangeItem:ExchangeItemData;
      
      private var _itemName:String;
      
      public function ExchangeTipPanelControl()
      {
         super();
      }
      
      private static function onPetAddBag(param1:PetEvent) : void
      {
         PetManager.removeEventListener(PetEvent.ADDED,onPetAddBag);
      }
      
      public function destroy() : void
      {
         this.hide();
         this._panel = null;
         this._sureBtn = null;
         this._cancelBtn = null;
         this._propTxt = null;
         this._preBtn = null;
         this._nextBtn = null;
         this._numTxt = null;
         this._closeBtn = null;
         this._iconMc = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._panel);
         this.removeEvent();
      }
      
      private function removeEvent() : void
      {
         this._numTxt.removeEventListener(Event.CHANGE,this.onNumChangeHandler);
         this._sureBtn.removeEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         this._cancelBtn.removeEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
         this._preBtn.removeEventListener(MouseEvent.CLICK,this.onPreClickHandler);
         this._nextBtn.removeEventListener(MouseEvent.CLICK,this.onNextClickHandler);
         DragManager.remove(this._panel["dragMc"]);
      }
      
      public function setup() : void
      {
         this._panel = new ExChangeTipPanelMc();
         this._sureBtn = this._panel["sureBtn"];
         this._cancelBtn = this._panel["cancelBtn"];
         this._propTxt = this._panel["propTxt"];
         this._preBtn = this._panel["preBtn"];
         this._nextBtn = this._panel["nextBtn"];
         this._numTxt = this._panel["numTxt"];
         this._numTxt.restrict = "0-9";
         this._numTxt.maxChars = 5;
         this._closeBtn = this._panel["closeBtn"];
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._panel);
         DisplayUtil.align(this._panel,null,AlignType.MIDDLE_CENTER);
         this.addEvent();
         var _loc1_:String = "";
         if(this._exchangeItem.type == 1)
         {
            _loc1_ = ClientConfig.getResPath("pet/head/" + this._itemid + ".swf");
         }
         else
         {
            _loc1_ = ItemXMLInfo.getIconURL(this._itemid);
         }
         ResourceManager.getResource(_loc1_,this.onComHandler);
         this.setCount(1);
         this.setText();
      }
      
      private function onComHandler(param1:DisplayObject) : void
      {
         if(param1)
         {
            if(this._iconMc)
            {
               DisplayUtil.removeForParent(this._iconMc);
               this._iconMc = null;
            }
            this._iconMc = param1 as Sprite;
            this._panel.addChild(this._iconMc);
            this._iconMc.x = (this._panel.width - this._iconMc.width) / 2;
            this._iconMc.y = 50;
            if(this._exchangeItem.type == 1)
            {
               this._iconMc.width = 50;
               this._iconMc.height = 50;
            }
         }
      }
      
      private function onNumChangeHandler(param1:Event) : void
      {
         if(this._numTxt.text == "")
         {
            Alarm.show("你输入的数字不正确!");
            this.setCount(1);
            this.setText();
         }
         else if(this._exchangeItem.type == 1 && uint(this._numTxt.text) > 1)
         {
            this.setCount(1);
            this.setText();
            Alarm.show("宠物兑换数量不能超过1个!");
         }
         else if(uint(this._numTxt.text) > this._exchangeItem.curExchange)
         {
            this.setCount(this._exchangeItem.curExchange);
            this.setText();
         }
         else
         {
            this.setText();
         }
      }
      
      private function setCount(param1:uint) : void
      {
         this._numTxt.text = param1.toString();
      }
      
      private function onCloseClickHandler(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function addEvent() : void
      {
         this._sureBtn.addEventListener(MouseEvent.CLICK,this.onSureClickHandler);
         this._cancelBtn.addEventListener(MouseEvent.CLICK,this.onCancelClickHandler);
         this._numTxt.addEventListener(Event.CHANGE,this.onNumChangeHandler);
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseClickHandler);
         this._preBtn.addEventListener(MouseEvent.CLICK,this.onPreClickHandler);
         this._nextBtn.addEventListener(MouseEvent.CLICK,this.onNextClickHandler);
         DragManager.add(this._panel["dragMc"],this._panel);
      }
      
      private function onSureClickHandler(param1:MouseEvent) : void
      {
         var _loc2_:uint = this._exchangeItem.price;
         if(uint(this._numTxt.text) * _loc2_ > ExchangeControl.honorValue)
         {
            Alarm.show("你所拥有的荣誉点不足!");
            this.setCount(1);
            this.setText();
            return;
         }
         SocketConnection.addCmdListener(CommandID.EXCHANGE_ITEM,this.onExchangeHandler);
         SocketConnection.send(CommandID.EXCHANGE_ITEM,this._exchangeItem.exchangeID,uint(this._numTxt.text));
         this.hide();
      }
      
      private function onExchangeHandler(param1:SocketEvent) : void
      {
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         SocketConnection.removeCmdListener(CommandID.EXCHANGE_ITEM,this.onExchangeHandler);
         var _loc4_:ByteArray = param1.data as ByteArray;
         var _loc5_:uint = _loc4_.readUnsignedInt();
         var _loc6_:uint = _loc4_.readUnsignedInt();
         var _loc7_:uint = _loc4_.readUnsignedInt();
         var _loc8_:uint = _loc4_.readUnsignedInt();
         var _loc9_:Number = 0;
         while(_loc9_ < _loc8_)
         {
            _loc2_ = _loc4_.readUnsignedInt();
            _loc3_ = _loc4_.readUnsignedInt();
            _loc9_++;
         }
         if(_loc3_ == 0)
         {
            _loc3_ = 1;
            if(PetManager.length >= 6)
            {
               PetManager.addStorage(_loc6_,_loc7_);
               Alarm.show(_loc3_.toString() + "个 <font color=\'#ff0000\'>" + this._itemName + "</font>已经放到你的精灵仓库中了");
               PetInStorageAlert.show(_loc6_,"恭喜你获得了<font color=\'#00CC00\'>" + PetXMLInfo.getName(_loc6_) + "</font>，你可以在基地仓库里找到");
            }
            else
            {
               PetManager.addEventListener(PetEvent.ADDED,onPetAddBag);
               PetManager.setIn(_loc7_,1);
               Alarm.show(_loc3_.toString() + "个 <font color=\'#ff0000\'>" + this._itemName + "</font>已经放到你的精灵背包中了");
               PetInBagAlert.show(_loc6_,"恭喜你获得了<font color=\'#00CC00\'>" + PetXMLInfo.getName(_loc6_) + "</font>，你可以在精灵背包里找到");
            }
         }
         else
         {
            Alarm.show(_loc3_.toString() + "个 <font color=\'#ff0000\'>" + this._itemName + "</font>已经放到你的背包中了");
            EventManager.dispatchEvent(new DynamicEvent("exchange_item_success",new ExChangeItemSuccessInfo(_loc2_,_loc3_,_loc5_)));
         }
      }
      
      public function init(param1:ExchangeItemData) : void
      {
         if(this._itemid != -1)
         {
            if(this._exchangeItem.type == 1)
            {
               ResourceManager.cancelURL("pet/head/" + this._itemid + ".swf");
            }
            else
            {
               ResourceManager.cancelURL(ItemXMLInfo.getIconURL(this._itemid));
            }
         }
         this._exchangeItem = param1;
         this._itemid = param1.itemID as uint;
      }
      
      private function onPreClickHandler(param1:MouseEvent) : void
      {
         if(int(this._numTxt.text) > 1)
         {
            this.setCount(uint(this._numTxt.text) - 1);
            this.setText();
         }
      }
      
      private function onNextClickHandler(param1:MouseEvent) : void
      {
         if(this._exchangeItem.type == 1 && uint(this._numTxt.text) + 1 > 1)
         {
            this.setCount(1);
            this.setText();
            Alarm.show("宠物兑换数量不能超过1个!");
            return;
         }
         if(uint(this._numTxt.text) + 1 > this._exchangeItem.curExchange)
         {
            this.setCount(this._exchangeItem.curExchange);
            this.setText();
         }
         else
         {
            this.setCount(uint(this._numTxt.text) + 1);
            this.setText();
         }
      }
      
      private function onCancelClickHandler(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      private function setText() : void
      {
         if(this._exchangeItem.type == 1)
         {
            this._itemName = PetXMLInfo.getName(this._itemid);
         }
         else
         {
            this._itemName = ItemXMLInfo.getName(this._itemid);
         }
         var _loc1_:String = String(this._exchangeItem.price * uint(this._numTxt.text));
         var _loc2_:String = ExchangeControl.honorValue.toString();
         this._propTxt.text = "    " + this._numTxt.text + "个" + this._itemName + "需花费" + _loc1_ + "荣誉点，你现在拥有" + _loc2_ + "荣誉点，要确认兑换吗？";
      }
   }
}


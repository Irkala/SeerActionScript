package com.robot.module.app.fightExchange.view
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.ExchangeInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.ui.itemTip.ItemInfoTip;
   import com.robot.module.app.fightExchange.control.ExchangeControl;
   import com.robot.module.app.fightExchange.mode.ExchangeItemData;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class ItemPanelView extends Sprite
   {
      
      private var _panel:exchangeitempanel;
      
      private var _itemNameTxt:TextField;
      
      private var _itemIconMC:MovieClip;
      
      private var _priceTxt:TextField;
      
      private var _numTxt:TextField;
      
      private var _itemData:ExchangeItemData;
      
      public function ItemPanelView(param1:ExchangeItemData)
      {
         super();
         this._itemData = param1;
         this._panel = new exchangeitempanel();
         this._panel.buttonMode = true;
         addChild(this._panel);
         this._itemNameTxt = this._panel["itemname_txt"];
         this._itemIconMC = this._panel["itemicon_mc"];
         this._itemIconMC.buttonMode = true;
         this._itemIconMC.mouseChildren = false;
         this._itemIconMC.addEventListener(MouseEvent.ROLL_OVER,this.onOverHandler);
         this._itemIconMC.addEventListener(MouseEvent.ROLL_OUT,this.onOutHandler);
         this._itemIconMC.addEventListener(MouseEvent.CLICK,this.onItemIconClickHandler);
         this._priceTxt = this._panel["price_txt"];
         this._numTxt = this._panel["num_txt"];
         this.setView();
      }
      
      private function onOverHandler(param1:MouseEvent) : void
      {
         var _loc2_:String = null;
         var _loc3_:SingleItemInfo = null;
         if(this._itemData.type == 2 || this._itemData.type == 3)
         {
            _loc3_ = new SingleItemInfo();
            _loc3_.itemID = this._itemData.itemID;
            ItemInfoTip.show(_loc3_,false,MainManager.getStage());
         }
      }
      
      private function onOutHandler(param1:MouseEvent) : void
      {
         ItemInfoTip.hide();
      }
      
      private function onItemIconClickHandler(param1:MouseEvent) : void
      {
         ItemInfoTip.hide();
         ExchangeControl.exchangeItem(this._itemData);
      }
      
      private function getPetIcon(param1:uint, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:uint = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ClientConfig.getResPath("pet/head/" + iconID + ".swf");
         ResourceManager.getResource(_url,function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(50,50);
               iconContainer.addChild(param1);
            }
         },"item");
      }
      
      private function getItemIcon(param1:uint, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:uint = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ItemXMLInfo.getIconURL(iconID);
         ResourceManager.getResource(_url,function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(50,50);
               iconContainer.addChild(param1);
            }
         },"item");
      }
      
      public function setView() : void
      {
         var _loc3_:ExchangeInfo = null;
         if(this._itemData.type == 2 || this._itemData.type == 3)
         {
            this._itemNameTxt.text = ItemXMLInfo.getName(this._itemData.itemID);
         }
         else if(this._itemData.type == 1)
         {
            this._itemNameTxt.text = PetXMLInfo.getName(this._itemData.itemID);
         }
         var _loc1_:Array = MainManager.ExchangeInfoList;
         var _loc2_:int = 0;
         while(_loc2_ < _loc1_.length)
         {
            _loc3_ = _loc1_[_loc2_];
            if(_loc3_._exchangeID == this._itemData.exchangeID)
            {
               this._itemData.curExchange = _loc3_.exchangeNum;
               break;
            }
            this._itemData.curExchange = 0;
            _loc2_++;
         }
         this._priceTxt.text = this._itemData.price.toString();
         this._numTxt.text = "可兑换：" + this._itemData.curExchange.toString() + " / " + this._itemData.maxExchange.toString();
         if(this._itemData.type == 2 || this._itemData.type == 3)
         {
            this.getItemIcon(this._itemData.itemID,this._itemIconMC);
         }
         else if(this._itemData.type == 1)
         {
            this.getPetIcon(this._itemData.itemID,this._itemIconMC);
         }
      }
      
      public function changeExchangeNum(param1:int) : void
      {
         this._itemData.curExchange = param1;
         this._numTxt.text = "可兑换：" + this._itemData.curExchange.toString() + " / " + this._itemData.maxExchange.toString();
      }
      
      public function get itemData() : ExchangeItemData
      {
         return this._itemData;
      }
      
      public function destroy() : void
      {
      }
   }
}


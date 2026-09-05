package com.robot.module.app.fightExchange.view
{
   import com.robot.container.Tile;
   import com.robot.core.Container;
   import com.robot.module.app.fightExchange.mode.ExChangeItemSuccessInfo;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class PageView extends Container
   {
      
      private var _pageNum:int;
      
      private var _pageIndex:uint = 0;
      
      private var _itemArr:Array;
      
      private var _tile:Tile;
      
      private var _pageBar:exchange_pagebar;
      
      private var _prePage:SimpleButton;
      
      private var _nextPage:SimpleButton;
      
      private var _pageTxt:TextField;
      
      private var _totalPage:uint;
      
      private var cacheArr:Array = [];
      
      public function PageView(param1:Array, param2:int = 5, param3:int = 2)
      {
         super();
         this._itemArr = param1;
         this._tile = new Tile();
         this._tile.x = 0;
         this._tile.y = 40;
         this._tile.horizontalGap = 2;
         this._tile.verticalGap = 2;
         this._tile.columnCount = param2;
         this._tile.rowCount = param3;
         addChild(this._tile);
         this._pageNum = param2 * param3;
         this._pageBar = new exchange_pagebar();
         this._prePage = this._pageBar["preBtn"];
         this._nextPage = this._pageBar["nextBtn"];
         this._pageTxt = this._pageBar["pageTxt"];
         addChild(this._pageBar);
         this._totalPage = Math.ceil(this._itemArr.length / this._pageNum);
         trace(this._itemArr.length / this._pageNum + "\t _itemArr.length/pageNum" + "\t" + this._itemArr.length + "\t" + this._totalPage);
         this._pageTxt.text = this._pageIndex + 1 + "/" + this._totalPage;
         this._prePage.addEventListener(MouseEvent.CLICK,this.onPreBtnClickHandler);
         this._nextPage.addEventListener(MouseEvent.CLICK,this.onNextBtnClickHandler);
         this.changePage();
         EventManager.addEventListener("exchange_item_success",this.updateExchangeNum);
      }
      
      private function setPageBtnState() : void
      {
         if(this._totalPage == 1)
         {
            this._prePage.enabled = false;
            this._prePage.mouseEnabled = false;
            this._prePage.alpha = 0.5;
            this._nextPage.enabled = false;
            this._nextPage.mouseEnabled = false;
            this._nextPage.alpha = 0.5;
            return;
         }
         if(this._pageIndex == 0)
         {
            this._prePage.enabled = false;
            this._prePage.mouseEnabled = false;
            this._prePage.alpha = 0.5;
            this._nextPage.mouseEnabled = true;
            this._nextPage.enabled = true;
            this._nextPage.alpha = 1;
         }
         else if(this._pageIndex == this._totalPage - 1)
         {
            this._nextPage.enabled = false;
            this._nextPage.mouseEnabled = false;
            this._nextPage.alpha = 0.5;
            this._prePage.mouseEnabled = true;
            this._prePage.enabled = true;
            this._prePage.alpha = 1;
         }
         else
         {
            this._nextPage.enabled = true;
            this._nextPage.mouseEnabled = true;
            this._nextPage.alpha = 1;
            this._prePage.mouseEnabled = true;
            this._prePage.enabled = true;
            this._prePage.alpha = 1;
         }
      }
      
      private function onPreBtnClickHandler(param1:MouseEvent) : void
      {
         if(this._pageIndex > 0)
         {
            --this._pageIndex;
            this.changePage();
         }
      }
      
      private function onNextBtnClickHandler(param1:MouseEvent) : void
      {
         if(this._pageIndex < this._totalPage)
         {
            ++this._pageIndex;
            this.changePage();
         }
      }
      
      private function changePage() : void
      {
         var _loc1_:* = 0;
         var _loc2_:* = 0;
         var _loc3_:* = 0;
         var _loc4_:ItemPanelView = null;
         var _loc5_:Number = 0;
         while(_loc5_ < this._tile.numChildren)
         {
            (this._tile.getChildAt(_loc5_) as ItemPanelView).destroy();
            _loc5_++;
         }
         DisplayUtil.removeAllChild(this._tile);
         this.setPageBtnState();
         var _loc6_:uint = this._pageNum * this._pageIndex;
         if(_loc6_ + this._pageNum < this._itemArr.length)
         {
            _loc1_ = uint(_loc6_ + this._pageNum);
         }
         else
         {
            _loc1_ = this._itemArr.length;
         }
         if(this.cacheArr.length > _loc6_)
         {
            _loc2_ = _loc6_;
            while(_loc2_ < _loc1_)
            {
               (this.cacheArr[_loc2_] as ItemPanelView).setView();
               this._tile.addChild(this.cacheArr[_loc2_]);
               _loc2_++;
            }
         }
         else
         {
            _loc3_ = _loc6_;
            while(_loc3_ < _loc1_)
            {
               _loc4_ = new ItemPanelView(this._itemArr[_loc3_]);
               this._tile.addChild(_loc4_);
               this.cacheArr.push(_loc4_);
               _loc3_++;
            }
         }
         this._tile.InvalidateDisplayList();
         this._pageTxt.text = this._pageIndex + 1 + "/" + this._totalPage;
      }
      
      public function updateExchangeNum(param1:DynamicEvent) : void
      {
         var _loc3_:ItemPanelView = null;
         var _loc2_:ExChangeItemSuccessInfo = param1.paramObject as ExChangeItemSuccessInfo;
         for each(_loc3_ in this.cacheArr)
         {
            if(_loc3_.itemData.itemID == _loc2_.itemID)
            {
               _loc3_.changeExchangeNum(_loc3_.itemData.curExchange - _loc2_.itemCnt);
               break;
            }
         }
      }
      
      override public function ValidateDisplayList() : void
      {
         if(invalidateDisplayListFlag)
         {
            this._pageBar.x = (this.width - this._pageBar.width) / 2;
            this._pageBar.y = Math.ceil(this.height - this._pageBar.height) + 10;
            trace(this.height + "\tthis height \t" + this._pageBar.y + "\t pagebar.y");
         }
         super.ValidateDisplayList();
      }
   }
}


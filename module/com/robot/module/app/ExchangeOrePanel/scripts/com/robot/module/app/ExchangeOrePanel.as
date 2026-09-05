package com.robot.module.app
{
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import com.robot.core.energyExchange.ExchangeOreModel;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.machineDog.OrgBgPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import org.taomee.ds.HashMap;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ExchangeOrePanel extends Sprite implements IModule
   {
      
      private var _hasMap:HashMap;
      
      private var _cancelBtn:SimpleButton;
      
      private var _amountTxt:TextField;
      
      private var _allInfoA:Array;
      
      private var _leftBtn:SimpleButton;
      
      private var _addBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _allPoint_a:Array = [new Point(115,165),new Point(260,165),new Point(405,165)];
      
      private var _removeBtn:SimpleButton;
      
      private var _addedOreA:Array;
      
      private var _priceTxt:TextField;
      
      private var _mainMc:MovieClip;
      
      private var _paopaoMc:MovieClip;
      
      private var _titleTxt:TextField;
      
      private var _curIndex:uint = 0;
      
      private var _currentObj:ExchangeItemInfo;
      
      private const _allLength:uint = 3;
      
      private var _totalTxt:TextField;
      
      private var _iconA:Array;
      
      private var _exchangeBtn:SimpleButton;
      
      private var _rightBtn:SimpleButton;
      
      public function ExchangeOrePanel()
      {
         super();
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function onExchangeSuccessHandler() : void
      {
         _exchangeBtn.mouseEnabled = true;
         Alarm.show("  " + _amountTxt.text + _currentObj.itemRule + " " + TextFormatUtil.getRedTxt(_currentObj.itemName) + " 做为能源提供给飞船，" + String(uint(_amountTxt.text) * _currentObj.itemSellPrice) + "赛尔豆已放入了你的储存箱");
         MainManager.actorInfo.coins += uint(_amountTxt.text) * _currentObj.itemSellPrice;
         if(uint(_amountTxt.text) == _currentObj.itemNum)
         {
            _allInfoA.splice(_curIndex,1);
            if(_allInfoA.length > 0)
            {
               if(_allInfoA.length == 1)
               {
                  _curIndex = 0;
                  _currentObj = _allInfoA[_curIndex];
               }
               else if(_curIndex == _allInfoA.length)
               {
                  --_curIndex;
                  _currentObj = _allInfoA[_curIndex];
               }
               else
               {
                  _currentObj = _allInfoA[_curIndex];
               }
               setPriceTxt();
               setTitleTxt();
               setAmountTxt();
               setTotalTxt();
               addEnergy();
            }
            else
            {
               loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
            }
         }
         else
         {
            (_allInfoA[_curIndex] as ExchangeItemInfo)._itemNum -= uint(_amountTxt.text);
            setPriceTxt();
            setTitleTxt();
            setAmountTxt();
            setTotalTxt();
         }
      }
      
      private function removeBg() : void
      {
         for(var i1:int = 0; i1 < _iconA.length; i1++)
         {
            DisplayUtil.removeForParent(_iconA[i1]);
            _iconA[i1] = null;
         }
      }
      
      private function setTotalTxt() : void
      {
         _totalTxt.text = String(_currentObj.itemSellPrice * Number(_amountTxt.text));
      }
      
      public function init(data:Object = null) : void
      {
         if(data)
         {
            _hasMap = data as HashMap;
            _allInfoA = _hasMap.getValues();
            _curIndex = 0;
            _currentObj = _allInfoA[_curIndex];
            show();
            setPriceTxt();
            setTitleTxt();
            setAmountTxt();
            setTotalTxt();
            addEnergy();
         }
      }
      
      public function destroy() : void
      {
         removeEvent();
         hide();
         _mainMc = null;
         _closeBtn = null;
         _leftBtn = null;
         _rightBtn = null;
         _removeBtn = null;
         _addBtn = null;
         _priceTxt = null;
         _amountTxt = null;
         _totalTxt = null;
         _exchangeBtn = null;
         _titleTxt = null;
         _paopaoMc = null;
         _allPoint_a = null;
         _hasMap.clear();
         _hasMap = null;
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_mainMc))
         {
            LevelManager.appLevel.addChild(_mainMc);
            DisplayUtil.align(_mainMc,null,AlignType.MIDDLE_CENTER);
            addEvent();
         }
      }
      
      private function addEnergy() : void
      {
         var rightIndex:uint = 0;
         var leftIndex:uint = 0;
         var i1:int = 0;
         if(_allInfoA.length < 3)
         {
            for(i1 = 0; i1 < 3; i1++)
            {
               if(_allInfoA[i1] == undefined)
               {
                  _allInfoA[i1] = null;
               }
            }
         }
         if(_curIndex == 0)
         {
            rightIndex = _allInfoA.length - 1;
            leftIndex = 1;
         }
         if(_curIndex == _allInfoA.length - 1)
         {
            rightIndex = _curIndex - 1;
            leftIndex = 0;
         }
         if(_curIndex > 0 && _curIndex < _allInfoA.length - 1)
         {
            rightIndex = _curIndex - 1;
            leftIndex = _curIndex + 1;
         }
         (_mainMc.getChildByName("bg2") as OrgBgPanel).show(_allInfoA[rightIndex]);
         (_mainMc.getChildByName("bg1") as OrgBgPanel).show(_allInfoA[_curIndex]);
         (_mainMc.getChildByName("bg0") as OrgBgPanel).show(_allInfoA[leftIndex]);
         for(var i2:* = 0; i2 < _allInfoA.length; i2++)
         {
            if(_allInfoA[i2] == null)
            {
               _allInfoA.splice(i2,1);
               i2--;
            }
         }
      }
      
      private function onExchangeBtnClickHandler(e:MouseEvent) : void
      {
         if(uint(_amountTxt.text) > _currentObj.itemNum)
         {
            Alarm.show("能源的数量超出范围啦!");
            return;
         }
         if(uint(_amountTxt.text) == 0)
         {
            Alarm.show("能源的数量不能为零!");
            return;
         }
         _exchangeBtn.mouseEnabled = false;
         _paopaoMc.addEventListener(Event.ENTER_FRAME,onEnterHandler);
         _paopaoMc.gotoAndPlay(2);
      }
      
      public function setup() : void
      {
         _mainMc = new ExchangeOreBg_UI();
         _closeBtn = _mainMc["closeBtn"];
         _leftBtn = _mainMc["leftBtn"];
         _rightBtn = _mainMc["rightBtn"];
         _removeBtn = _mainMc["removeBtn"];
         _addBtn = _mainMc["addBtn"];
         _paopaoMc = _mainMc["paopaoMc"];
         _paopaoMc.gotoAndStop(1);
         _priceTxt = _mainMc["priceTxt"];
         _amountTxt = _mainMc["amountTxt"];
         _amountTxt.restrict = "0-9";
         _totalTxt = _mainMc["totalTxt"];
         _exchangeBtn = _mainMc["exchangeBtn"];
         _titleTxt = _mainMc["titleTxt"];
         _cancelBtn = _mainMc["cancelBtn"];
         _hasMap = new HashMap();
         addBg();
      }
      
      private function setAmountTxt() : void
      {
         _amountTxt.text = String(_currentObj.itemNum);
      }
      
      private function onLeftBtnClickHandler(e:MouseEvent) : void
      {
         if(_curIndex > 0)
         {
            --_curIndex;
         }
         else
         {
            _curIndex = _allInfoA.length - 1;
         }
         _currentObj = _allInfoA[_curIndex];
         setPriceTxt();
         setTitleTxt();
         setAmountTxt();
         setTotalTxt();
         addEnergy();
      }
      
      public function hide() : void
      {
         removeBg();
         DisplayUtil.removeForParent(_mainMc);
      }
      
      private function onEnterHandler(e:Event) : void
      {
         if(_paopaoMc.totalFrames == _paopaoMc.currentFrame)
         {
            _paopaoMc.removeEventListener(Event.ENTER_FRAME,onEnterHandler);
            ExchangeOreModel.exchangeEnergy(_currentObj.itemId,uint(_amountTxt.text),onExchangeSuccessHandler);
         }
      }
      
      private function onRemoveBtnClickHandler(e:MouseEvent) : void
      {
         if(Number(_amountTxt.text) > 1)
         {
            _amountTxt.text = String(Number(_amountTxt.text) - 1);
            setTotalTxt();
         }
      }
      
      private function addBg() : void
      {
         var bg:OrgBgPanel = null;
         _iconA = new Array();
         for(var i1:int = 0; i1 < _allLength; i1++)
         {
            bg = new OrgBgPanel();
            _mainMc.addChild(bg);
            bg.name = "bg" + i1;
            _iconA.push(bg);
            bg.x = _allPoint_a[i1].x;
            bg.y = _allPoint_a[i1].y;
         }
      }
      
      private function onRightBtnClickHandler(e:MouseEvent) : void
      {
         if(_curIndex < _allInfoA.length - 1)
         {
            ++_curIndex;
         }
         else
         {
            _curIndex = 0;
         }
         _currentObj = _allInfoA[_curIndex];
         setPriceTxt();
         setTitleTxt();
         setAmountTxt();
         setTotalTxt();
         addEnergy();
      }
      
      private function onTxtChangeHandler(e:Event) : void
      {
         setTotalTxt();
      }
      
      private function setTitleTxt() : void
      {
         _titleTxt.text = _currentObj.itemName;
      }
      
      private function setPriceTxt() : void
      {
         _priceTxt.text = String(_currentObj.itemSellPrice) + " 赛尔豆/" + _currentObj.itemRule;
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _cancelBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _leftBtn.removeEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _rightBtn.removeEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _removeBtn.removeEventListener(MouseEvent.CLICK,onRemoveBtnClickHandler);
         _addBtn.removeEventListener(MouseEvent.CLICK,onAddBtnClickHandler);
         _amountTxt.removeEventListener(Event.CHANGE,onTxtChangeHandler);
         _exchangeBtn.removeEventListener(MouseEvent.CLICK,onExchangeBtnClickHandler);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _cancelBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _leftBtn.addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _rightBtn.addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _removeBtn.addEventListener(MouseEvent.CLICK,onRemoveBtnClickHandler);
         _addBtn.addEventListener(MouseEvent.CLICK,onAddBtnClickHandler);
         _amountTxt.addEventListener(Event.CHANGE,onTxtChangeHandler);
         _exchangeBtn.addEventListener(MouseEvent.CLICK,onExchangeBtnClickHandler);
      }
      
      private function onAddBtnClickHandler(e:MouseEvent) : void
      {
         _amountTxt.text = String(Number(_amountTxt.text) + 1);
         setTotalTxt();
      }
   }
}


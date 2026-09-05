package com.robot.module.app.machineDog
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.userItem.SingleItemInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   import flash.utils.ByteArray;
   import org.taomee.ds.HashMap;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.Utils;
   
   public class MachineDogStoragePanel extends Sprite
   {
      
      public static const HIDE_PANEL:String = "hidepanel";
      
      public static const HIDE_SELF:String = "hideSelf";
      
      private var colorMat:ColorMatrixFilter;
      
      private var _itemMap:HashMap;
      
      private var _bgMc:MovieClip;
      
      private const _nono:String = "nono";
      
      private var _desFun:Function;
      
      private var _curPage:uint = 1;
      
      private var _btn2:SimpleButton;
      
      private const _reSetPoint:Point = new Point(7.5,35.9);
      
      private var _btn1:SimpleButton;
      
      private const MAX:uint = 9;
      
      private var _closeFun:Function;
      
      private var _superMap:HashMap;
      
      private const _endId:uint = 700550;
      
      private var _closeSelfFun:Function;
      
      private var _curType:String;
      
      private const _startId:uint = 700001;
      
      private const _superNono:String = "superNono";
      
      private var mat:Array = [0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0.3086,0.6094,0.082,0,0,0,0,0,1,0];
      
      private var _totalPage:uint;
      
      private var _closeAllFun:Function;
      
      private var _panelMc:MachineDogStorage_MC;
      
      private const _spaceNum:uint = 8;
      
      public function MachineDogStoragePanel(closeAllFun:Function, desFun:Function, closeFun:Function)
      {
         colorMat = new ColorMatrixFilter(mat);
         super();
         _closeAllFun = closeAllFun;
         _desFun = desFun;
         _closeFun = closeFun;
      }
      
      public function destroy() : void
      {
         var itemMc:ChipListItem = null;
         ToolTipManager.remove(_panelMc["closeBtn"]);
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseHandler);
         SocketConnection.removeCmdListener(CommandID.ITEM_LIST,onItemListHandler);
         _panelMc["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["rightBtn"].removeEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         for(var i1:int = 0; i1 < MAX; i1++)
         {
            itemMc = _panelMc.getChildByName("item" + i1) as ChipListItem;
            itemMc.removeEventListener(MouseEvent.CLICK,onClickHandler);
            itemMc.clear();
            DisplayUtil.removeForParent(itemMc);
            itemMc = null;
         }
         _itemMap.clear();
         DisplayUtil.removeForParent(_panelMc);
         _panelMc = null;
         _itemMap = null;
         _superMap = null;
         _closeAllFun = null;
         _closeSelfFun = null;
         _desFun = null;
      }
      
      private function getItem() : void
      {
         SocketConnection.addCmdListener(CommandID.ITEM_LIST,onItemListHandler);
         SocketConnection.send(CommandID.ITEM_LIST,_startId,_endId,2);
      }
      
      private function setPage() : void
      {
         _panelMc["pageTxt"].text = String(_curPage) + "/" + String(_totalPage);
      }
      
      private function onBtn1ClickHandler(e:MouseEvent) : void
      {
         _btn1.visible = false;
         _btn2.visible = true;
         _curType = _nono;
         makePage(_itemMap);
         setPage();
         addItem(_itemMap);
         _bgMc.gotoAndStop(1);
      }
      
      private function onBtn2ClickHandler(e:MouseEvent) : void
      {
         _curType = _superNono;
         _btn1.visible = true;
         _btn2.visible = false;
         makePage(_superMap);
         setPage();
         addItem(_superMap);
         _bgMc.gotoAndStop(2);
      }
      
      private function makePage(hash:HashMap) : void
      {
         _curPage = 1;
         if(hash.length <= 9)
         {
            _totalPage = 1;
         }
         else if(hash.length % 9 == 0)
         {
            _totalPage = hash.length / MAX;
         }
         else
         {
            _totalPage = int(hash.length / MAX) + 1;
         }
         if(_totalPage > 1)
         {
            addEvent();
            _panelMc["leftBtn"].mouseEnabled = true;
            _panelMc["rightBtn"].mouseEnabled = true;
         }
         else
         {
            _panelMc["leftBtn"].mouseEnabled = false;
            _panelMc["rightBtn"].mouseEnabled = false;
            _totalPage = 1;
         }
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         var item:ChipListItem;
         var info:SingleItemInfo;
         var cls:Class = null;
         if(_curType == _superNono)
         {
            if(!MainManager.actorInfo.superNono)
            {
               Alarm.show("    主人，我已经失去了超能晶体的超级能量了，只有超能NoNo才能使用这些超能道具哦！");
               return;
            }
         }
         item = e.currentTarget as ChipListItem;
         info = item.info;
         if(!NonoManager.info.state[0])
         {
            if(!(info.itemID >= 700401 && info.itemID <= 700410))
            {
               Alarm.show("该芯片只有在开机状态下才能使用。");
               return;
            }
         }
         if(MainManager.actorInfo.superNono != 1)
         {
            if(NonoManager.info.ai < ItemXMLInfo.getAiLevel(info.itemID))
            {
               Alarm.show("你目前的AI等级不能加载此芯片。");
               return;
            }
         }
         if(info.itemID == 700017)
         {
            if(NonoManager.info.superLevel < 4)
            {
               Alarm.show("你的NoNo超级能量不足，无法使用飞行模式哟，快让它成长起来吧，到了超能4级就可以开通飞行模式了哟！");
               return;
            }
         }
         if(ItemXMLInfo.getIsConsume(info.itemID) == 1)
         {
            --info.itemNum;
            item.info = info;
            if(info.itemNum == 0)
            {
               item.buttonMode = false;
               item.removeEventListener(MouseEvent.CLICK,onClickHandler);
               _itemMap.remove(info.itemID);
               item.clear();
               if(_curType == _nono)
               {
                  addItem(_itemMap);
               }
               else
               {
                  addItem(_superMap);
               }
            }
         }
         if(ItemXMLInfo.getPlayID(info.itemID) != 0)
         {
            _closeAllFun();
         }
         else
         {
            _desFun();
         }
         try
         {
            cls = Utils.getClass("com.robot.app.nono.chipClass.Chip_" + info.itemID.toString());
            if(cls)
            {
               new cls(info);
            }
         }
         catch(e:Error)
         {
            trace("错误==>" + e.message);
         }
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         _closeFun();
      }
      
      private function onLeftBtnClickHandler(e:MouseEvent) : void
      {
         if(_curPage > 1)
         {
            --_curPage;
            setPage();
            if(_curType == _nono)
            {
               addItem(_itemMap);
            }
            else
            {
               addItem(_superMap);
            }
         }
      }
      
      private function addItemBg() : void
      {
         var itemMc:ChipListItem = null;
         for(var i1:int = 0; i1 < MAX; i1++)
         {
            itemMc = new ChipListItem();
            itemMc.x = _reSetPoint.x + (itemMc.width + _spaceNum) * int(i1 % 3);
            itemMc.y = _reSetPoint.y + (itemMc.height + _spaceNum) * int(i1 / 3);
            itemMc.name = "item" + i1;
            _panelMc.addChild(itemMc);
         }
      }
      
      private function addItem(hash:HashMap) : void
      {
         var item:ChipListItem = null;
         var startIndex:uint = (_curPage - 1) * MAX;
         var endIndex:uint = _curPage * MAX;
         var ary:Array = hash.getKeys().slice(startIndex,endIndex);
         for(var i1:int = 0; i1 < MAX; i1++)
         {
            item = _panelMc.getChildByName("item" + i1) as ChipListItem;
            item.filters = [];
            item.clear();
            item.buttonMode = false;
            item.removeEventListener(MouseEvent.CLICK,onClickHandler);
            if(ary[i1] != undefined)
            {
               if(_curType == _nono)
               {
                  item.filters = [];
               }
               else if(!MainManager.actorInfo.superNono)
               {
                  item.filters = [colorMat];
               }
               else
               {
                  item.filters = [];
               }
               item.buttonMode = true;
               item.addEventListener(MouseEvent.CLICK,onClickHandler);
               item.show(hash.getValue(hash.getKeys()[i1 + startIndex]));
            }
            else
            {
               item.filters = [];
               item.clear();
               item.buttonMode = false;
               item.removeEventListener(MouseEvent.CLICK,onClickHandler);
            }
         }
      }
      
      private function onItemListHandler(e:SocketEvent) : void
      {
         var info:SingleItemInfo = null;
         SocketConnection.removeCmdListener(CommandID.ITEM_LIST,onItemListHandler);
         if(_itemMap)
         {
            _itemMap.clear();
            _itemMap = null;
         }
         else
         {
            _itemMap = new HashMap();
         }
         if(_superMap)
         {
            _superMap.clear();
            _superMap = null;
         }
         else
         {
            _superMap = new HashMap();
         }
         var data:ByteArray = e.data as ByteArray;
         var len:uint = data.readUnsignedInt();
         for(var i:int = 0; i < len; i++)
         {
            info = new SingleItemInfo(data);
            if(ItemXMLInfo.getIsSuper(info.itemID) == false)
            {
               _itemMap.add(info.itemID,info);
            }
            else
            {
               _superMap.add(info.itemID,info);
            }
         }
         _curType = _nono;
         makePage(_itemMap);
         setPage();
         addItem(_itemMap);
      }
      
      private function onRightBtnClickHandler(e:MouseEvent) : void
      {
         if(_curPage < _totalPage)
         {
            ++_curPage;
            setPage();
            if(_curType == _nono)
            {
               addItem(_itemMap);
            }
            else
            {
               addItem(_superMap);
            }
         }
      }
      
      private function addEvent() : void
      {
         _btn1.addEventListener(MouseEvent.CLICK,onBtn1ClickHandler);
         _btn2.addEventListener(MouseEvent.CLICK,onBtn2ClickHandler);
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseHandler);
         _panelMc["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["rightBtn"].addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
      }
      
      public function show(point:Point) : void
      {
         _panelMc = new MachineDogStorage_MC();
         LevelManager.appLevel.addChild(_panelMc);
         _panelMc.x = point.x;
         _panelMc.y = point.y;
         _btn1 = _panelMc["btn1"];
         _btn1.visible = false;
         _btn2 = _panelMc["btn2"];
         _bgMc = _panelMc["mc"];
         _bgMc.gotoAndStop(1);
         addEvent();
         ToolTipManager.add(_panelMc["closeBtn"],"关闭");
         addItemBg();
         getItem();
      }
   }
}


package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import com.robot.core.energyExchange.ExchangeOreModel;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.machineDog.MixtureBgPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import gs.TweenMax;
   import org.taomee.ds.HashMap;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ChipMixturePanel extends Sprite implements IModule
   {
      
      private var tt:uint;
      
      private var _infoMap:HashMap;
      
      private var _moneyA:Array = [100,200,500];
      
      private var _pp:SimpleButton;
      
      private var _mcA:Array = [];
      
      private var _curModel:uint = 0;
      
      private var _curPage:uint = 0;
      
      private const _pageNum:uint = 4;
      
      private var _tween1:TweenMax;
      
      private var _alreadyA:Array = [];
      
      private var _infoA:Array;
      
      private var _tipA:Array = ["小型芯片模板","中型芯片模板","大型芯片模板"];
      
      private var _glow:GlowFilter = new GlowFilter(16737792,1,4,4,10);
      
      private var _totalPage:uint;
      
      private var _panelMc:ChipMixturePanel_MC;
      
      public function ChipMixturePanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         removeEvent();
         hide();
         _panelMc = null;
         _moneyA = null;
         _alreadyA = null;
         _mcA = null;
      }
      
      private function onRightBtnClickHandler(e:MouseEvent) : void
      {
         if(_curPage < _totalPage)
         {
            _panelMc["leftBtn"].mouseEnabled = false;
            _panelMc["rightBtn"].mouseEnabled = false;
            ++_curPage;
            removeAllIcon();
            addIcon();
            _panelMc["leftBtn"].mouseEnabled = true;
            _panelMc["rightBtn"].mouseEnabled = true;
         }
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         addBg();
         addIcon();
         addEvent();
      }
      
      private function addChip() : void
      {
         _mcA[_mcA.length - 1].scaleX = 0.6;
         _mcA[_mcA.length - 1].scaleY = 0.6;
         _mcA[_mcA.length - 1].x = 3;
         _mcA[_mcA.length - 1].y = 15;
         (_panelMc["ccMc" + _mcA.length] as MovieClip).addChildAt(_mcA[_mcA.length - 1],0);
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function setup() : void
      {
         _panelMc = new ChipMixturePanel_MC();
         _panelMc["dragMc"].buttonMode = true;
         for(var i1:int = 1; i1 < 4; i1++)
         {
            _panelMc["aiMc" + i1].gotoAndStop(1);
         }
      }
      
      private function removeAllIcon() : void
      {
         var mc:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _pageNum; i1++)
         {
            mc = _panelMc["iconMc"].getChildByName("mc" + i1);
            mc.buttonMode = false;
            mc.removeEventListener(MouseEvent.CLICK,onIconClickHandler);
            mc.removeIcon();
         }
      }
      
      private function onReDataHandkler(data:Object) : void
      {
         _panelMc["startBtn"].mouseEnabled = true;
         _panelMc["reSetBtn"].mouseEnabled = true;
         if(data)
         {
            _infoMap = data as HashMap;
            _infoA = _infoMap.getValues();
            polishingAry();
            removeAllIcon();
            addIcon();
         }
      }
      
      public function init(data:Object = null) : void
      {
         if(data)
         {
            _infoMap = data as HashMap;
            _infoA = _infoMap.getValues();
            _curPage = 1;
            polishingAry();
            show();
         }
      }
      
      private function addIcon() : void
      {
         var mc:MixtureBgPanel = null;
         var a:Array = _infoA.slice((_curPage - 1) * 4,_curPage * 4);
         for(var i1:int = 0; i1 < _pageNum; i1++)
         {
            mc = _panelMc["iconMc"].getChildByName("mc" + i1);
            if(a[i1])
            {
               mc.addIcon(a[i1]);
               mc.buttonMode = true;
               mc.addEventListener(MouseEvent.CLICK,onIconClickHandler);
            }
            else
            {
               mc.buttonMode = false;
               mc.removeEventListener(MouseEvent.CLICK,onIconClickHandler);
               mc.removeIcon();
            }
         }
      }
      
      private function onLeftBtnClickHandler(e:MouseEvent) : void
      {
         if(_curPage > 1)
         {
            _panelMc["leftBtn"].mouseEnabled = false;
            _panelMc["rightBtn"].mouseEnabled = false;
            --_curPage;
            removeAllIcon();
            addIcon();
            _panelMc["leftBtn"].mouseEnabled = true;
            _panelMc["rightBtn"].mouseEnabled = true;
         }
      }
      
      private function onIconClickHandler(e:MouseEvent) : void
      {
         var mc:MixtureBgPanel = null;
         var index:uint = 0;
         var curInfo:ExchangeItemInfo = null;
         if(!_pp)
         {
            Alarm.show("选择合成材料前请选择芯片模板。");
            return;
         }
         if(_alreadyA.length < 3)
         {
            mc = e.currentTarget as MixtureBgPanel;
            index = uint(mc.name.slice(2,mc.name.length)) + (_curPage - 1) * _pageNum;
            curInfo = mc.info;
            _alreadyA.push(curInfo.itemId);
            _mcA.push(mc.chip);
            addChip();
            if(mc.info.itemNum > 0)
            {
               --curInfo._itemNum;
               if(curInfo._itemNum == 0)
               {
                  mc.buttonMode = false;
                  mc.removeEventListener(MouseEvent.CLICK,onIconClickHandler);
                  mc.removeIcon();
                  _infoA.splice(index,1);
                  polishingAry();
                  removeAllIcon();
                  addIcon();
               }
               else
               {
                  mc.info = curInfo;
               }
            }
         }
      }
      
      public function hide() : void
      {
         removeBg();
         DisplayUtil.removeForParent(_panelMc);
      }
      
      private function addBg() : void
      {
         var mc:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _pageNum; i1++)
         {
            mc = new MixtureBgPanel();
            mc.name = "mc" + i1;
            _panelMc["iconMc"].addChild(mc);
            mc.x = i1 * (60 + 10);
         }
      }
      
      private function sendToServer() : void
      {
         if(_curModel == 0)
         {
            Alarm.show("你还没有选择芯片模板哦！");
            _panelMc["startBtn"].mouseEnabled = true;
            _panelMc["reSetBtn"].mouseEnabled = true;
            return;
         }
         if(_panelMc["priceTxt"].text != "")
         {
            if(uint(_panelMc["priceTxt"].text) > MainManager.actorInfo.coins)
            {
               Alarm.show("你的赛尔豆不够！");
               _panelMc["startBtn"].mouseEnabled = true;
               _panelMc["reSetBtn"].mouseEnabled = true;
               return;
            }
         }
         var by:ByteArray = new ByteArray();
         by.writeUnsignedInt(_curModel);
         by.writeUnsignedInt(_alreadyA.length);
         for(var i1:int = 0; i1 < _alreadyA.length; i1++)
         {
            by.writeUnsignedInt(_alreadyA[i1]);
            by.writeUnsignedInt(1);
         }
         SocketConnection.addCmdListener(CommandID.NONO_CHIP_MIXTURE,onMixComHandler);
         SocketConnection.send(CommandID.NONO_CHIP_MIXTURE,by);
      }
      
      private function onResetBtnClickHandler(e:MouseEvent) : void
      {
         var i1:int = 0;
         if(_mcA.length > 0)
         {
            _panelMc["startBtn"].mouseEnabled = false;
            _panelMc["reSetBtn"].mouseEnabled = false;
            for(i1 = 0; i1 < _mcA.length; i1++)
            {
               DisplayUtil.removeForParent(_mcA[i1]);
               _mcA[i1] = null;
            }
            _mcA = new Array();
            _alreadyA = new Array();
            ExchangeOreModel.getData(onReDataHandkler,"");
         }
      }
      
      private function setDoudou(s1:String) : void
      {
         _panelMc["priceTxt"].text = s1;
      }
      
      private function onMouseDownHanlder(e:MouseEvent) : void
      {
         _panelMc.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onMouseUpHandler);
      }
      
      private function onChipModuleClickHandler(e:MouseEvent) : void
      {
         if(_pp)
         {
            _pp.filters = [];
         }
         switch(e.currentTarget)
         {
            case _panelMc["chipMc1"]:
               setDoudou(_moneyA[0].toString());
               _curModel = 1;
               break;
            case _panelMc["chipMc2"]:
               setDoudou(_moneyA[1].toString());
               _curModel = 2;
               break;
            case _panelMc["chipMc3"]:
               setDoudou(_moneyA[2].toString());
               _curModel = 3;
         }
         _pp = e.currentTarget as SimpleButton;
         _pp.filters = [_glow];
      }
      
      private function onStartBtnClickHandler(e:MouseEvent) : void
      {
         if(_mcA.length == 0)
         {
            Alarm.show("你还没有选择合成材料！");
         }
         else
         {
            _panelMc["startBtn"].mouseEnabled = false;
            _panelMc["reSetBtn"].mouseEnabled = false;
            sendToServer();
         }
      }
      
      private function onMouseUpHandler(e:MouseEvent) : void
      {
         _panelMc.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onMouseUpHandler);
      }
      
      private function onMixComHandler(e:SocketEvent) : void
      {
         var length:uint;
         var i2:int;
         var by:ByteArray;
         var i1:int = 0;
         var id:uint = 0;
         var count:uint = 0;
         MainManager.actorInfo.coins -= uint(_panelMc["priceTxt"].text);
         SocketConnection.removeCmdListener(CommandID.NONO_CHIP_MIXTURE,onMixComHandler);
         by = e.data as ByteArray;
         length = by.readUnsignedInt();
         if(length == 0)
         {
            Alarm.show("很遗憾合成失败！");
         }
         else
         {
            for(i1 = 0; i1 < length; i1++)
            {
               id = by.readUnsignedInt();
               count = by.readUnsignedInt();
               tt = setTimeout(function():void
               {
                  clearTimeout(tt);
                  Alarm.show(count + "个 " + TextFormatUtil.getRedTxt(ItemXMLInfo.getName(id)) + " 已经放入NoNo的存储空间！");
               },1500);
            }
         }
         for(i2 = 0; i2 < _mcA.length; i2++)
         {
            DisplayUtil.removeForParent(_mcA[i2]);
            _mcA[i2] = null;
            if(length != 0)
            {
               _panelMc["aiMc" + (i2 + 1)].gotoAndPlay(2);
            }
         }
         _mcA = new Array();
         _alreadyA = new Array();
         ExchangeOreModel.getData(onReDataHandkler,"");
      }
      
      private function removeBg() : void
      {
         var mc:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _pageNum; i1++)
         {
            mc = _panelMc["iconMc"].getChildByName("mc" + i1);
            if(mc)
            {
               mc.buttonMode = false;
               mc.removeEventListener(MouseEvent.CLICK,onIconClickHandler);
               mc.removeIcon();
               DisplayUtil.removeForParent(mc);
               mc = null;
            }
         }
      }
      
      private function removeEvent() : void
      {
         SocketConnection.removeCmdListener(CommandID.NONO_CHIP_MIXTURE,onMixComHandler);
         _panelMc["dragMc"].removeEventListener(MouseEvent.MOUSE_DOWN,onMouseDownHanlder);
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         for(var i1:int = 1; i1 < 4; i1++)
         {
            ToolTipManager.remove(_panelMc["chipMc" + i1]);
            _panelMc["chipMc" + i1].removeEventListener(MouseEvent.CLICK,onChipModuleClickHandler);
         }
         _panelMc["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["rightBtn"].removeEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["startBtn"].removeEventListener(MouseEvent.CLICK,onStartBtnClickHandler);
         _panelMc["reSetBtn"].removeEventListener(MouseEvent.CLICK,onResetBtnClickHandler);
      }
      
      private function polishingAry() : void
      {
         var i1:int = 0;
         if(_infoMap.length <= _pageNum)
         {
            _totalPage = 1;
         }
         else if(_infoMap.length % 4 == 0)
         {
            _totalPage = _infoMap.length / 4;
         }
         else
         {
            _totalPage = int(_infoMap.length / _pageNum) + 1;
         }
         var all:uint = _totalPage * _pageNum;
         var inset:uint = all - _infoMap.length;
         if(inset > 0)
         {
            for(i1 = 0; i1 < inset; i1++)
            {
               _infoA.push(null);
            }
         }
         if(_curPage > _totalPage)
         {
            _curPage = _totalPage;
         }
      }
      
      private function addEvent() : void
      {
         _panelMc["dragMc"].addEventListener(MouseEvent.MOUSE_DOWN,onMouseDownHanlder);
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         for(var i1:int = 1; i1 < _pageNum; i1++)
         {
            _panelMc["chipMc" + i1].addEventListener(MouseEvent.CLICK,onChipModuleClickHandler);
            ToolTipManager.add(_panelMc["chipMc" + i1],_tipA[i1 - 1]);
         }
         _panelMc["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["rightBtn"].addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["startBtn"].addEventListener(MouseEvent.CLICK,onStartBtnClickHandler);
         _panelMc["reSetBtn"].addEventListener(MouseEvent.CLICK,onResetBtnClickHandler);
      }
   }
}


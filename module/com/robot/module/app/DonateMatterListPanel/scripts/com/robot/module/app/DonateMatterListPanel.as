package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.FortressItemXMLInfo;
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import com.robot.core.info.team.DonateInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamInfoController;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.machineDog.MixtureBgPanel;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class DonateMatterListPanel extends Sprite implements IModule
   {
      
      private var _panel:DonationMatter_Mc;
      
      private var _iconMc:Sprite;
      
      private var _allInfoA:Array;
      
      private var _superNonoInfoA:Array;
      
      private var _leftBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private var _numTxt:TextField;
      
      private var _donationBtn:SimpleButton;
      
      private var _curPage:uint;
      
      private var _isSuper:Boolean;
      
      private var _gonoBtn:SimpleButton;
      
      private var _curObj:ExchangeItemInfo;
      
      private var _buyTime:uint;
      
      private var _maxA:Array;
      
      private var _powerMc:MixtureBgPanel;
      
      private var _normalNonoInfoA:Array;
      
      private var _curIndex:uint;
      
      private var _iconMc1:Sprite;
      
      private var _glow:GlowFilter = new GlowFilter(16737792,1,4,4,10);
      
      private var _totalPage:uint;
      
      private var _rightBtn:SimpleButton;
      
      public function DonateMatterListPanel()
      {
         super();
      }
      
      private function addNormalIcon() : void
      {
         var bg:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _normalNonoInfoA.length; i1++)
         {
            bg = new MixtureBgPanel();
            bg.addIcon(_normalNonoInfoA[i1]);
            _iconMc.addChild(bg);
            bg.x = (bg.width + 15) * i1;
            bg.addEventListener(MouseEvent.CLICK,onClickHandler);
            bg.name = "icon" + i1;
            bg.buttonMode = true;
         }
         _iconMc.x = (_panel.width - _iconMc.width) / 2;
         if(_superNonoInfoA.length == 0)
         {
            _iconMc.y += 45;
         }
      }
      
      private function makeIcon() : void
      {
         _curPage = 1;
         if(_superNonoInfoA.length <= 4)
         {
            _totalPage = 1;
         }
         else if(_superNonoInfoA.length % 4 == 0)
         {
            _totalPage = uint(_superNonoInfoA.length / 4);
         }
         else
         {
            _totalPage = uint(_superNonoInfoA.length / 4) + 1;
         }
      }
      
      public function destroy() : void
      {
         var bg:MixtureBgPanel = null;
         var bg1:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _normalNonoInfoA.length; i1++)
         {
            bg = _iconMc.getChildByName("icon" + i1) as MixtureBgPanel;
            bg.removeIcon();
         }
         for(var i2:int = 0; i2 < 4; i2++)
         {
            bg1 = _iconMc1.getChildByName("sicon" + i2) as MixtureBgPanel;
            bg1.removeIcon();
         }
         hide();
         _panel = null;
         _closeBtn = null;
         _donationBtn = null;
         _gonoBtn = null;
         _normalNonoInfoA = null;
         _superNonoInfoA = null;
      }
      
      public function show() : void
      {
         (_panel["msgTxt"] as TextField).htmlText = "你今天还能捐献 " + TextFormatUtil.getRedTxt(TeamInfoController.remainDonate.toString()) + "个物资";
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
         _donationBtn.mouseEnabled = true;
         _iconMc.y = 70;
         _iconMc1.y = 148;
         addSuperBg();
         if(_normalNonoInfoA.length > 0)
         {
            addNormalIcon();
         }
         if(_superNonoInfoA.length > 0)
         {
            if(_superNonoInfoA.length > 4)
            {
               _rightBtn.visible = true;
               _leftBtn.visible = true;
            }
            else
            {
               _rightBtn.visible = false;
               _leftBtn.visible = false;
            }
            _iconMc1.visible = true;
            makeIcon();
            addSuperIcon();
         }
         else
         {
            _iconMc1.visible = false;
            _rightBtn.visible = false;
            _leftBtn.visible = false;
         }
      }
      
      private function onRightHandler(e:MouseEvent) : void
      {
         if(_curPage < _totalPage)
         {
            ++_curPage;
            addSuperIcon();
            if(_curObj)
            {
               if(_curObj.isSuper)
               {
                  if(_powerMc)
                  {
                     _powerMc.filters = [];
                  }
                  _curObj = null;
               }
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
         _allInfoA = data as Array;
         _normalNonoInfoA = new Array();
         _superNonoInfoA = new Array();
         for(var i1:int = 0; i1 < _allInfoA.length; i1++)
         {
            if((_allInfoA[i1] as ExchangeItemInfo).isSuper)
            {
               _superNonoInfoA.push(_allInfoA[i1]);
            }
            else
            {
               _normalNonoInfoA.push(_allInfoA[i1]);
            }
         }
         _buyTime = TeamInfoController.info.buyTime;
         _maxA = TeamInfoController.removeNum(FortressItemXMLInfo.getResMaxs(TeamInfoController.info.id,TeamInfoController.info.form));
      }
      
      private function onSuperClickHandler(e:MouseEvent) : void
      {
         _isSuper = true;
         _curIndex = uint(e.currentTarget.name.slice(4,5));
         if(_powerMc)
         {
            _powerMc.filters = [];
         }
         _powerMc = e.currentTarget as MixtureBgPanel;
         _powerMc.filters = [_glow];
         _curObj = _powerMc.info;
         TeamInfoController.curSuperInfo = _curObj;
         _numTxt.text = "";
      }
      
      public function setup() : void
      {
         _panel = new DonationMatter_Mc();
         _rightBtn = _panel["rightBtn"];
         _leftBtn = _panel["leftBtn"];
         _rightBtn.visible = false;
         _leftBtn.visible = false;
         _closeBtn = _panel["closeBtn"];
         _donationBtn = _panel["donationBtn"];
         _gonoBtn = _panel["gonoBtn"];
         _iconMc = _panel["iconMc"];
         _iconMc1 = _panel["iconMc1"];
         _numTxt = _panel["numTxt"];
         _numTxt.restrict = "0-9";
      }
      
      private function onDoHandler(e:MouseEvent) : void
      {
         if(_curObj)
         {
            if(_numTxt.text == "")
            {
               Alarm.show("请输入你要捐献的数量。");
               _donationBtn.mouseEnabled = true;
            }
            else if(_numTxt.text.slice(0,1) == "0")
            {
               Alarm.show("请输入一个正确的数量。");
               _donationBtn.mouseEnabled = true;
            }
            else if(uint(_numTxt.text) > uint(_curObj.itemNum))
            {
               Alarm.show("你输入的数量大于你所拥有的数量了。");
               _donationBtn.mouseEnabled = true;
            }
            else if(uint(_numTxt.text) > _maxA[_curIndex])
            {
               Alarm.show("所捐献的物质不能超过最大需求量！");
               _donationBtn.mouseEnabled = true;
            }
            else if(_isSuper)
            {
               _curObj._itemNum = uint(_numTxt.text);
               TeamInfoController.curSuperInfo = _curObj;
               this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
            }
            else
            {
               SocketConnection.addCmdListener(CommandID.ARM_UP_DONATE,onComHandler);
               SocketConnection.send(CommandID.ARM_UP_DONATE,_buyTime,0,_curObj.itemId,uint(_numTxt.text));
            }
         }
         else
         {
            Alarm.show("请选择一个你要捐献的物质！");
         }
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         _isSuper = false;
         _curIndex = uint(e.currentTarget.name.slice(4,5));
         if(_powerMc)
         {
            _powerMc.filters = [];
         }
         _powerMc = e.currentTarget as MixtureBgPanel;
         _curObj = _powerMc.info;
         _powerMc.filters = [_glow];
         _numTxt.text = "";
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function addSuperBg() : void
      {
         var i1:int = 0;
         var bg:MixtureBgPanel = null;
         if(_iconMc1.numChildren == 0)
         {
            for(i1 = 0; i1 < 4; i1++)
            {
               bg = new MixtureBgPanel();
               _iconMc1.addChild(bg);
               bg.x = (bg.width + 15) * i1;
               bg.addEventListener(MouseEvent.CLICK,onSuperClickHandler);
               bg.name = "sicon" + i1;
               bg.buttonMode = true;
            }
         }
         if(_normalNonoInfoA.length == 0)
         {
            _iconMc1.y -= 40;
            if(_superNonoInfoA.length > 4)
            {
               _leftBtn.y -= 40;
               _rightBtn.y -= 40;
            }
         }
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      private function onComHandler(e:SocketEvent) : void
      {
         var info:ExchangeItemInfo = null;
         SocketConnection.removeCmdListener(CommandID.ARM_UP_DONATE,onComHandler);
         var by:DonateInfo = e.data as DonateInfo;
         var count:uint = uint(by.donateCount);
         if(count == 0)
         {
            Alarm.show("该物资已经达到了今天的捐献额度上限，请明天再来捐献吧！");
         }
         else
         {
            TeamInfoController.setRemainDonate(count);
            (_panel["msgTxt"] as TextField).htmlText = "你今天还能捐献 " + TextFormatUtil.getRedTxt(TeamInfoController.remainDonate.toString()) + "个物资";
            info = _powerMc.info;
            info._itemNum -= count;
            if(info.itemNum < 0)
            {
               info._itemNum = 0;
            }
            _powerMc.info = info;
            Alarm.show("捐献成功！");
         }
         _donationBtn.mouseEnabled = true;
      }
      
      private function onLeftHandler(e:MouseEvent) : void
      {
         if(_curPage > 1)
         {
            --_curPage;
            addSuperIcon();
            if(_powerMc)
            {
               _powerMc.filters = [];
            }
            if(_curObj)
            {
               if(_curObj.isSuper)
               {
                  if(_powerMc)
                  {
                     _powerMc.filters = [];
                  }
                  _curObj = null;
               }
            }
         }
      }
      
      private function removeEvent() : void
      {
         var bg:MixtureBgPanel = null;
         var bg1:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _normalNonoInfoA.length; i1++)
         {
            bg = _iconMc.getChildByName("icon" + i1) as MixtureBgPanel;
            bg.removeEventListener(MouseEvent.CLICK,onClickHandler);
         }
         for(var i2:int = 0; i2 < 4; i2++)
         {
            bg1 = _iconMc1.getChildByName("sicon" + i2) as MixtureBgPanel;
            bg1.removeEventListener(MouseEvent.CLICK,onSuperClickHandler);
         }
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         _donationBtn.removeEventListener(MouseEvent.CLICK,onDoHandler);
         _gonoBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         _rightBtn.removeEventListener(MouseEvent.CLICK,onRightHandler);
         _leftBtn.removeEventListener(MouseEvent.CLICK,onLeftHandler);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _donationBtn.addEventListener(MouseEvent.CLICK,onDoHandler);
         _gonoBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _rightBtn.addEventListener(MouseEvent.CLICK,onRightHandler);
         _leftBtn.addEventListener(MouseEvent.CLICK,onLeftHandler);
      }
      
      private function addSuperIcon() : void
      {
         var item:MixtureBgPanel = null;
         var a:Array = _superNonoInfoA.slice((_curPage - 1) * 4,_curPage * 4);
         for(var i1:int = 0; i1 < 4; i1++)
         {
            item = _iconMc1.getChildByName("sicon" + i1) as MixtureBgPanel;
            if(Boolean(a[i1]) && a[i1] != undefined)
            {
               item.addIcon(a[i1]);
               item.buttonMode = true;
               item.addEventListener(MouseEvent.CLICK,onSuperClickHandler);
            }
            else
            {
               item.removeIcon();
               item.buttonMode = false;
               item.removeEventListener(MouseEvent.CLICK,onSuperClickHandler);
            }
         }
      }
   }
}


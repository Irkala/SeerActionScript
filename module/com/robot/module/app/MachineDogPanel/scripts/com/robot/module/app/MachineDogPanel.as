package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.NonoEvent;
   import com.robot.core.info.NonoInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.mode.AppModel;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.machineDog.CanChipCollectionPanel;
   import com.robot.module.app.machineDog.MachineDogStoragePanel;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class MachineDogPanel extends Sprite implements IModule
   {
      
      public static const NORMAL_FACE:String = "normal";
      
      public static const OPEN_FACE:String = "open";
      
      public static const CLOSE_FACE:String = "close";
      
      public static const CHARGING_FACE:String = "charging";
      
      public static const LOADCHIP_FACE:String = "loadChip";
      
      public static const HIDE_FACE:String = "hide";
      
      public static const LEVEL_UP:String = "levelup";
      
      private var _storageMc:MachineDogStoragePanel;
      
      private var _panelMc:MachineDogMainInfo_MC;
      
      private var _info:NonoInfo;
      
      private var _chipPanel:CanChipCollectionPanel;
      
      private var _baseInfoPanel:AppModel;
      
      public function MachineDogPanel()
      {
         super();
      }
      
      private function playFace(label:String) : void
      {
         _panelMc["faceMc"].gotoAndPlay(label);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panelMc);
      }
      
      private function hideBaseInfoPanel() : void
      {
         onCloseBaseInfoPanel(null);
      }
      
      private function removeEvent() : void
      {
         _panelMc["faceMc"].removeEventListener(Event.OPEN,onSuc1Handler);
         _panelMc["faceMc"].removeEventListener(Event.OPEN,onSucHandler);
         _panelMc["faceMc"].removeEventListener(Event.CLOSE,onCloseHandler);
         _panelMc["closeThisBtn"].removeEventListener(MouseEvent.CLICK,onCloseThisHandler);
         _panelMc["rightMc"].removeEventListener(MouseEvent.CLICK,onRightMcClickHandler);
         _panelMc["leftMc"].removeEventListener(MouseEvent.CLICK,onLeftMcClickHandler);
         _panelMc["closeMc"].removeEventListener(MouseEvent.CLICK,onCloseMcClickHandler);
         _panelMc["chargBtn"].removeEventListener(MouseEvent.CLICK,onChargBtnClickHandler);
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _panelMc["chipBtn"].removeEventListener(MouseEvent.CLICK,onChipBtnClickHandler);
         NonoManager.removeEventListener(NonoEvent.INFO_CHANGE,onChangerHandler);
         _panelMc["rightBtn"].removeEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
      }
      
      private function onOpenHandler() : void
      {
         _panelMc["rightMc"].mouseEnabled = false;
         _panelMc["rightMc"].mouseChildren = false;
         hideStoragePanel();
         _panelMc["faceMc"].addEventListener(Event.OPEN,onSucHandler);
         playFace(MachineDogPanel.LOADCHIP_FACE);
      }
      
      private function hideChipPanel() : void
      {
         _chipPanel.destroy();
         _chipPanel = null;
         _panelMc["pageTxt"].text = "";
         _panelMc["rightBtn"].removeEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         ToolTipManager.remove(_panelMc["chipBtn"]);
         ToolTipManager.add(_panelMc["chipBtn"],"打开功能");
         _panelMc["bgMc"].visible = false;
         _panelMc["leftBtn"].visible = false;
         _panelMc["rightBtn"].visible = false;
      }
      
      private function onSucHandler(e:Event) : void
      {
         _panelMc["faceMc"].removeEventListener(Event.OPEN,onSucHandler);
         _panelMc["rightMc"].mouseEnabled = true;
         _panelMc["rightMc"].mouseChildren = true;
         playFace(MachineDogPanel.NORMAL_FACE);
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as NonoInfo;
         if(_info.state[0])
         {
            _panelMc["closeBtn"].visible = false;
            _panelMc["closeMc"].visible = true;
            openAllEvent();
         }
         else
         {
            _panelMc["closeBtn"].visible = true;
            _panelMc["closeBtn"].buttonMode = true;
            _panelMc["closeMc"].visible = false;
            playFace(HIDE_FACE);
         }
         if(_info.chargeTime != 0)
         {
            _panelMc["chargBtn"].mouseEnabled = false;
         }
      }
      
      private function onCloseMcClickHandler(e:MouseEvent) : void
      {
         _panelMc["faceMc"].addEventListener(Event.CLOSE,onCloseHandler);
         playFace(MachineDogPanel.CLOSE_FACE);
         SocketConnection.send(CommandID.NONO_CLOSE_OPEN,0);
      }
      
      private function onChipBtnClickHandler(e:MouseEvent) : void
      {
         if(_baseInfoPanel)
         {
            hideBaseInfoPanel();
         }
         if(_storageMc)
         {
            hideStoragePanel();
         }
         if(_chipPanel)
         {
            hideChipPanel();
            _panelMc["bgMc"].visible = false;
            _panelMc["leftBtn"].visible = false;
            _panelMc["rightBtn"].visible = false;
         }
         else if(!_info.state[0])
         {
            Alarm.show("NoNo的功能只有在开机状态下才可以使用。");
         }
         else
         {
            _panelMc["bgMc"].visible = true;
            _panelMc["leftBtn"].visible = true;
            _panelMc["rightBtn"].visible = true;
            showChipPanel();
         }
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         if(MainManager.actorInfo.superNono == 1)
         {
            SocketConnection.addCmdListener(CommandID.NONO_CLOSE_OPEN,onNoNoOpenHandler);
            SocketConnection.send(CommandID.NONO_CLOSE_OPEN,1);
         }
         else if(NonoManager.info.power > 0)
         {
            SocketConnection.addCmdListener(CommandID.NONO_CLOSE_OPEN,onNoNoOpenHandler);
            SocketConnection.send(CommandID.NONO_CLOSE_OPEN,1);
         }
         else
         {
            Alarm.show("你的NoNo能量不够!");
         }
      }
      
      public function setup() : void
      {
         _panelMc = new MachineDogMainInfo_MC();
         ToolTipManager.add(_panelMc["chargBtn"],"充电");
         ToolTipManager.add(_panelMc["closeBtn"],"开机");
         ToolTipManager.add(_panelMc["closeMc"],"关机");
         ToolTipManager.add(_panelMc["rightMc"],"打开储藏空间");
         ToolTipManager.add(_panelMc["leftMc"],"打开基本资料");
         ToolTipManager.add(_panelMc["chipBtn"],"打开功能");
         ToolTipManager.add(_panelMc["closeThisBtn"],"关闭");
         _panelMc["leftMc"].gotoAndStop(1);
         _panelMc["rightMc"].gotoAndStop(1);
         _panelMc["bgMc"].visible = false;
         _panelMc["leftBtn"].visible = false;
         _panelMc["rightBtn"].visible = false;
         _panelMc["rightMc"].buttonMode = true;
         _panelMc["leftMc"].buttonMode = true;
      }
      
      private function closeAll() : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function showChipPanel() : void
      {
         _chipPanel = new CanChipCollectionPanel(_info.func,function():void
         {
            loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
         });
         LevelManager.appLevel.addChild(_chipPanel);
         _chipPanel.x = 480;
         _chipPanel.y = 280;
         _panelMc["rightBtn"].addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["pageTxt"].text = _chipPanel._curPage.toString() + "/" + _chipPanel._totalPage.toString();
         ToolTipManager.remove(_panelMc["chipBtn"]);
         ToolTipManager.add(_panelMc["chipBtn"],"关闭功能");
         _panelMc["bgMc"].visible = true;
         _panelMc["leftBtn"].visible = true;
         _panelMc["rightBtn"].visible = true;
      }
      
      private function removeAllEvent() : void
      {
         _panelMc["leftMc"].mouseEnabled = false;
         _panelMc["leftMc"].mouseChildren = false;
         _panelMc["rightMc"].mouseEnabled = false;
         _panelMc["rightMc"].mouseChildren = false;
         _panelMc["chipBtn"].mouseEnabled = false;
         _panelMc["closeMc"].mouseEnabled = false;
         _panelMc["leftBtn"].mouseEnabled = false;
         _panelMc["rightBtn"].mouseEnabled = false;
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
         if(_info.chargeTime != 0)
         {
            playFace(MachineDogPanel.CHARGING_FACE);
         }
      }
      
      private function onChargBtnClickHandler(e:MouseEvent) : void
      {
         onCloseThisHandler(null);
         if(_info.chargeTime == 0)
         {
            SocketConnection.send(CommandID.NONO_CHARGE,1);
         }
      }
      
      private function onRightBtnClickHandler(e:MouseEvent) : void
      {
         _chipPanel.rightMove();
         _panelMc["pageTxt"].text = _chipPanel._curPage.toString() + "/" + _chipPanel._totalPage.toString();
      }
      
      private function openAllEvent() : void
      {
         _panelMc["leftMc"].mouseEnabled = true;
         _panelMc["leftMc"].mouseChildren = true;
         _panelMc["rightMc"].mouseEnabled = true;
         _panelMc["rightMc"].mouseChildren = true;
         _panelMc["chipBtn"].mouseEnabled = true;
         _panelMc["closeMc"].mouseEnabled = true;
         _panelMc["leftBtn"].mouseEnabled = true;
         _panelMc["rightBtn"].mouseEnabled = true;
      }
      
      private function onChangerHandler(e:NonoEvent) : void
      {
         _panelMc["faceMc"].addEventListener(Event.OPEN,onSuc1Handler);
         playFace(MachineDogPanel.LOADCHIP_FACE);
      }
      
      private function showBaseInfoPanel() : void
      {
         _baseInfoPanel = new AppModel(ClientConfig.getAppModule("NewNonoInfoPanel"),"正在打开");
         _baseInfoPanel.setup();
         _baseInfoPanel.show();
         var obj:Object = new Object();
         obj.info = _info;
         obj.point = new Point(_panelMc.x,_panelMc.y);
         _baseInfoPanel.init(obj);
         _baseInfoPanel.sharedEvents.addEventListener(Event.CLOSE,onCloseBaseInfoPanel);
         _panelMc["leftMc"].gotoAndStop(2);
         ToolTipManager.remove(_panelMc["leftMc"]);
         ToolTipManager.add(_panelMc["leftMc"],"关闭基本资料");
      }
      
      private function hideStoragePanel() : void
      {
         _panelMc["rightMc"].gotoAndStop(1);
         _storageMc.destroy();
         _storageMc = null;
         ToolTipManager.remove(_panelMc["rightMc"]);
         ToolTipManager.add(_panelMc["rightMc"],"打开储藏空间");
      }
      
      private function showStoragePanel() : void
      {
         _panelMc["rightMc"].gotoAndStop(2);
         _storageMc = new MachineDogStoragePanel(closeAll,onOpenHandler,hideStoragePanel);
         _storageMc.show(new Point(_panelMc.x + _panelMc.width,_panelMc.y));
         ToolTipManager.remove(_panelMc["rightMc"]);
         ToolTipManager.add(_panelMc["rightMc"],"关闭储藏空间");
      }
      
      private function onCloseBaseInfoPanel(e:Event) : void
      {
         _panelMc["leftMc"].gotoAndStop(1);
         ToolTipManager.remove(_panelMc["leftMc"]);
         ToolTipManager.add(_panelMc["leftMc"],"显示基本资料");
         _baseInfoPanel.sharedEvents.removeEventListener(Event.CLOSE,onCloseBaseInfoPanel);
         _baseInfoPanel.destroy();
         _baseInfoPanel = null;
      }
      
      private function onCloseHandler(e:Event) : void
      {
         onCloseThisHandler(null);
      }
      
      private function onCloseThisHandler(e:MouseEvent) : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function onRightMcClickHandler(e:MouseEvent) : void
      {
         if(_baseInfoPanel)
         {
            hideBaseInfoPanel();
         }
         if(_chipPanel)
         {
            hideChipPanel();
         }
         if(!_storageMc)
         {
            showStoragePanel();
         }
         else
         {
            hideStoragePanel();
         }
      }
      
      private function onLeftBtnClickHandler(e:MouseEvent) : void
      {
         _chipPanel.leftMove();
         _panelMc["pageTxt"].text = _chipPanel._curPage.toString() + "/" + _chipPanel._totalPage.toString();
      }
      
      private function addEvent() : void
      {
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _panelMc["chargBtn"].addEventListener(MouseEvent.CLICK,onChargBtnClickHandler);
         _panelMc["rightMc"].addEventListener(MouseEvent.CLICK,onRightMcClickHandler);
         _panelMc["leftMc"].addEventListener(MouseEvent.CLICK,onLeftMcClickHandler);
         _panelMc["chipBtn"].addEventListener(MouseEvent.CLICK,onChipBtnClickHandler);
         _panelMc["closeMc"].addEventListener(MouseEvent.CLICK,onCloseMcClickHandler);
         _panelMc["rightBtn"].addEventListener(MouseEvent.CLICK,onRightBtnClickHandler);
         _panelMc["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftBtnClickHandler);
         _panelMc["closeThisBtn"].addEventListener(MouseEvent.CLICK,onCloseThisHandler);
         NonoManager.addEventListener(NonoEvent.INFO_CHANGE,onChangerHandler);
      }
      
      public function destroy() : void
      {
         ToolTipManager.remove(_panelMc["rightMc"]);
         ToolTipManager.remove(_panelMc["leftMc"]);
         ToolTipManager.remove(_panelMc["chargBtn"]);
         ToolTipManager.remove(_panelMc["closeBtn"]);
         ToolTipManager.remove(_panelMc["chipBtn"]);
         ToolTipManager.remove(_panelMc["closeMc"]);
         ToolTipManager.remove(_panelMc["closeThisBtn"]);
         removeEvent();
         if(_baseInfoPanel)
         {
            hideBaseInfoPanel();
         }
         if(_storageMc)
         {
            hideStoragePanel();
         }
         if(_chipPanel)
         {
            hideChipPanel();
         }
         hide();
         _panelMc = null;
      }
      
      private function onSuc1Handler(e:Event) : void
      {
         _panelMc["faceMc"].removeEventListener(Event.OPEN,onSuc1Handler);
         playFace(MachineDogPanel.LEVEL_UP);
      }
      
      private function onLeftMcClickHandler(e:MouseEvent) : void
      {
         if(_storageMc)
         {
            hideStoragePanel();
         }
         if(_chipPanel)
         {
            hideChipPanel();
         }
         if(!_baseInfoPanel)
         {
            showBaseInfoPanel();
         }
         else
         {
            hideBaseInfoPanel();
         }
      }
      
      private function onNoNoOpenHandler(e:SocketEvent) : void
      {
         if(NonoManager.info)
         {
            NonoManager.info.state[0] = true;
         }
         else
         {
            _info.state[0] = true;
         }
         SocketConnection.removeCmdListener(CommandID.NONO_CLOSE_OPEN,onNoNoOpenHandler);
         openAllEvent();
         playFace(MachineDogPanel.OPEN_FACE);
         _panelMc["chargBtn"].mouseEnabled = true;
         _panelMc["closeBtn"].visible = false;
         _panelMc["closeMc"].visible = true;
      }
   }
}


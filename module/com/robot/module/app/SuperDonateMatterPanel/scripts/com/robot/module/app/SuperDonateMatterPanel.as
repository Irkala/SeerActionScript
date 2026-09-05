package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.energyExchange.ExchangeItemInfo;
   import com.robot.core.info.team.DonateInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamInfoController;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.module.app.machineDog.MixtureBgPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SuperDonateMatterPanel extends Sprite implements IModule
   {
      
      private var _cancelBtn:SimpleButton;
      
      private var _sureBtn:SimpleButton;
      
      private var _powerMc:MixtureBgPanel;
      
      private var _info:ExchangeItemInfo;
      
      private var _mainMc:MovieClip;
      
      private var _needIdA:Array;
      
      private var _bgMc:MixtureBgPanel;
      
      private var _iconMc:Sprite;
      
      private var _closeBtn:SimpleButton;
      
      private var _glow:GlowFilter = new GlowFilter(16737792,1,4,4,10);
      
      private var _curId:uint;
      
      public function SuperDonateMatterPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _bgMc = null;
         _mainMc = null;
         _closeBtn = null;
         _sureBtn = null;
         _cancelBtn = null;
         _iconMc = null;
         _needIdA = null;
         _glow = null;
      }
      
      public function hide() : void
      {
         this.removeEvent();
         DisplayUtil.removeForParent(_mainMc);
      }
      
      public function setup() : void
      {
         _bgMc = new MixtureBgPanel();
         _mainMc = new SuperDonatePanel_Mc();
         _closeBtn = _mainMc["closeBtn"];
         _sureBtn = _mainMc["sureBtn"];
         _cancelBtn = _mainMc["gonoBtn"];
         _iconMc = _mainMc["iconMc"];
      }
      
      private function onSuceClickHandler(e:MouseEvent) : void
      {
         if(!_powerMc)
         {
            Alarm.show("你还没有选择一个你要捐献的物质。");
         }
         else
         {
            Alert.show("你确定要捐赠吗？",function():void
            {
               SocketConnection.addCmdListener(CommandID.ARM_UP_DONATE,onComHandler);
               SocketConnection.send(CommandID.ARM_UP_DONATE,TeamInfoController.info.buyTime,_info.itemId,_curId,_info.itemNum);
            });
         }
      }
      
      public function show() : void
      {
         _mainMc.addChild(_bgMc);
         _bgMc.x = 66;
         _bgMc.y = 46;
         LevelManager.appLevel.addChild(_mainMc);
         DisplayUtil.align(_mainMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
         addIcon();
      }
      
      private function onComHandler(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.ARM_UP_DONATE,onComHandler);
         var by:DonateInfo = e.data as DonateInfo;
         var count:uint = uint(by.donateCount);
         if(count == 0)
         {
            Alarm.show("该物质今天已经捐满了明天再来捐献吧！");
         }
         else
         {
            TeamInfoController.setRemainDonate(count);
            Alarm.show("捐献成功！");
            onCloseClickHandler(null);
         }
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as ExchangeItemInfo;
         _bgMc.addIcon(_info);
         _needIdA = TeamInfoController.needIdA;
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         var name:String = (e.currentTarget as MixtureBgPanel).name;
         var index:uint = uint(name.slice(4,name.length));
         _curId = _needIdA[index];
         (e.currentTarget as MixtureBgPanel).filters = [_glow];
         if(_powerMc)
         {
            _powerMc.filters = [];
         }
         _powerMc = e.currentTarget as MixtureBgPanel;
      }
      
      private function removeEvent() : void
      {
         var icon:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _needIdA.length; i1++)
         {
            icon = _iconMc.getChildByName("icon" + i1) as MixtureBgPanel;
            icon.addEventListener(MouseEvent.CLICK,onClickHandler);
         }
         SocketConnection.removeCmdListener(CommandID.ARM_UP_DONATE,onComHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseClickHandler);
         _sureBtn.removeEventListener(MouseEvent.CLICK,onSuceClickHandler);
         _cancelBtn.removeEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
         _sureBtn.addEventListener(MouseEvent.CLICK,onSuceClickHandler);
         _cancelBtn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
      }
      
      private function addIcon() : void
      {
         var icon:MixtureBgPanel = null;
         for(var i1:int = 0; i1 < _needIdA.length; i1++)
         {
            icon = new MixtureBgPanel();
            icon.addIconForId(_needIdA[i1]);
            icon.name = "icon" + i1;
            icon.addEventListener(MouseEvent.CLICK,onClickHandler);
            _iconMc.addChild(icon);
            icon.x = (icon.width + 25) * i1;
         }
         _iconMc.x = (_mainMc.width - _iconMc.width) / 2;
      }
   }
}


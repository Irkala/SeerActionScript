package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.app.fightExchange.control.ExchangeControl;
   import com.robot.module.app.fightExchange.mode.ExChangeItemSuccessInfo;
   import com.robot.module.app.fightExchange.view.MainView;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class FightExchangePanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _mainView:MainView;
      
      private var _panel:ExchangeMainPanel;
      
      public function FightExchangePanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._panel = new ExchangeMainPanel();
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      public function show() : void
      {
         SocketConnection.addCmdListener(CommandID.GET_HONOR_VALUE,function(param1:SocketEvent):void
         {
            SocketConnection.removeCmdListener(CommandID.GET_HONOR_VALUE,arguments.callee);
            var _loc3_:ByteArray = param1.data as ByteArray;
            var _loc4_:int = int(_loc3_.readUnsignedInt());
            ExchangeControl.honorValue = _loc4_;
            _closeBtn = _panel["closeBtn"];
            _mainView = new MainView();
            _mainView.setup();
            _panel["productCon_mc"].addChild(_mainView);
            _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
            _panel.x = 100;
            _panel.y = 10;
            _panel["honor_Txt"].text = _loc4_.toString();
            LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
            LevelManager.appLevel.addChild(_panel);
         });
         SocketConnection.send(CommandID.GET_HONOR_VALUE);
         EventManager.addEventListener("exchange_item_success",this.updateCoin);
      }
      
      private function updateCoin(param1:DynamicEvent) : void
      {
         var _loc2_:ExChangeItemSuccessInfo = param1.paramObject as ExChangeItemSuccessInfo;
         ExchangeControl.honorValue = _loc2_.topHonor;
         this._panel["honor_Txt"].text = _loc2_.topHonor;
      }
      
      public function hide() : void
      {
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onClose);
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         DisplayUtil.removeForParent(this._panel);
         ModuleManager.destroyForInstance(this);
         DisplayUtil.removeAllChild(this._mainView);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.hide();
      }
      
      public function destroy() : void
      {
         this._closeBtn = null;
         this._mainView = null;
         this._panel = null;
      }
   }
}


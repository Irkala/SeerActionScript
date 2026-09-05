package com.robot.module.app.petBreed
{
   import com.robot.app.buyItem.ProductAction;
   import com.robot.core.CommandID;
   import com.robot.core.controller.GetPetController;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class QuickHatchPanel
   {
      
      private var _ui:MovieClip;
      
      private var _info:EggInfo;
      
      private var _fun:Function;
      
      private var _cancel:Function;
      
      public function QuickHatchPanel()
      {
         super();
         this._ui = new quickHatch_ui();
         this._ui["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["buy"].addEventListener(MouseEvent.CLICK,this.onBuy);
         this._ui["cancel"].addEventListener(MouseEvent.CLICK,this.onClose);
         EventManager.addEventListener(RobotEvent.MONEY_BUY,this.onBuyItem);
      }
      
      public function show(param1:EggInfo, param2:Function, param3:Function) : void
      {
         this._info = param1;
         this._fun = param2;
         this._cancel = param3;
         LevelManager.appLevel.addChild(this._ui);
         DisplayUtil.align(this._ui,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.hide();
         this._cancel();
      }
      
      private function onBuy(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,function(param1:ItemEvent):void
         {
            ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,arguments.callee);
            if(Boolean(ItemManager.getCollectionInfo(400082)))
            {
               useItem();
            }
            else
            {
               ProductAction.buyMoneyProduct(200247);
            }
         });
         ItemManager.upDateCollection(400082);
      }
      
      private function onLink(param1:MouseEvent) : void
      {
      }
      
      private function onBuyItem(param1:DynamicEvent) : void
      {
         this.useItem();
      }
      
      private function useItem() : void
      {
         if(Boolean(this._info))
         {
            SocketConnection.addCmdListener(CommandID.START_USE_ITEM_HATCH,function(param1:SocketEvent):void
            {
               var by:ByteArray = null;
               var id:uint = 0;
               var ct:uint = 0;
               var e:SocketEvent = param1;
               id = 0;
               ct = 0;
               SocketConnection.removeCmdListener(CommandID.START_USE_ITEM_HATCH,arguments.callee);
               by = e.data as ByteArray;
               id = by.readUnsignedInt();
               ct = by.readUnsignedInt();
               hide();
               Alarm.show("成功使用孵化催化剂，从精灵蛋中孵化出了精灵！",function():void
               {
                  _fun();
                  GetPetController.getPet(id,ct);
               });
            });
            SocketConnection.send(CommandID.START_USE_ITEM_HATCH,this._info.ownerID,this._info.eggCatchTime);
         }
         else
         {
            SocketConnection.addCmdListener(CommandID.QUICKBREED_AFTER_STARTBREED,function(param1:SocketEvent):void
            {
               var by:ByteArray = null;
               var id:uint = 0;
               var ct:uint = 0;
               var e:SocketEvent = param1;
               id = 0;
               ct = 0;
               SocketConnection.removeCmdListener(CommandID.QUICKBREED_AFTER_STARTBREED,arguments.callee);
               by = e.data as ByteArray;
               id = by.readUnsignedInt();
               ct = by.readUnsignedInt();
               hide();
               Alarm.show("成功使用孵化催化剂，从精灵蛋中孵化出了精灵！",function():void
               {
                  _fun();
                  GetPetController.getPet(id,ct);
               });
            });
            SocketConnection.send(CommandID.QUICKBREED_AFTER_STARTBREED);
         }
      }
      
      public function hide() : void
      {
         if(Boolean(this._ui))
         {
            DisplayUtil.removeForParent(this._ui);
         }
      }
      
      public function destory() : void
      {
         this.hide();
         if(Boolean(this._ui))
         {
            this._ui["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
            this._ui["buy"].removeEventListener(MouseEvent.CLICK,this.onBuy);
            this._ui["link"].removeEventListener(MouseEvent.CLICK,this.onLink);
            this._ui["cancel"].removeEventListener(MouseEvent.CLICK,this.onClose);
            EventManager.removeEventListener(RobotEvent.MONEY_BUY,this.onBuyItem);
         }
         this._ui = null;
         this._info = null;
         this._fun = null;
      }
   }
}


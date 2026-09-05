package com.robot.module.book
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.controller.GetPetController;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.ItemInBagAlert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;
   import flash.text.TextFormatAlign;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetKingRewardsPanel extends Sprite implements IModule
   {
      
      private static const NAME_ARR:Array = ["草","水","火","电","战斗","飞行","机械","地面","冰"];
      
      private static const MAX_NUM:int = 9;
      
      private static const CRITICAL_NUM:int = 10;
      
      private var _exchangeBtn:SimpleButton;
      
      private var _panel:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _prevBtn:SimpleButton;
      
      private var _txtArr:Array;
      
      private var _mc:MovieClip;
      
      private var _nextBtn:SimpleButton;
      
      private var _rewardIDs:Array = [0,8,7,1,9,14,15,16,17,18,2,3,4,5,6,10,11,12,13];
      
      public function PetKingRewardsPanel()
      {
         super();
      }
      
      private function addEvent() : void
      {
         _prevBtn.addEventListener(MouseEvent.CLICK,onPrev);
         _nextBtn.addEventListener(MouseEvent.CLICK,onNext);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _exchangeBtn.addEventListener(MouseEvent.CLICK,onExchange);
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      private function onRewardsList(evt:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.MASTER_REWARDS,onRewardsList);
         var by:ByteArray = evt.data as ByteArray;
         var cnt:uint = by.readUnsignedInt();
         for(var i:uint = 0; i < MAX_NUM; i++)
         {
            (_txtArr[i] as TextField).htmlText = String(by.readUnsignedInt());
            trace((_txtArr[i] as TextField).htmlText);
         }
      }
      
      public function show() : void
      {
         _mc.visible = false;
         _prevBtn.visible = false;
         _nextBtn.visible = true;
         _exchangeBtn.visible = false;
         _panel.gotoAndStop(1);
         if(!DisplayUtil.hasParent(_panel))
         {
            LevelManager.appLevel.addChild(_panel);
         }
         _panel.x = 500;
         _panel.y = 260;
         addEvent();
         getData();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         hide();
         removeToolTip();
         _panel = null;
      }
      
      public function setup() : void
      {
         var name:String = null;
         _panel = new PetKingRewardsPanelUI();
         _panel.gotoAndStop(1);
         _prevBtn = _panel["prevBtn"];
         _nextBtn = _panel["nextBtn"];
         _closeBtn = _panel["closeBtn"];
         _exchangeBtn = _panel["exchangeBtn"];
         _mc = _panel["mc"];
         _txtArr = [];
         var textFormat:TextFormat = new TextFormat();
         textFormat.align = TextFormatAlign.CENTER;
         for(var i:uint = 0; i < MAX_NUM; i++)
         {
            name = "txt_" + i;
            TextField(_mc[name]).defaultTextFormat = textFormat;
            _mc[name].text = "0";
            _txtArr.push(_mc[name]);
         }
         initToolTip();
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onNext(e:MouseEvent) : void
      {
         _mc.visible = true;
         _prevBtn.visible = true;
         _exchangeBtn.visible = true;
         _panel.nextFrame();
         if(_panel.currentFrame == _panel.totalFrames)
         {
            _mc.visible = false;
            _exchangeBtn.visible = false;
            _nextBtn.visible = false;
         }
         if(_panel.currentFrame <= CRITICAL_NUM)
         {
            _exchangeBtn.x = -88;
            _exchangeBtn.y = 66;
         }
         else
         {
            _exchangeBtn.x = 173;
            _exchangeBtn.y = -72;
         }
      }
      
      private function onExchange(evt:MouseEvent) : void
      {
         trace(_rewardIDs[_panel.currentFrame - 1]);
         SocketConnection.addCmdListener(CommandID.GET_PET_KING_REWARDS,getRewards);
         SocketConnection.send(CommandID.GET_PET_KING_REWARDS,_rewardIDs[_panel.currentFrame - 1]);
      }
      
      private function getData() : void
      {
         SocketConnection.addCmdListener(CommandID.MASTER_REWARDS,onRewardsList);
         SocketConnection.send(CommandID.MASTER_REWARDS);
      }
      
      private function getRewards(evt:SocketEvent) : void
      {
         var i:uint;
         var bounsID:uint;
         var monBallList:Array;
         var data:ByteArray;
         var petID:uint;
         var itemCount:uint;
         var captureTm:uint;
         var itemId:uint = 0;
         var itemCt:uint = 0;
         var getItem:Function = function(arr:Array):void
         {
            var o:Object = null;
            if(arr.length > 0)
            {
               o = arr.shift();
               ItemInBagAlert.show(o["itemID"],"你获得了<font color=\'#ff0000\'>" + o["itemCnt"] + "</font>个" + TextFormatUtil.getRedTxt(ItemXMLInfo.getName(o["itemID"])),function():void
               {
                  getItem(arr);
               });
            }
         };
         SocketConnection.removeCmdListener(CommandID.GET_PET_KING_REWARDS,getRewards);
         data = evt.data as ByteArray;
         monBallList = [];
         bounsID = data.readUnsignedInt();
         petID = data.readUnsignedInt();
         captureTm = data.readUnsignedInt();
         itemCount = data.readUnsignedInt();
         for(i = 0; i < itemCount; i++)
         {
            itemId = data.readUnsignedInt();
            itemCt = data.readUnsignedInt();
            monBallList.push({
               "itemID":itemId,
               "itemCnt":itemCt
            });
         }
         if(petID != 0)
         {
            GetPetController.getPet(petID,captureTm);
         }
         getItem(monBallList);
         getData();
      }
      
      private function onPrev(e:MouseEvent) : void
      {
         _mc.visible = true;
         _exchangeBtn.visible = true;
         _nextBtn.visible = true;
         _panel.prevFrame();
         if(_panel.currentFrame == 1)
         {
            _mc.visible = false;
            _exchangeBtn.visible = false;
            _prevBtn.visible = false;
         }
         if(_panel.currentFrame <= CRITICAL_NUM)
         {
            _exchangeBtn.x = -88;
            _exchangeBtn.y = 66;
         }
         else
         {
            _exchangeBtn.x = 173;
            _exchangeBtn.y = -72;
         }
      }
      
      private function initToolTip() : void
      {
         for(var i:int = 0; i < MAX_NUM; i++)
         {
            ToolTipManager.add(_mc["prize_" + i],NAME_ARR[i] + "系奖牌");
         }
      }
      
      private function removeEvent() : void
      {
         _prevBtn.removeEventListener(MouseEvent.CLICK,onPrev);
         _nextBtn.removeEventListener(MouseEvent.CLICK,onNext);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _exchangeBtn.removeEventListener(MouseEvent.CLICK,onExchange);
      }
      
      private function removeToolTip() : void
      {
         for(var i:int = 0; i < MAX_NUM; i++)
         {
            ToolTipManager.remove(_mc["prize_" + i]);
         }
      }
   }
}


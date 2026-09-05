package com.robot.module.app
{
   import com.robot.app.spt.SptChannelController;
   import com.robot.app.spt.SptInfo;
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.map.config.MapConfig;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SptChannelPanel extends Sprite implements IModule
   {
      
      private var _picMc:MovieClip;
      
      private var _nameTxt1:TextField;
      
      private var _curIndex:uint = 0;
      
      private var _levMc:MovieClip;
      
      private var _desTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _nameTxt:TextField;
      
      private var _prevBtn:SimpleButton;
      
      private var _seatTxt:TextField;
      
      private var _conTxt:TextField;
      
      private var _sptMc:SptChannelMc;
      
      private var _nextBtn:SimpleButton;
      
      private var _sendBtn:SimpleButton;
      
      private var _infoA:Array = [];
      
      public function SptChannelPanel()
      {
         super();
      }
      
      private function addEvent() : void
      {
         _sendBtn.addEventListener(MouseEvent.CLICK,onSendHandler);
         _prevBtn.addEventListener(MouseEvent.CLICK,onPrevHandler);
         _nextBtn.addEventListener(MouseEvent.CLICK,onNextHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         DragManager.add(_sptMc["dragMc"],_sptMc);
      }
      
      private function onSendHandler(e:MouseEvent) : void
      {
         Alert.show("本次传送会花费你200赛尔豆，确认传送吗？",function():void
         {
            if(MainManager.actorInfo.coins >= 200)
            {
               SocketConnection.addCmdListener(CommandID.REMOVE_COINS,onSucHandler);
               SocketConnection.send(CommandID.REMOVE_COINS,200);
            }
            else
            {
               Alarm.show("你的赛尔豆不足以支付本次传送！");
            }
         });
      }
      
      private function removeEvent() : void
      {
         _sendBtn.removeEventListener(MouseEvent.CLICK,onSendHandler);
         _prevBtn.removeEventListener(MouseEvent.CLICK,onPrevHandler);
         _nextBtn.removeEventListener(MouseEvent.CLICK,onNextHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         DragManager.remove(_sptMc["dragMc"]);
      }
      
      private function onNextHandler(e:MouseEvent) : void
      {
         if(_curIndex < _infoA.length - 1)
         {
            ++_curIndex;
            showInfo(_curIndex);
         }
      }
      
      private function onSucHandler(e:SocketEvent) : void
      {
         var info:SptInfo = _infoA[_curIndex] as SptInfo;
         MainManager.actorInfo.coins -= 200;
         SocketConnection.removeCmdListener(CommandID.REMOVE_COINS,onSucHandler);
         SptChannelController.changeMap(info.enterID);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_sptMc);
         this.removeEvent();
      }
      
      public function init(data:Object = null) : void
      {
         _infoA = data as Array;
      }
      
      public function destroy() : void
      {
         hide();
         _sptMc = null;
         _sendBtn = null;
         _prevBtn = null;
         _nextBtn = null;
         _nameTxt = null;
         _nameTxt1 = null;
         _levMc = null;
         _seatTxt = null;
         _conTxt = null;
         _desTxt = null;
         _infoA = null;
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_sptMc);
         DisplayUtil.align(_sptMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
         showInfo(_curIndex);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         _sptMc = new SptChannelMc();
         _sendBtn = _sptMc["sendBtn"];
         _prevBtn = _sptMc["prevBtn"];
         _nextBtn = _sptMc["nextBtn"];
         _nameTxt = _sptMc["nameTxt"];
         _nameTxt1 = _sptMc["nameTxt1"];
         _levMc = _sptMc["lvMc"];
         _seatTxt = _sptMc["seatTxt"];
         _conTxt = _sptMc["conTxt"];
         _desTxt = _sptMc["desTxt"];
         _closeBtn = _sptMc["closeBtn"];
         _picMc = _sptMc["picMc"];
      }
      
      private function showInfo(index:uint) : void
      {
         var info:SptInfo = _infoA[index] as SptInfo;
         _nameTxt.text = info.title;
         _nameTxt1.text = info.title;
         _levMc.gotoAndStop(info.level);
         _seatTxt.text = MapConfig.getName(info.seatID);
         _conTxt.text = info.fightCondition;
         _desTxt.text = "    " + info.description;
         _picMc.gotoAndStop(index + 1);
      }
      
      private function onPrevHandler(e:MouseEvent) : void
      {
         if(_curIndex > 0)
         {
            --_curIndex;
            showInfo(_curIndex);
         }
      }
   }
}


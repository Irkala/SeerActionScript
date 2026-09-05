package com.robot.module.app
{
   import com.robot.app.petUpdate.PetUpdatePropController;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.uic.UIProPageBar;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.expadm.ExpAdmListItem;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DepthManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.MovieClipUtil;
   import org.taomee.utils.StringUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ExpAdmPanel extends Sprite implements IModule
   {
      
      private var _allExpTxt:TextField;
      
      private var _isAdd:Boolean;
      
      private var _showMc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:Sprite;
      
      private var _oldExp:Number;
      
      private var _nextBtn:SimpleButton;
      
      private var _infoTxt:TextField;
      
      private var _proTimeID:uint;
      
      private var _currItem:ExpAdmListItem;
      
      private var _listCon:Sprite;
      
      private var _dragBtn:SimpleButton;
      
      private var _proBar:UIProPageBar;
      
      private var _nickTxt:TextField;
      
      private var _inPutTxt:TextField;
      
      private var _preBtn:SimpleButton;
      
      private var _applyBtn:SimpleButton;
      
      private var _upExpTxt:TextField;
      
      public function ExpAdmPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _proBar.destroy();
         _proBar = null;
         _closeBtn = null;
         _dragBtn = null;
         _listCon = null;
         _currItem = null;
         _mainUI = null;
      }
      
      private function onExpAll(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.PET_GET_EXP,onExpAll);
         var data:ByteArray = e.data as ByteArray;
         var exp:uint = data.readUnsignedInt();
         _oldExp = exp;
         _proBar.totalLength = exp;
         _allExpTxt.text = "累积经验：" + exp.toString();
         if(exp > 0)
         {
            _inPutTxt.type = TextFieldType.INPUT;
         }
      }
      
      private function onInPut(e:Event) : void
      {
         var num:int = parseInt(_inPutTxt.text);
         if(num > _proBar.totalLength)
         {
            num = int(_proBar.totalLength);
         }
         if(num < 0)
         {
            num = 0;
         }
         _proBar.index = num;
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         var item:ExpAdmListItem = null;
         _mainUI = new UI_ExpAdmPanel();
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         _applyBtn = _mainUI["applyBtn"];
         _inPutTxt = _mainUI["inPutTxt"];
         _allExpTxt = _mainUI["allExpTxt"];
         _infoTxt = _mainUI["infoTxt"];
         _upExpTxt = _mainUI["upExpTxt"];
         _nickTxt = _mainUI["nickTxt"];
         _preBtn = _mainUI["preBtn"];
         _nextBtn = _mainUI["nextBtn"];
         _inPutTxt.restrict = "0-9";
         _infoTxt.text = "";
         _proBar = new UIProPageBar(_preBtn,_nextBtn,0);
         _listCon = new Sprite();
         _listCon.x = 192;
         _listCon.y = 76;
         _mainUI.addChild(_listCon);
         for(var i:int = 0; i < 6; i++)
         {
            item = new ExpAdmListItem();
            item.x = (item.width + 20) * int(i % 3);
            item.y = (item.height + 20) * int(i / 3);
            _listCon.addChild(item);
         }
      }
      
      private function onPetClick(e:MouseEvent) : void
      {
         _currItem.mouseEnabled = true;
         _currItem.setSelect(false);
         _currItem = e.currentTarget as ExpAdmListItem;
         _currItem.mouseEnabled = false;
         _currItem.setSelect(true);
         setInfo(PetManager.getPetInfo(_currItem.info.catchTime));
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      private function setInfo(info:PetInfo) : void
      {
         _infoTxt.text = "";
         _infoTxt.appendText("序号:" + StringUtil.renewZero(info.id.toString(),3) + "\n");
         _infoTxt.appendText("名字:" + PetXMLInfo.getName(info.id) + "\n");
         _infoTxt.appendText("等级:" + info.level.toString() + "\n");
         _infoTxt.appendText("性格:" + NatureXMLInfo.getName(info.nature) + "\n");
         _nickTxt.text = PetXMLInfo.getName(info.id);
         _upExpTxt.text = "升级所需经验值:\n" + (info.nextLvExp - info.exp).toString();
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),onResLoad,"pet");
      }
      
      private function onEnterUp(e:MouseEvent) : void
      {
         clearTimeout(_proTimeID);
         removeEventListener(Event.ENTER_FRAME,onEnterPro);
      }
      
      private function onProBarClick(e:DynamicEvent) : void
      {
         var i:int = e.paramObject as int;
         _allExpTxt.text = "积累经验：" + (_proBar.totalLength - i).toString();
         _inPutTxt.text = _proBar.index.toString();
      }
      
      private function onTimePro() : void
      {
         addEventListener(Event.ENTER_FRAME,onEnterPro);
      }
      
      public function hide() : void
      {
         clear();
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onEnterPro(e:Event) : void
      {
         if(_proBar.index < 0)
         {
            _proBar.index = 0;
            removeEventListener(Event.ENTER_FRAME,onEnterPro);
         }
         else if(_proBar.index > _proBar.totalLength)
         {
            _proBar.index = _proBar.totalLength;
            removeEventListener(Event.ENTER_FRAME,onEnterPro);
         }
         else if(_isAdd)
         {
            _proBar.nextIndex(1);
         }
         else
         {
            _proBar.preIndex(1);
         }
      }
      
      private function onResLoad(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         _showMc.x = 90;
         _showMc.y = 210;
         _showMc.scaleX = _showMc.scaleY = 3;
         _mainUI.addChild(_showMc);
         MovieClipUtil.childStop(_showMc,1);
      }
      
      private function onApply(e:MouseEvent) : void
      {
         if(_proBar.index == 0)
         {
            return;
         }
         if(_currItem == null)
         {
            return;
         }
         if(_currItem.info.level == 100)
         {
            Alarm.show("精灵已经到达100级，无法获得更多经验。");
            return;
         }
         Alert.show("你确定要这样分配经验吗？",function():void
         {
            SocketConnection.addCmdListener(CommandID.PET_SET_EXP,function(e:SocketEvent):void
            {
               var remoEx:Number;
               var data:ByteArray;
               var len:uint;
               SocketConnection.removeCmdListener(CommandID.PET_SET_EXP,arguments.callee);
               data = e.data as ByteArray;
               len = data.readUnsignedInt();
               remoEx = _oldExp - len;
               if(remoEx < 0)
               {
                  remoEx = 0;
               }
               Alarm.show("你的" + TextFormatUtil.getRedTxt(PetXMLInfo.getName(_currItem.info.id)) + "获得了" + TextFormatUtil.getBlueTxt(remoEx.toString()) + "点经验值，好像更喜欢你了呢。",function():void
               {
                  PetUpdatePropController.owner.show();
                  PetManager.upDate();
               });
               _proBar.totalLength = len;
               _oldExp = len;
               _allExpTxt.text = "积累经验：" + len.toString();
            });
            SocketConnection.send(CommandID.PET_SET_EXP,_currItem.info.catchTime,_proBar.index);
         });
      }
      
      private function onPetUpDate(e:PetEvent) : void
      {
         if(_currItem)
         {
            _currItem.show(PetManager.getPetInfo(_currItem.info.catchTime));
            setInfo(_currItem.info);
         }
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function clear() : void
      {
         var item:ExpAdmListItem = null;
         for(var i:int = 0; i < 6; i++)
         {
            item = _listCon.getChildAt(i) as ExpAdmListItem;
            item.removeEventListener(MouseEvent.CLICK,onPetClick);
            item.setSelect(false);
            item.clear();
         }
         _infoTxt.text = "";
         _nickTxt.text = "";
         _upExpTxt.text = "";
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(_mainUI);
         _mainUI.startDrag();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _proBar.removeEventListener(MouseEvent.CLICK,onProBarClick);
         _applyBtn.removeEventListener(MouseEvent.CLICK,onApply);
         _inPutTxt.removeEventListener(Event.CHANGE,onInPut);
         _preBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onEnterDown);
         _nextBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onEnterDown);
         _preBtn.removeEventListener(MouseEvent.MOUSE_UP,onEnterUp);
         _nextBtn.removeEventListener(MouseEvent.MOUSE_UP,onEnterUp);
         PetManager.removeEventListener(PetEvent.UPDATE_INFO,onPetUpDate);
         SocketConnection.removeCmdListener(CommandID.PET_GET_EXP,onExpAll);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _proBar.addEventListener(MouseEvent.CLICK,onProBarClick);
         _applyBtn.addEventListener(MouseEvent.CLICK,onApply);
         _inPutTxt.addEventListener(Event.CHANGE,onInPut);
         _preBtn.addEventListener(MouseEvent.MOUSE_DOWN,onEnterDown);
         _nextBtn.addEventListener(MouseEvent.MOUSE_DOWN,onEnterDown);
         _preBtn.addEventListener(MouseEvent.MOUSE_UP,onEnterUp);
         _nextBtn.addEventListener(MouseEvent.MOUSE_UP,onEnterUp);
         PetManager.addEventListener(PetEvent.UPDATE_INFO,onPetUpDate);
         SocketConnection.addCmdListener(CommandID.PET_GET_EXP,onExpAll);
      }
      
      private function onEnterDown(e:MouseEvent) : void
      {
         if(e.currentTarget == _preBtn)
         {
            _isAdd = false;
         }
         else
         {
            _isAdd = true;
         }
         if(_proBar.index >= 0 && _proBar.index <= _proBar.totalLength)
         {
            clearTimeout(_proTimeID);
            _proTimeID = setTimeout(onTimePro,1000);
         }
      }
      
      public function show() : void
      {
         var item:ExpAdmListItem = null;
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
         _proBar.totalLength = 0;
         _inPutTxt.text = "0";
         _inPutTxt.type = TextFieldType.DYNAMIC;
         var petArr:Array = PetManager.infos;
         var pLen:int = int(PetManager.length);
         for(var i:int = 0; i < pLen; i++)
         {
            item = _listCon.getChildAt(i) as ExpAdmListItem;
            item.show(petArr[i]);
            item.addEventListener(MouseEvent.CLICK,onPetClick);
         }
         if(pLen > 0)
         {
            _currItem = _listCon.getChildAt(0) as ExpAdmListItem;
            _currItem.setSelect(true);
            setInfo(_currItem.info);
         }
         SocketConnection.send(CommandID.PET_GET_EXP);
      }
   }
}


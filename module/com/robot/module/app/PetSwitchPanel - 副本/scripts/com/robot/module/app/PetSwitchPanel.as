package com.robot.module.app
{
   import com.robot.app.petbag.ui.PetBagListItem;
   import com.robot.app.sceneInteraction.RoomPetManager;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.info.pet.PetListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.PetInBagAlert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetSwitchPanel extends Sprite implements IModule
   {
      
      private static const LIST_LENGTH:int = 6;
      
      private var _listCon:Sprite;
      
      private var _dragBtn:SimpleButton;
      
      private var _switchBtn:SimpleButton;
      
      private var _storageSwitchInfo:PetListInfo;
      
      private var _closeBtn:SimpleButton;
      
      private var _isSwitching:Boolean = false;
      
      private var _mainUI:Sprite;
      
      private var _curretItem:PetBagListItem;
      
      public function PetSwitchPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _listCon = null;
         _switchBtn = null;
         _mainUI = null;
         _curretItem = null;
         _dragBtn = null;
         _closeBtn = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(this);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         addEvent();
         PetManager.upDate();
      }
      
      private function onSwitch(e:MouseEvent) : void
      {
         if(_curretItem == null || _curretItem.info == null)
         {
            Alarm.show("未选中替换精灵");
            return;
         }
         if(_isSwitching)
         {
            return;
         }
         _isSwitching = true;
         PetManager.addEventListener(PetEvent.STORAGE_ADDED,onStoAdd);
         PetManager.bagToInStorage(_curretItem.info.catchTime);
      }
      
      public function setup() : void
      {
         var item:PetBagListItem = null;
         _mainUI = new PetSwitch_Panel();
         _switchBtn = _mainUI["switchBtn"];
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         addChild(_mainUI);
         _listCon = new Sprite();
         _listCon.x = 30;
         _listCon.y = 70;
         addChild(_listCon);
         var i:int = 0;
         while(i < LIST_LENGTH)
         {
            item = new PetBagListItem();
            item.y = (item.height + 6) * int(i / 2);
            item.x = (item.width + 6) * (i % 2);
            _listCon.addChild(item);
            i++;
         }
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         _curretItem.isSelect = false;
         _curretItem = e.currentTarget as PetBagListItem;
         _curretItem.isSelect = true;
      }
      
      public function init(data:Object = null) : void
      {
         _storageSwitchInfo = data as PetListInfo;
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onStoAdd(e:PetEvent) : void
      {
         PetManager.removeEventListener(PetEvent.STORAGE_ADDED,onStoAdd);
         PetManager.addEventListener(PetEvent.ADDED,onBagAdd);
         PetManager.storageToInBag(_storageSwitchInfo.catchTime);
      }
      
      private function onUpDate(e:PetEvent) : void
      {
         reItem();
      }
      
      private function reItem() : void
      {
         var item2:PetBagListItem = null;
         var info:PetInfo = null;
         var item:PetBagListItem = null;
         _curretItem = null;
         var k:int = 0;
         while(k < LIST_LENGTH)
         {
            item2 = _listCon.getChildAt(k) as PetBagListItem;
            item2.mouseEnabled = false;
            item2.hide();
            item2.removeEventListener(MouseEvent.CLICK,onItemClick);
            k++;
         }
         var _listData:Array = PetManager.infos;
         var len:int = Math.min(LIST_LENGTH,_listData.length);
         var i:int = 0;
         while(i < len)
         {
            info = _listData[i] as PetInfo;
            item = _listCon.getChildAt(i) as PetBagListItem;
            item.show(info);
            item.name = info.id.toString();
            item.mouseEnabled = true;
            item.addEventListener(MouseEvent.CLICK,onItemClick);
            i++;
         }
         _curretItem = _listCon.getChildAt(0) as PetBagListItem;
         _curretItem.isSelect = true;
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         stopDrag();
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         startDrag();
      }
      
      private function removeEvent() : void
      {
         _switchBtn.removeEventListener(MouseEvent.CLICK,onSwitch);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         PetManager.removeEventListener(PetEvent.UPDATE_INFO,onUpDate);
         PetManager.removeEventListener(PetEvent.STORAGE_ADDED,onStoAdd);
         PetManager.removeEventListener(PetEvent.ADDED,onBagAdd);
      }
      
      private function onBagAdd(e:PetEvent) : void
      {
         _isSwitching = false;
         hide();
         PetInBagAlert.show(_storageSwitchInfo.id,TextFormatUtil.getRedTxt(PetXMLInfo.getName(_storageSwitchInfo.id)) + "已经放入了你的精灵背包。");
         var info:PetListInfo = new PetListInfo();
         info.catchTime = _storageSwitchInfo.catchTime;
         info.id = _storageSwitchInfo.id;
         RoomPetManager.getInstance().showOrHide(info,false);
      }
      
      private function addEvent() : void
      {
         _switchBtn.addEventListener(MouseEvent.CLICK,onSwitch);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         PetManager.addEventListener(PetEvent.UPDATE_INFO,onUpDate);
      }
   }
}


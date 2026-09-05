package com.robot.module.app.spriteFusion
{
   import com.robot.app.petbag.ui.PetBagListItem;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.SpriteFusionPanel;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class PetChoosePanel extends Sprite
   {
      
      public static const PET_CHOOSE:String = "Pet_Choose";
      
      private static const LIST_LENGTH:int = 6;
      
      private var _listCon:Sprite;
      
      private var _chooseBtn:SimpleButton;
      
      private var _dragBtn:SimpleButton;
      
      private var _isMaster:Boolean = false;
      
      private var _chosPetIDArr:Array = [];
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:Sprite;
      
      private var _curretItem:PetBagListItem;
      
      public function PetChoosePanel()
      {
         super();
         setup();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(this);
      }
      
      public function setup() : void
      {
         var item:PetBagListItem = null;
         _mainUI = new PetChoose_Panel();
         _chooseBtn = _mainUI["chooseBtn"];
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         addChild(_mainUI);
         _listCon = new Sprite();
         _listCon.x = 30;
         _listCon.y = 70;
         addChild(_listCon);
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = new PetBagListItem();
            item.y = (item.height + 6) * int(i / 2);
            item.x = (item.width + 6) * (i % 2);
            _listCon.addChild(item);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function hasChosPet(evt:DynamicEvent) : void
      {
         EventManager.removeEventListener(SpriteFusionPanel.HAS_CHOS_PET,hasChosPet);
         _chosPetIDArr = evt.paramObject as Array;
         reItem();
      }
      
      private function unEableChoose(item:PetBagListItem) : void
      {
         item.filters = [ColorFilter.setGrayscale()];
         item.mouseEnabled = false;
         item.buttonMode = false;
         item.removeEventListener(MouseEvent.CLICK,onItemClick);
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         if(_curretItem)
         {
            _curretItem.isSelect = false;
            _curretItem = null;
         }
         _curretItem = e.currentTarget as PetBagListItem;
         _curretItem.isSelect = true;
      }
      
      private function onUpDate(e:PetEvent) : void
      {
         reItem();
         EventManager.addEventListener(SpriteFusionPanel.HAS_CHOS_PET,hasChosPet);
      }
      
      private function onChoosePet(e:MouseEvent) : void
      {
         if(_curretItem == null)
         {
            Alarm.show("请选择你的精灵噢!");
            return;
         }
         EventManager.dispatchEvent(new DynamicEvent(PET_CHOOSE,_curretItem.info));
         hide();
      }
      
      private function reItem() : void
      {
         var item2:PetBagListItem = null;
         var info:PetInfo = null;
         var item:PetBagListItem = null;
         _curretItem = null;
         for(var k:int = 0; k < LIST_LENGTH; k++)
         {
            item2 = _listCon.getChildAt(k) as PetBagListItem;
            item2.mouseEnabled = false;
            item2.hide();
            item2.removeEventListener(MouseEvent.CLICK,onItemClick);
         }
         var _listData:Array = PetManager.infos;
         var len:int = Math.min(LIST_LENGTH,_listData.length);
         for(var i:int = 0; i < len; i++)
         {
            info = _listData[i] as PetInfo;
            item = _listCon.getChildAt(i) as PetBagListItem;
            item.show(info);
            item.name = info.id.toString();
            item.filters = [];
            item.buttonMode = true;
            item.mouseEnabled = true;
            item.addEventListener(MouseEvent.CLICK,onItemClick);
            if(_isMaster)
            {
               if(!PetXMLInfo.fuseMaster(item.info.id))
               {
                  unEableChoose(item);
               }
            }
            else if(!PetXMLInfo.fuseSub(item.info.id))
            {
               unEableChoose(item);
            }
            if(item.info.catchTime == _chosPetIDArr[0] || item.info.catchTime == _chosPetIDArr[1])
            {
               unEableChoose(item);
            }
         }
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
         _chooseBtn.removeEventListener(MouseEvent.CLICK,onChoosePet);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         PetManager.removeEventListener(PetEvent.UPDATE_INFO,onUpDate);
      }
      
      private function addEvent() : void
      {
         _chooseBtn.addEventListener(MouseEvent.CLICK,onChoosePet);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         PetManager.addEventListener(PetEvent.UPDATE_INFO,onUpDate);
      }
      
      public function destroy() : void
      {
         hide();
         _listCon = null;
         _chooseBtn = null;
         _mainUI = null;
         _curretItem = null;
         _dragBtn = null;
         _closeBtn = null;
      }
      
      public function show(b:Boolean) : void
      {
         _isMaster = b;
         LevelManager.appLevel.addChild(this);
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         addEvent();
         PetManager.upDate();
      }
   }
}


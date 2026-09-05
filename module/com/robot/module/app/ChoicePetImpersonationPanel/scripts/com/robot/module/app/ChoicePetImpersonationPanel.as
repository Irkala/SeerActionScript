package com.robot.module.app
{
   import com.robot.app.petSimulationTraining.PetSimulationTrainingController;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.machineDog.PetExeBgPanel;
   import com.robot.module.app.petStorage.TypeBtnPanel;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.events.DynamicEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ChoicePetImpersonationPanel extends Sprite implements IModule
   {
      
      private var _listCon:Sprite;
      
      public var _curInfo:PetListInfo;
      
      private var _allInfoA:Array;
      
      private var _curType:uint;
      
      private const _defType:uint = 1;
      
      private var _typePanel:TypeBtnPanel;
      
      private var _mainUI:PetImpersonationExercise_MC;
      
      private var _curPage:uint;
      
      private var _glow:GlowFilter = new GlowFilter(16776960,1,4,4,10);
      
      private var _totalPage:uint;
      
      private var _curMc:PetExeBgPanel;
      
      private const MAX_LIST:uint = 9;
      
      public function ChoicePetImpersonationPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         removeItem();
         hide();
         if(_typePanel)
         {
            _typePanel.destroy();
            _typePanel = null;
         }
         _mainUI = null;
         _listCon = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function addEvent() : void
      {
         _typePanel.addEventListener(MouseEvent.CLICK,onTypeClickHandler);
         _mainUI["dragMc"].addEventListener(MouseEvent.MOUSE_DOWN,onDragBtnDownHandler);
         _mainUI["choiceBtn"].addEventListener(MouseEvent.CLICK,onChoiceBtnClickHandler);
         _mainUI["cancelBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _mainUI["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _mainUI["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftClickHandler);
         _mainUI["rightBtn"].addEventListener(MouseEvent.CLICK,onRightClickHandler);
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function show() : void
      {
         var a:Array = null;
         _typePanel = new TypeBtnPanel(_mainUI["typeMc"],_defType);
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         if(!_listCon)
         {
            addPetBg();
         }
         makePage(getTypeList(_defType));
         if(getTypeList(_defType).length > 0)
         {
            a = getTypeList(_defType).slice((_curPage - 1) * MAX_LIST,_curPage * MAX_LIST);
            setItemValue(a);
         }
         setPage();
         addEvent();
      }
      
      private function removeEvent() : void
      {
         _mainUI["dragMc"].removeEventListener(MouseEvent.MOUSE_DOWN,onDragBtnDownHandler);
         _typePanel.removeEventListener(MouseEvent.CLICK,onTypeClickHandler);
         _mainUI["choiceBtn"].removeEventListener(MouseEvent.CLICK,onChoiceBtnClickHandler);
         _mainUI["cancelBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _mainUI["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _mainUI["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftClickHandler);
         _mainUI["rightBtn"].removeEventListener(MouseEvent.CLICK,onRightClickHandler);
      }
      
      public function init(data:Object = null) : void
      {
         _allInfoA = data as Array;
      }
      
      private function onItemClickHandler(e:MouseEvent) : void
      {
         if(_curMc)
         {
            _curMc.filters = [];
         }
         var bg:PetExeBgPanel = e.currentTarget as PetExeBgPanel;
         bg.filters = [_glow];
         _curInfo = bg.info;
         PetSimulationTrainingController.info = _curInfo;
         _mainUI["choiceBtn"].mouseEnabled = true;
         _curMc = bg;
      }
      
      private function setItemValue(a:Array) : void
      {
         var item:PetExeBgPanel = null;
         for(var i1:int = 0; i1 < a.length; i1++)
         {
            item = _listCon.getChildByName("bg" + i1) as PetExeBgPanel;
            item.buttonMode = true;
            item.addEventListener(MouseEvent.CLICK,onItemClickHandler);
            item.addPet(a[i1]);
         }
      }
      
      private function makePage(a:Array) : void
      {
         _curPage = 1;
         if(a.length > 0)
         {
            if(a.length <= MAX_LIST)
            {
               _totalPage = 1;
            }
            else if(a.length % MAX_LIST == 0)
            {
               _totalPage = a.length / MAX_LIST;
            }
            else
            {
               _totalPage = int(a.length / MAX_LIST) + 1;
            }
         }
         else
         {
            _totalPage = 1;
         }
      }
      
      public function addPetBg() : void
      {
         var bg:PetExeBgPanel = null;
         _listCon = new Sprite();
         _listCon.x = 200;
         _listCon.y = 60;
         _mainUI.addChild(_listCon);
         for(var i1:int = 0; i1 < MAX_LIST; i1++)
         {
            bg = new PetExeBgPanel();
            bg.y = (bg.height + 6) * int(i1 / 3);
            bg.x = (bg.width + 6) * (i1 % 3);
            _listCon.addChild(bg);
            bg.name = "bg" + i1;
            bg.addEventListener(MouseEvent.CLICK,onItemClickHandler);
         }
      }
      
      private function onUpHandler(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function onChoiceBtnClickHandler(e:MouseEvent) : void
      {
         if(!_curInfo)
         {
            Alarm.show("你还没有选择一个精灵！");
         }
         else
         {
            if(_curInfo.course != 0)
            {
               Alarm.show("该精灵正在训练中...");
               return;
            }
            loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
         }
      }
      
      private function onDragBtnDownHandler(e:MouseEvent) : void
      {
         _mainUI.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
      }
      
      private function setPage() : void
      {
         _mainUI["pageTxt"].text = _curPage.toString() + "/" + _totalPage.toString();
      }
      
      private function onLeftClickHandler(e:MouseEvent) : void
      {
         var a:Array = null;
         if(_curPage > 1)
         {
            _mainUI["choiceBtn"].mouseEnabled = false;
            if(_curMc)
            {
               _curMc.filters = [];
            }
            --_curPage;
            setPage();
            a = getTypeList(_curType).slice((_curPage - 1) * MAX_LIST,_curPage * MAX_LIST);
            removeItem();
            setItemValue(a);
         }
      }
      
      private function getTypeList(type:uint) : Array
      {
         var a:Array = [];
         for(var i1:int = 0; i1 < _allInfoA.length; i1++)
         {
            if(PetXMLInfo.getType(_allInfoA[i1].id) == type.toString())
            {
               a.push(_allInfoA[i1]);
            }
         }
         return a;
      }
      
      private function onTypeClickHandler(e:DynamicEvent) : void
      {
         _curType = e.paramObject as uint;
         removeItem();
         makePage(getTypeList(_curType));
         if(getTypeList(_curType).length > 0)
         {
            setItemValue(getTypeList(_curType).slice((_curPage - 1) * MAX_LIST,_curPage * MAX_LIST));
         }
         if(_curMc)
         {
            _curMc.filters = [];
         }
         setPage();
      }
      
      public function setup() : void
      {
         _mainUI = new PetImpersonationExercise_MC();
         _mainUI["choiceBtn"].mouseEnabled = false;
         _mainUI["dragMc"].buttonMode = true;
         _curType = _defType;
      }
      
      private function removeItem() : void
      {
         var item:PetExeBgPanel = null;
         for(var i:int = 0; i < 9; i++)
         {
            item = _listCon.getChildByName("bg" + i) as PetExeBgPanel;
            item.removePet();
            item.buttonMode = false;
            item.removeEventListener(MouseEvent.CLICK,onItemClickHandler);
         }
      }
      
      private function onRightClickHandler(e:MouseEvent) : void
      {
         var a:Array = null;
         if(_curPage < _totalPage)
         {
            _mainUI["choiceBtn"].mouseEnabled = false;
            if(_curMc)
            {
               _curMc.filters = [];
            }
            ++_curPage;
            setPage();
            a = getTypeList(_curType).slice((_curPage - 1) * MAX_LIST,_curPage * MAX_LIST);
            removeItem();
            setItemValue(a);
         }
      }
   }
}


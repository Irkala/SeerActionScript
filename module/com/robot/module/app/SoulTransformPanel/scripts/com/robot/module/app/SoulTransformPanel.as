package com.robot.module.app
{
   import com.robot.app.ParseSocketError;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.controller.GetPetController;
   import com.robot.core.manager.HatchTask.HatchTaskInfo;
   import com.robot.core.manager.HatchTaskManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.app.soulTransform.SoulBeadInfo;
   import com.robot.module.app.soulTransform.SoulBeadItem;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.setTimeout;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DepthManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SoulTransformPanel extends Sprite implements IModule
   {
      
      private var _currentItem:SoulBeadItem;
      
      private var _info:SoulBeadInfo;
      
      private var _receiveBtn:SimpleButton;
      
      private var _trasfingMC:MovieClip;
      
      private var _pageTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _soulBeadItemID:uint;
      
      private var _nextBtn:SimpleButton;
      
      private var _breedTimeTxt:TextField;
      
      private var _itemContainer:Sprite;
      
      private var _mainUI:Sprite;
      
      private var _itemSpace:Number = 18;
      
      private var _soulBeadMC:MovieClip;
      
      private var _dragBtn:SimpleButton;
      
      private var _soulBeadList:Array = [];
      
      private var _len:uint = 5;
      
      private var _preBtn:SimpleButton;
      
      private var _startPoint:Point = new Point(73,173);
      
      private var _page:int = 1;
      
      private var _soulTransfingPanel:MovieClip;
      
      private var _totalPage:int = 1;
      
      private var _applyBtn:SimpleButton;
      
      public function SoulTransformPanel()
      {
         super();
      }
      
      private function getTransformData() : void
      {
         SocketConnection.addCmdListener(CommandID.GET_SOULBEAD_STATUS,function(e:SocketEvent):void
         {
            var breedTm:uint;
            var by:ByteArray;
            var obTainTm:uint = 0;
            SocketConnection.removeCmdListener(CommandID.GET_SOULBEAD_STATUS,arguments.callee);
            by = e.data as ByteArray;
            obTainTm = by.readUnsignedInt();
            _soulBeadItemID = by.readUnsignedInt();
            breedTm = by.readUnsignedInt();
            if(obTainTm != 0)
            {
               if(breedTm == 0)
               {
                  _trasfingMC.gotoAndStop(2);
                  _soulTransfingPanel["timeMC"].visible = false;
                  _receiveBtn.visible = true;
                  _receiveBtn.addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
                  {
                     _receiveBtn.removeEventListener(MouseEvent.CLICK,arguments.callee);
                     SocketConnection.addCmdListener(CommandID.SOULBEAD_TO_PET,getTransformPet);
                     SocketConnection.send(CommandID.SOULBEAD_TO_PET,obTainTm);
                  });
               }
            }
            chooseColor(_soulTransfingPanel["mc"],_soulBeadItemID);
            _breedTimeTxt.text = Math.ceil(breedTm / 3600).toString();
            HatchTaskManager.removeHeadStatus(obTainTm);
            MainManager.actorInfo.obtainTm = obTainTm;
         });
         SocketConnection.send(CommandID.GET_SOULBEAD_STATUS);
      }
      
      public function setup() : void
      {
         _mainUI = new UI_SoulTransformPanel();
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         _applyBtn = _mainUI["applyBtn"];
         _applyBtn.mouseEnabled = false;
         _applyBtn.filters = [ColorFilter.setGrayscale()];
         _preBtn = _mainUI["preBtn"];
         _preBtn.mouseEnabled = false;
         _nextBtn = _mainUI["nextBtn"];
         _nextBtn.mouseEnabled = false;
         _pageTxt = _mainUI["pageTxt"];
         _itemContainer = new Sprite();
         _mainUI.addChild(_itemContainer);
         _itemContainer.x = _startPoint.x;
         _itemContainer.y = _startPoint.y;
         _soulTransfingPanel = new UI_SoulTrasfingPanel();
         _soulTransfingPanel["closeBtn"].addEventListener(MouseEvent.CLICK,function(evt:MouseEvent):void
         {
            DisplayUtil.removeForParent(_soulTransfingPanel);
         });
         _breedTimeTxt = _soulTransfingPanel["timeMC"]["timeTxt"];
         _soulBeadMC = _soulTransfingPanel["mc"];
         _receiveBtn = _soulTransfingPanel["receiveBtn"];
         _receiveBtn.visible = false;
         _trasfingMC = _soulTransfingPanel["trasfingMC"];
         _trasfingMC.gotoAndStop(1);
         ParseSocketError.addErrorListener(103548,closeTransfingPanel);
         ParseSocketError.addErrorListener(13032,closeTransfingPanel);
         ParseSocketError.addErrorListener(13034,closeTransfingPanel);
         ParseSocketError.addErrorListener(103547,closeTransfingPanel);
      }
      
      private function getTransformPet(evt:SocketEvent) : void
      {
         var by:ByteArray;
         var monID:uint = 0;
         var captTm:uint = 0;
         var mc:MovieClip = null;
         DisplayUtil.removeForParent(_soulTransfingPanel);
         SocketConnection.removeCmdListener(CommandID.SOULBEAD_TO_PET,getTransformPet);
         by = evt.data as ByteArray;
         monID = by.readUnsignedInt();
         captTm = by.readUnsignedInt();
         if(monID == 0 || captTm == 0)
         {
            return;
         }
         mc = new SBdToPetMC();
         chooseColor(mc,_soulBeadItemID);
         LevelManager.topLevel.addChild(mc);
         DisplayUtil.align(mc,null,AlignType.MIDDLE_CENTER);
         mc["mc"].gotoAndPlay(2);
         mc["mc"].addEventListener(Event.ENTER_FRAME,function(evt:Event):void
         {
            if(mc["mc"].currentFrame == mc["mc"].totalFrames)
            {
               mc["mc"].removeEventListener(Event.ENTER_FRAME,arguments.callee);
               DisplayUtil.removeForParent(mc);
               showPet(monID,captTm);
            }
         });
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function chooseColor(mc:MovieClip, itemID:uint) : void
      {
         switch(itemID)
         {
            case 1000001:
               DisplayUtil.FillColor(mc,2752273);
               break;
            case 1000002:
               DisplayUtil.FillColor(mc,52479);
               break;
            case 1000003:
               DisplayUtil.FillColor(mc,16716049);
               break;
            case 1000004:
               DisplayUtil.FillColor(mc,10053120);
               break;
            case 1000005:
               DisplayUtil.FillColor(mc,3342335);
               break;
            case 1000006:
               DisplayUtil.FillColor(mc,16750848);
               break;
            case 1000007:
               DisplayUtil.FillColor(mc,16777173);
               break;
            case 1000008:
               DisplayUtil.FillColor(mc,6632191);
               break;
            case 1000009:
               DisplayUtil.FillColor(mc,16751103);
         }
      }
      
      private function onClickItem(evt:MouseEvent) : void
      {
         if(_currentItem)
         {
            _currentItem.mc.gotoAndStop(1);
         }
         var item:SoulBeadItem = evt.currentTarget as SoulBeadItem;
         _currentItem = item;
         _currentItem.mc.gotoAndStop(2);
         _applyBtn.mouseEnabled = true;
         _applyBtn.filters = [];
      }
      
      private function closeTransfingPanel(evt:Event) : void
      {
         DisplayUtil.removeForParent(_soulTransfingPanel);
      }
      
      private function onNextPage(evt:MouseEvent) : void
      {
         ++_page;
         _preBtn.mouseEnabled = true;
         if(_page >= _totalPage)
         {
            _nextBtn.mouseEnabled = false;
         }
         var arr:Array = _soulBeadList.slice((_page - 1) * _len,_page * _len);
         addItemInfo(arr);
         updatePage();
      }
      
      private function addItemInfo(arr:Array) : void
      {
         var itemInfo:SoulBeadInfo = null;
         var info:HatchTaskInfo = null;
         var name:String = null;
         var item:SoulBeadItem = null;
         for(var i:uint = 0; i < _len; i++)
         {
            itemInfo = new SoulBeadInfo();
            info = arr[i];
            name = "item_" + i;
            item = _itemContainer.getChildByName(name) as SoulBeadItem;
            if(info)
            {
               itemInfo.obtainTime = info.obtainTime;
               itemInfo.itemID = info.itemID;
               item.buttonMode = true;
               item.addEventListener(MouseEvent.CLICK,onClickItem);
            }
            item.info = itemInfo;
         }
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      private function getItemList() : void
      {
         var info:HatchTaskInfo = null;
         for each(info in HatchTaskManager.beadMap.getValues())
         {
            if(info.isComplete)
            {
               _soulBeadList.push(info);
            }
         }
         _totalPage = Math.ceil(_soulBeadList.length / _len);
         if(_soulBeadList.length > _len)
         {
            _nextBtn.mouseEnabled = true;
         }
         updatePage();
         addItem();
      }
      
      private function showChosSoulPanel() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         getItemList();
         addEvent();
      }
      
      private function onApply(e:MouseEvent) : void
      {
         hide();
         if(_currentItem)
         {
            _info = _currentItem.info;
         }
         SocketConnection.addCmdListener(CommandID.TRANSFORM_SOULBEAD,function(evt:SocketEvent):void
         {
            SocketConnection.removeCmdListener(CommandID.TRANSFORM_SOULBEAD,arguments.callee);
            showTransfingPanel();
         });
         SocketConnection.send(CommandID.TRANSFORM_SOULBEAD,_info.obtainTime);
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function addItem() : void
      {
         var item:SoulBeadItem = null;
         for(var i:uint = 0; i < _len; i++)
         {
            item = new SoulBeadItem();
            item.x = (_itemSpace + item.width) * i;
            item.name = "item_" + i;
            _itemContainer.addChild(item);
         }
         var arr:Array = _soulBeadList.slice(0,5);
         addItemInfo(arr);
      }
      
      private function showPet(monID:uint, captTm:uint) : void
      {
         ResourceManager.getResource(ClientConfig.getPetSwfPath(monID),function(m:MovieClip):void
         {
            m.gotoAndStop("rightdown");
            m.addEventListener(Event.ENTER_FRAME,function():void
            {
               var mc:MovieClip = m.getChildAt(0) as MovieClip;
               if(mc)
               {
                  mc.gotoAndStop(1);
                  m.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               }
            });
            DisplayUtil.stopAllMovieClip(m);
            LevelManager.topLevel.addChild(m);
            DisplayUtil.align(m,null,AlignType.MIDDLE_CENTER);
            setTimeout(function():void
            {
               DisplayUtil.removeForParent(m);
               m = null;
               MainManager.actorInfo.obtainTm = 0;
               GetPetController.getPet(monID,captTm);
            },1500);
         },"pet");
      }
      
      private function showTransfingPanel() : void
      {
         if(DisplayUtil.hasParent(_soulTransfingPanel))
         {
            return;
         }
         LevelManager.appLevel.addChild(_soulTransfingPanel);
         DisplayUtil.align(_soulTransfingPanel,null,AlignType.MIDDLE_CENTER);
         getTransformData();
      }
      
      private function onPrePage(evt:MouseEvent) : void
      {
         --_page;
         _nextBtn.mouseEnabled = true;
         if(_page <= 1)
         {
            _preBtn.mouseEnabled = false;
         }
         var arr:Array = _soulBeadList.slice((_page - 1) * _len,_page * _len);
         addItemInfo(arr);
         updatePage();
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
         _preBtn.removeEventListener(MouseEvent.CLICK,onPrePage);
         _nextBtn.removeEventListener(MouseEvent.CLICK,onNextPage);
         _applyBtn.removeEventListener(MouseEvent.CLICK,onApply);
      }
      
      private function updatePage() : void
      {
         if(_page <= 1)
         {
            _page = 1;
         }
         if(_totalPage <= 0)
         {
            _totalPage = 1;
         }
         _pageTxt.text = _page + "/" + _totalPage;
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _preBtn.addEventListener(MouseEvent.CLICK,onPrePage);
         _nextBtn.addEventListener(MouseEvent.CLICK,onNextPage);
         _applyBtn.addEventListener(MouseEvent.CLICK,onApply);
      }
      
      public function destroy() : void
      {
         hide();
         _closeBtn = null;
         _dragBtn = null;
         _mainUI = null;
         DisplayUtil.removeAllChild(_soulTransfingPanel);
         DisplayUtil.removeForParent(_soulTransfingPanel);
         _soulTransfingPanel = null;
         ParseSocketError.removeErrorListener(103548,closeTransfingPanel);
         ParseSocketError.removeErrorListener(13032,closeTransfingPanel);
         ParseSocketError.removeErrorListener(13034,closeTransfingPanel);
         ParseSocketError.removeErrorListener(103547,closeTransfingPanel);
      }
      
      public function show() : void
      {
         if(MainManager.actorInfo.obtainTm == 0)
         {
            showChosSoulPanel();
         }
         else
         {
            showTransfingPanel();
         }
      }
   }
}


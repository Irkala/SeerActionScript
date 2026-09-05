package com.robot.module.app.spriteTrack
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class MapTrackPanel extends Sprite
   {
      
      private var _spritePointArr:Array = [[0,0],[70,0],[0,80],[70,80]];
      
      private var _starIds:Array;
      
      private var _starCtair:Sprite;
      
      private var _starIcon:MovieClip;
      
      private var _point:Point = new Point(428,65);
      
      private var _mapCtair:Sprite;
      
      private var _closeBtn:SimpleButton;
      
      private var _itemCtair:IconItemContainer;
      
      private var _mainUI:MovieClip;
      
      private var _mapPointArr:Array = [[80,110],[263,110],[80,254],[263,254]];
      
      private var _spriteDetailPanel:SpriteDetailPanel;
      
      private var _spriteCtair:Sprite;
      
      private var _backBtn:SimpleButton;
      
      private var _starUrl:String;
      
      private var _loadPanel:MLoadPane;
      
      public function MapTrackPanel()
      {
         super();
         initMapTrack();
      }
      
      public function destroy() : void
      {
         EventManager.removeEventListener(IconItemContainer.CHOS_STAR_ITEM,chooseStar);
         if(_itemCtair)
         {
            _itemCtair.destroy();
            _itemCtair = null;
         }
         if(_loadPanel)
         {
            _loadPanel.destroy();
            _loadPanel = null;
         }
         if(_mainUI)
         {
            DisplayUtil.removeAllChild(_mainUI);
            _mainUI = null;
         }
         if(_starCtair)
         {
            DisplayUtil.removeAllChild(_starCtair);
            _starCtair = null;
         }
         DisplayUtil.removeAllChild(this);
      }
      
      private function showSpriDetailPanel(evt:DynamicEvent) : void
      {
         DisplayUtil.removeForParent(this);
         _spriteDetailPanel = new SpriteDetailPanel(uint(evt.paramObject));
         LevelManager.appLevel.addChild(_spriteDetailPanel);
         _spriteDetailPanel.x = 160;
         _spriteDetailPanel.y = 30;
      }
      
      private function chooseStar(evt:DynamicEvent) : void
      {
         if(_starIcon)
         {
            DisplayUtil.removeForParent(_starIcon);
         }
         DisplayUtil.removeAllChild(_spriteCtair);
         DisplayUtil.removeAllChild(_mapCtair);
         changeStarInfo(uint(evt.paramObject));
      }
      
      private function addItemCtair(value:Array, type:uint) : void
      {
         _itemCtair = new IconItemContainer(value,type);
         _mainUI.addChild(_itemCtair);
         _itemCtair.x = _point.x;
         _itemCtair.y = _point.y;
      }
      
      private function initMapTrack() : void
      {
         _mainUI = new UI_MapTrackPanle();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _backBtn = _mainUI["backBtn"];
         _backBtn.addEventListener(MouseEvent.CLICK,onBack);
         _starIds = SpriteTrackXMLInfo.getStarIdS();
         addStarCtair();
         addItemCtair(_starIds,0);
         addEvent();
         show();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      private function starIconLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            _starIcon = mc;
            _starIcon.scaleX = 2.5;
            _starIcon.scaleY = 2.5;
            _starCtair.addChildAt(_starIcon,0);
         }
         else
         {
            _starUrl = "";
         }
      }
      
      private function onBack(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this);
         EventManager.dispatchEvent(new DynamicEvent("back"));
      }
      
      private function addStarCtair() : void
      {
         _mapCtair = new Sprite();
         _mainUI.addChild(_mapCtair);
         _starCtair = new Sprite();
         _mainUI.addChild(_starCtair);
         _starCtair.x = 222;
         _starCtair.y = 228;
         _spriteCtair = new Sprite();
         _starCtair.addChild(_spriteCtair);
         _spriteCtair.x = -30;
         _spriteCtair.y = -30;
      }
      
      private function changeStarInfo(id:uint) : void
      {
         var j:uint = 0;
         var mapID:uint = 0;
         var mapIcon:MapIcon = null;
         var i:uint = 0;
         var starSpID:uint = 0;
         var si:SpriteIcon = null;
         var starXML:XML = SpriteTrackXMLInfo.getStarXML(id);
         var starSpXMLlist:XMLList = starXML.sprite;
         var mapList:XMLList = starXML.map;
         if(mapList.length() > 0)
         {
            for(j = 0; j < mapList.length(); j++)
            {
               mapID = uint(mapList[j].@id);
               mapIcon = new MapIcon(mapID);
               _mapCtair.addChild(mapIcon);
               mapIcon.x = _mapPointArr[j][0];
               mapIcon.y = _mapPointArr[j][1];
            }
         }
         if(starSpXMLlist.length() > 0)
         {
            for(i = 0; i < starSpXMLlist.length(); i++)
            {
               starSpID = uint(starSpXMLlist[i].@id);
               si = new SpriteIcon(starSpID);
               _spriteCtair.addChild(si);
               si.x = _spritePointArr[i][0];
               si.y = _spritePointArr[i][1];
            }
         }
         _starUrl = "resource/planet/icon/" + id + ".swf";
         ResourceManager.getResource(_starUrl,starIconLoaded,"star");
      }
      
      private function addEvent() : void
      {
         EventManager.addEventListener(IconItemContainer.CHOS_STAR_ITEM,chooseStar);
         EventManager.addEventListener(SpriteIcon.SHOW_DETAIL_SPRITE,showSpriDetailPanel);
      }
      
      private function show() : void
      {
         if(DisplayUtil.hasParent(this))
         {
            return;
         }
         this.addChild(_mainUI);
      }
   }
}


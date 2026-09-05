package com.robot.module.app.spriteTrack
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.manager.MapManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.text.TextField;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class SpriteDetailPanel extends Sprite
   {
      
      private var _status:uint;
      
      private var _starID:uint;
      
      private var _goBtn:SimpleButton;
      
      private var _loadPanel:MLoadPane;
      
      private var _starPoint:Point = new Point(460,150);
      
      private var _closeBtn:SimpleButton;
      
      private var _nameTxt:TextField;
      
      private var _statusMC:MovieClip;
      
      private var _hauntAeraMC:MovieClip;
      
      private var _mapPointArr:Array = [[305,212],[412,212],[516,212]];
      
      private var _mainUI:MovieClip;
      
      private var _spriteCtair:Sprite;
      
      private var _backBtn:SimpleButton;
      
      private var _introInfoTxt:TextField;
      
      private var _spriteID:uint;
      
      public function SpriteDetailPanel(id:uint)
      {
         super();
         _spriteID = id;
         init(id);
      }
      
      private function addEvent() : void
      {
      }
      
      public function destroy() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _backBtn.removeEventListener(MouseEvent.CLICK,onBack);
         _goBtn.removeEventListener(MouseEvent.CLICK,goTargetMap);
         if(_mainUI)
         {
            DisplayUtil.removeForParent(_mainUI);
            _mainUI = null;
         }
         DisplayUtil.removeAllChild(this);
      }
      
      private function goTargetMap(evt:MouseEvent) : void
      {
         var mapID:uint = SpriteTrackXMLInfo.getSpriteMapID(_spriteID);
         if(_spriteID != 0)
         {
            MapManager.changeMap(mapID);
         }
      }
      
      private function onLoaded(o:MovieClip) : void
      {
         var _showMc:MovieClip = null;
         _showMc = o as MovieClip;
         if(_showMc)
         {
            _showMc.gotoAndStop("rightdown");
            _showMc.addEventListener(Event.ENTER_FRAME,function():void
            {
               var mc:MovieClip = _showMc.getChildAt(0) as MovieClip;
               if(mc)
               {
                  mc.gotoAndStop(1);
                  _showMc.removeEventListener(Event.ENTER_FRAME,arguments.callee);
               }
            });
            DisplayUtil.stopAllMovieClip(_showMc);
            _loadPanel.setIcon(_showMc);
            _loadPanel.scaleX = 2;
            _loadPanel.scaleY = 2;
         }
         else
         {
            trace("load false!");
         }
      }
      
      private function init(id:uint) : void
      {
         _mainUI = new UI_SpriteDetailPanel();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _backBtn = _mainUI["backBtn"];
         _backBtn.addEventListener(MouseEvent.CLICK,onBack);
         _nameTxt = _mainUI["nameTxt"];
         _nameTxt.text = SpriteTrackXMLInfo.getSpriteName(id);
         _introInfoTxt = _mainUI["infoTxt"];
         _introInfoTxt.text = "    " + SpriteTrackXMLInfo.getSpriteIntro(id);
         _statusMC = _mainUI["statusMC"];
         _status = SpriteTrackXMLInfo.getSpriteStatus(id);
         _statusMC.gotoAndStop(_status + 1);
         _hauntAeraMC = _mainUI["hauntAeraMC"];
         _hauntAeraMC.gotoAndStop(1);
         if(_status == 2)
         {
            _hauntAeraMC.gotoAndStop(2);
         }
         _goBtn = _mainUI["goBtn"];
         if(_status == 2 || id == 77)
         {
            _goBtn.visible = false;
         }
         else
         {
            _goBtn.addEventListener(MouseEvent.CLICK,goTargetMap);
         }
         _starID = SpriteTrackXMLInfo.getSpriteStarID(id);
         addSpriteCtair(id);
         if(id == 77)
         {
            addSpecialStarMap();
            addStar(0);
         }
         else
         {
            addStar(_starID);
            addSpriteMap();
         }
         addEvent();
         show();
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         destroy();
         DisplayUtil.removeForParent(this);
      }
      
      private function addSpriteCtair(id:uint) : void
      {
         _spriteCtair = new Sprite();
         _mainUI.addChild(_spriteCtair);
         _spriteCtair.y = 100;
         _loadPanel = new MLoadPane();
         _loadPanel.setSizeWH(120,120);
         _spriteCtair.addChild(_loadPanel);
         _loadPanel.x = -60;
         _loadPanel.y = -60;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(id),onLoaded,"pet");
      }
      
      private function starIconLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            _mainUI.addChild(mc);
            mc.scaleX = 2;
            mc.scaleY = 2;
            mc.x = _starPoint.x;
            mc.y = _starPoint.y;
         }
      }
      
      private function addStar(starID:uint) : void
      {
         var url:String = "resource/planet/icon/" + starID + ".swf";
         ResourceManager.getResource(url,starIconLoaded,"star");
      }
      
      private function onBack(evt:MouseEvent) : void
      {
         destroy();
         DisplayUtil.removeForParent(this);
         EventManager.dispatchEvent(new DynamicEvent("back"));
      }
      
      private function addSpriteMap() : void
      {
         var mapIcon:TxtMapIcon = null;
         var mIcon:TxtMapIcon = null;
         var mapList:Array = SpriteTrackXMLInfo.getSpriteMapList(_spriteID);
         if(mapList.length == 1)
         {
            mapIcon = new TxtMapIcon(mapList[0]);
            _mainUI.addChild(mapIcon);
            mapIcon.x = _mapPointArr[1][0];
            mapIcon.y = _mapPointArr[1][1];
            return;
         }
         for(var i:uint = 0; i < mapList.length; i++)
         {
            mIcon = new TxtMapIcon(mapList[i]);
            _mainUI.addChild(mIcon);
            mIcon.x = _mapPointArr[i][0];
            mIcon.y = _mapPointArr[i][1];
         }
      }
      
      private function addSpecialStarMap() : void
      {
         var mapIcon:TxtMapIcon = new TxtMapIcon(0);
         _mainUI.addChild(mapIcon);
         mapIcon.x = _mapPointArr[1][0];
         mapIcon.y = _mapPointArr[1][1];
         mapIcon.mapNameTxt.text = "帕诺星系";
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


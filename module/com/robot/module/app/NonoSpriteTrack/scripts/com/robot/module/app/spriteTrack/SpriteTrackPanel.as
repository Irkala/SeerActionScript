package com.robot.module.app.spriteTrack
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.DisplayUtil;
   
   public class SpriteTrackPanel extends Sprite
   {
      
      private var _point:Point = new Point(428,65);
      
      private var _closeBtn:SimpleButton;
      
      private var _itemCtair:IconItemContainer;
      
      private var _spriteUrl:String;
      
      private var _mainUI:MovieClip;
      
      private var _spriteDetailPanel:SpriteDetailPanel;
      
      private var _spriteIds:Array;
      
      private var _spriteCtair:Sprite;
      
      private var _backBtn:SimpleButton;
      
      private var _spriteID:uint;
      
      public function SpriteTrackPanel()
      {
         super();
         init();
      }
      
      private function onLoaded(mc:MovieClip) : void
      {
         if(mc)
         {
            _spriteCtair.addChild(mc);
            mc.name = _spriteID.toString();
            mc.buttonMode = true;
            mc.mouseChildren = false;
            mc.addEventListener(MouseEvent.CLICK,onClickSprite);
         }
         else
         {
            _spriteUrl = "";
         }
      }
      
      private function addItemCtair(value:Array, type:uint) : void
      {
         _itemCtair = new IconItemContainer(value,type);
         _mainUI.addChild(_itemCtair);
         _itemCtair.x = _point.x;
         _itemCtair.y = _point.y;
      }
      
      private function init() : void
      {
         _mainUI = new UI_SpriteTrackPanel();
         _closeBtn = _mainUI["closeBtn"];
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _backBtn = _mainUI["backBtn"];
         _backBtn.addEventListener(MouseEvent.CLICK,onBack);
         _spriteIds = SpriteTrackXMLInfo.getSpriteIdS();
         _spriteIds.sort(Array.NUMERIC);
         addSpriteCtair();
         addItemCtair(_spriteIds,1);
         addEvent();
         show();
      }
      
      private function addSpriteCtair() : void
      {
         _spriteCtair = new Sprite();
         _mainUI.addChild(_spriteCtair);
         _spriteCtair.x = 222;
         _spriteCtair.y = 228;
      }
      
      private function onClickSprite(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this);
         var mc:MovieClip = evt.currentTarget as MovieClip;
         mc.removeEventListener(MouseEvent.CLICK,onClickSprite);
         if(_spriteDetailPanel)
         {
            DisplayUtil.removeForParent(_spriteDetailPanel);
            _spriteDetailPanel.destroy();
            _spriteDetailPanel = null;
         }
         _spriteDetailPanel = new SpriteDetailPanel(_spriteID);
         LevelManager.appLevel.addChild(_spriteDetailPanel);
         _spriteDetailPanel.x = 160;
         _spriteDetailPanel.y = 30;
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      private function onBack(evt:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this);
         EventManager.dispatchEvent(new DynamicEvent("back"));
      }
      
      private function changeStarInfo(id:uint) : void
      {
         _spriteUrl = "resource/pet/illustration/" + id + ".swf";
         ResourceManager.getResource(_spriteUrl,onLoaded,"pet");
         _spriteID = id;
      }
      
      private function addEvent() : void
      {
         EventManager.addEventListener(IconItemContainer.CHOS_SPRITE_ITEM,chooseSprite);
      }
      
      public function destroy() : void
      {
         EventManager.removeEventListener(IconItemContainer.CHOS_SPRITE_ITEM,chooseSprite);
         if(_itemCtair)
         {
            _itemCtair.destroy();
            _itemCtair = null;
         }
         if(_mainUI)
         {
            DisplayUtil.removeAllChild(_mainUI);
            _mainUI = null;
         }
         if(_spriteCtair)
         {
            DisplayUtil.removeAllChild(_spriteCtair);
            _spriteCtair = null;
         }
         DisplayUtil.removeAllChild(this);
      }
      
      private function chooseSprite(evt:DynamicEvent) : void
      {
         DisplayUtil.removeAllChild(_spriteCtair);
         changeStarInfo(uint(evt.paramObject));
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


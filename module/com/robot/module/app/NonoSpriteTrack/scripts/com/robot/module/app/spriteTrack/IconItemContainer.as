package com.robot.module.app.spriteTrack
{
   import com.robot.core.uic.UIScrollBar;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.events.DynamicEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class IconItemContainer extends Sprite
   {
      
      public static const CHOS_STAR_ITEM:String = "Choose_Star_Item";
      
      public static const CHOS_SPRITE_ITEM:String = "Choose_Sprite_Item";
      
      private var _upBtn:SimpleButton;
      
      private var _txtMC:MovieClip;
      
      private var _barMc:MovieClip;
      
      private var _scrollBar:UIScrollBar;
      
      private var _defaultValue:Array;
      
      private var _type:uint;
      
      private var _downBtn:SimpleButton;
      
      private var _barPoint:Point = new Point(215,50);
      
      private var _scrollMc:MovieClip;
      
      private var _mainUI:MovieClip;
      
      private var _defaultLen:uint = 5;
      
      private var _itemSpace:Number = 48;
      
      private var _value:Array;
      
      private var _clickItem:IconItem;
      
      private var _itemPoint:Point = new Point(30,40);
      
      public function IconItemContainer(value:Array, type:uint)
      {
         super();
         _value = value;
         _type = type;
         if(_value)
         {
            init();
         }
      }
      
      public function destroy() : void
      {
         DisplayUtil.removeAllChild(_mainUI);
         DisplayUtil.removeAllChild(this);
         if(_scrollBar)
         {
            _scrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
            _scrollBar = null;
         }
         _scrollMc = null;
         _txtMC = null;
         removeItem();
         _mainUI = null;
      }
      
      private function cofigScrolBar() : void
      {
         if(_value.length > _defaultLen)
         {
            this._scrollMc.visible = true;
            _barMc.visible = true;
            _scrollBar = new UIScrollBar(_barMc,_scrollMc["barBg"],_defaultLen,_upBtn,_downBtn);
            _scrollBar.scrollY = 10;
            _scrollBar.wheelObject = this;
            _scrollBar.totalLength = _value.length;
            _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         }
         else
         {
            this._scrollMc.visible = false;
            if(_scrollBar)
            {
               _scrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
               _scrollBar.destroy();
               _scrollBar = null;
            }
         }
         _barMc.x = 0;
         _barMc.y = 16;
      }
      
      private function init() : void
      {
         _mainUI = new IconItemCtairBg();
         this.addChild(_mainUI);
         _txtMC = _mainUI["txtMC"];
         _txtMC.gotoAndStop(_type + 1);
         _scrollMc = new ScrollBarMC();
         _mainUI.addChild(_scrollMc);
         _scrollMc.visible = false;
         _scrollMc.x = _barPoint.x;
         _scrollMc.y = _barPoint.y;
         _upBtn = _scrollMc["upBtn"];
         _downBtn = _scrollMc["downBtn"];
         _barMc = _scrollMc["barBall"];
         getData();
         addItem();
         cofigScrolBar();
      }
      
      private function chooseItem(evt:MouseEvent) : void
      {
         if(_clickItem)
         {
            _clickItem.mc.gotoAndStop(1);
         }
         var item:IconItem = evt.currentTarget as IconItem;
         item.mc.gotoAndStop(2);
         _clickItem = item;
         if(item.type == 0)
         {
            EventManager.dispatchEvent(new DynamicEvent(IconItemContainer.CHOS_STAR_ITEM,item.id));
         }
         if(item.type == 1)
         {
            EventManager.dispatchEvent(new DynamicEvent(IconItemContainer.CHOS_SPRITE_ITEM,item.id));
         }
      }
      
      private function getData() : void
      {
         if(_value.length > _defaultLen)
         {
            _defaultValue = _value.slice(0,_defaultLen);
         }
         else
         {
            _defaultValue = _value;
            _defaultLen = _value.length;
         }
      }
      
      private function addItem() : void
      {
         var id:uint = 0;
         var item:IconItem = null;
         for(var i:uint = 0; i < _defaultLen; i++)
         {
            id = uint(_defaultValue[i]);
            item = new IconItem(id,_type);
            item.x = _itemPoint.x;
            item.y = _itemPoint.y + i * _itemSpace;
            item.name = "item_" + i;
            _mainUI.addChild(item);
            item.addEventListener(MouseEvent.CLICK,chooseItem);
         }
      }
      
      private function removeItem() : void
      {
         var item:IconItem = null;
         for(var i:int = 0; i < _defaultLen; i++)
         {
            item = _mainUI.getChildByName("item_" + i) as IconItem;
            if(item)
            {
               item.removeEventListener(MouseEvent.CLICK,chooseItem);
               item.destroy();
               DisplayUtil.removeForParent(item);
               item = null;
            }
         }
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var id:uint = 0;
         var item:IconItem = null;
         if(_clickItem)
         {
            _clickItem.mc.gotoAndStop(1);
         }
         var a:Array = _value;
         var index:uint = uint(_scrollBar.index);
         for(var i:int = 0; i < _defaultLen; i++)
         {
            id = uint(_value[i + index]);
            item = _mainUI.getChildByName("item_" + i) as IconItem;
            item.setInfo(id,_type);
         }
      }
   }
}


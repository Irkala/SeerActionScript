package com.robot.module.app
{
   import com.robot.core.config.xml.DoodleXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.uic.UIProPageBar;
   import com.robot.module.app.doodle.DoodleListItem;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.DynamicEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class DoodlePanel extends Sprite implements IModule
   {
      
      private static const ALERT_STR:String = "你已做过这种涂装\n不用浪费赛尔豆了";
      
      private static const MAX:int = 8;
      
      private var _proBar:UIProPageBar;
      
      private var _dataList:Array = [];
      
      private var _currItem:DoodleListItem;
      
      private var _listCon:Sprite;
      
      private var _actionMc:MovieClip;
      
      private var _index:int;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:Sprite;
      
      private var _applyBtn:SimpleButton;
      
      public function DoodlePanel()
      {
         super();
      }
      
      public function hide() : void
      {
         _currItem = null;
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function onApply(e:MouseEvent) : void
      {
         if(_currItem == null)
         {
            Alarm.show("你还没有选择要装扮的涂装！");
            return;
         }
         if(_currItem.info.texture == 0)
         {
            if(MainManager.actorInfo.texture == 0)
            {
               if(_currItem.info.color == MainManager.actorInfo.color)
               {
                  Alarm.show(ALERT_STR);
                  return;
               }
            }
         }
         else if(_currItem.info.color == MainManager.actorInfo.color && _currItem.info.texture == MainManager.actorInfo.texture)
         {
            Alarm.show(ALERT_STR);
            return;
         }
         MainManager.actorModel.changeDoodle(_currItem.info);
         hide();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         var item:DoodleListItem = null;
         _mainUI = new UI_DoodlePanel();
         _closeBtn = _mainUI["closeBtn"];
         _applyBtn = _mainUI["applyBtn"];
         _actionMc = _mainUI["actionMc"];
         _actionMc.gotoAndStop(1);
         _listCon = new Sprite();
         _listCon.x = 90;
         _listCon.y = 360;
         _mainUI.addChild(_listCon);
         var dml:XMLList = DoodleXMLInfo.getList();
         var xmlLen:int = dml.length();
         for(var x:int = 0; x < xmlLen; x++)
         {
            _dataList.push(uint(dml[x].@ID));
         }
         var len:int = Math.min(MAX,_dataList.length);
         for(var i:int = 0; i < len; i++)
         {
            item = new DoodleListItem();
            item.index = i;
            item.setInfo(_dataList[item.index]);
            item.x = 62 * i;
            item.addEventListener(MouseEvent.CLICK,onItemClick);
            _listCon.addChild(item);
         }
         _proBar = new UIProPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],MAX);
         _proBar.totalLength = _dataList.length;
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         if(_currItem)
         {
            _currItem.setSelect(false);
         }
         _currItem = e.currentTarget as DoodleListItem;
         _currItem.setSelect(true);
         _index = _currItem.index;
      }
      
      private function onProClick(e:DynamicEvent) : void
      {
         var item:DoodleListItem = null;
         var index:int = e.paramObject as int;
         var len:int = _listCon.numChildren;
         for(var i:int = 0; i < len; i++)
         {
            item = _listCon.getChildAt(i) as DoodleListItem;
            item.index = i + index;
            item.setInfo(_dataList[item.index]);
            item.setSelect(false);
            if(item.index == _index)
            {
               item.setSelect(true);
            }
         }
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _proBar.removeEventListener(MouseEvent.CLICK,onProClick);
         _applyBtn.removeEventListener(MouseEvent.CLICK,onApply);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _proBar.addEventListener(MouseEvent.CLICK,onProClick);
         _applyBtn.addEventListener(MouseEvent.CLICK,onApply);
      }
      
      public function destroy() : void
      {
         var item:DoodleListItem = null;
         hide();
         var len:int = _listCon.numChildren;
         for(var i:int = 0; i < len; i++)
         {
            item = _listCon.getChildAt(i) as DoodleListItem;
            item.removeEventListener(MouseEvent.CLICK,onItemClick);
            item.destroy();
            item = null;
         }
         _proBar.destroy();
         _proBar = null;
         _mainUI = null;
         _closeBtn = null;
         _applyBtn = null;
         _actionMc = null;
         _dataList = null;
         _listCon = null;
         _currItem = null;
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
   }
}


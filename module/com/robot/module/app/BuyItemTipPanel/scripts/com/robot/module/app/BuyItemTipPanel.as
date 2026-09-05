package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.DisplayObject;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.DragManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class BuyItemTipPanel extends Sprite implements IModule
   {
      
      private var _cancelBtn:SimpleButton;
      
      private var _panel:BuyTipPanelMc;
      
      private var _sureBtn:SimpleButton;
      
      private var _propTxt:TextField;
      
      private var _itemid:int = -1;
      
      private var _iconMc:Sprite;
      
      private var _preBtn:SimpleButton;
      
      private var _closeBtn:SimpleButton;
      
      private const PATH:String = "resource/item/doodle/icon/";
      
      private var _numTxt:TextField;
      
      private var _nextBtn:SimpleButton;
      
      private var _itemCount:uint = 1;
      
      public function BuyItemTipPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         _panel = null;
         _sureBtn = null;
         _cancelBtn = null;
         _propTxt = null;
         _preBtn = null;
         _nextBtn = null;
         _numTxt = null;
         _closeBtn = null;
         _iconMc = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panel);
         removeEvent();
      }
      
      public function setup() : void
      {
         _panel = new BuyTipPanelMc();
         _sureBtn = _panel["sureBtn"];
         _cancelBtn = _panel["cancelBtn"];
         _propTxt = _panel["propTxt"];
         _preBtn = _panel["preBtn"];
         _nextBtn = _panel["nextBtn"];
         _numTxt = _panel["numTxt"];
         _numTxt.restrict = "0-9";
         _numTxt.maxChars = 5;
         _closeBtn = _panel["closeBtn"];
      }
      
      private function onComHandler(icon:DisplayObject) : void
      {
         if(icon)
         {
            if(_iconMc)
            {
               DisplayUtil.removeForParent(_iconMc);
               _iconMc = null;
            }
            _iconMc = icon as Sprite;
            _panel.addChild(_iconMc);
            _iconMc.x = (_panel.width - _iconMc.width) / 2;
            _iconMc.y = 50;
         }
      }
      
      private function onNumChangeHandler(e:Event) : void
      {
         if(_numTxt.text == "")
         {
            Alarm.show("你输入的数字不正确!");
            setCount(1);
            setText();
         }
         else
         {
            setText();
         }
      }
      
      private function onSureClickHandler(e:MouseEvent) : void
      {
         var priceStr:uint = uint(ItemXMLInfo.getPrice(_itemid));
         if(uint(_numTxt.text) * priceStr > MainManager.actorInfo.coins)
         {
            Alarm.show("你所拥有的赛尔豆不足!");
            setCount(1);
            setText();
            return;
         }
         SocketConnection.send(CommandID.ITEM_BUY,_itemid,uint(_numTxt.text));
         hide();
      }
      
      public function init(data:Object = null) : void
      {
         if(_itemid != -1)
         {
            ResourceManager.cancelURL(PATH + _itemid.toString() + ".swf");
         }
         _itemid = data as uint;
      }
      
      private function onPreClickHandler(e:MouseEvent) : void
      {
         if(int(_numTxt.text) > 1)
         {
            setCount(uint(_numTxt.text) - 1);
            setText();
         }
      }
      
      private function setCount(count:uint) : void
      {
         _numTxt.text = count.toString();
      }
      
      private function onCloseClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function removeEvent() : void
      {
         _numTxt.removeEventListener(Event.CHANGE,onNumChangeHandler);
         _sureBtn.removeEventListener(MouseEvent.CLICK,onSureClickHandler);
         _cancelBtn.removeEventListener(MouseEvent.CLICK,onCancelClickHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseClickHandler);
         _preBtn.removeEventListener(MouseEvent.CLICK,onPreClickHandler);
         _nextBtn.removeEventListener(MouseEvent.CLICK,onNextClickHandler);
         DragManager.remove(_panel["dragMc"]);
      }
      
      private function onNextClickHandler(e:MouseEvent) : void
      {
         setCount(uint(_numTxt.text) + 1);
         setText();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
         var url:String = PATH + _itemid.toString() + ".swf";
         ResourceManager.getResource(PATH + _itemid.toString() + ".swf",onComHandler);
         setCount(1);
         setText();
      }
      
      private function addEvent() : void
      {
         _sureBtn.addEventListener(MouseEvent.CLICK,onSureClickHandler);
         _cancelBtn.addEventListener(MouseEvent.CLICK,onCancelClickHandler);
         _numTxt.addEventListener(Event.CHANGE,onNumChangeHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseClickHandler);
         _preBtn.addEventListener(MouseEvent.CLICK,onPreClickHandler);
         _nextBtn.addEventListener(MouseEvent.CLICK,onNextClickHandler);
         DragManager.add(_panel["dragMc"],_panel);
      }
      
      private function onCancelClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function setText() : void
      {
         var nameStr:String = ItemXMLInfo.getName(_itemid).toString();
         var priceStr:String = String(ItemXMLInfo.getPrice(_itemid) * uint(_numTxt.text));
         var coin:String = MainManager.actorInfo.coins.toString();
         _propTxt.text = "    " + _numTxt.text + "个" + nameStr + "需花费" + priceStr + "赛尔豆，你现在拥有" + coin + "赛尔豆，要确认购买吗？";
      }
   }
}


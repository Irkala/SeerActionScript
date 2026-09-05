package com.robot.module.app.mailBox.friendPanel
{
   import com.robot.core.info.UserInfo;
   import com.robot.core.manager.UIManager;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.text.TextField;
   import org.taomee.component.UIComponent;
   import org.taomee.component.control.MCheckBox;
   import org.taomee.component.event.ButtonEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.utils.DisplayUtil;
   
   public class FriendListItem extends UIComponent
   {
      
      public static const SELECT_CHANGE:String = "selectChange";
      
      private var checkBox:MCheckBox;
      
      private var nameTxt:TextField;
      
      private var _info:UserInfo;
      
      private var mainMC:MovieClip;
      
      private var _faceMc:MovieClip;
      
      private var _headMc:MovieClip;
      
      private var _nonoMc:MovieClip;
      
      private var idTxt:TextField;
      
      public function FriendListItem()
      {
         var o:DisplayObject = null;
         var d:DisplayObject = null;
         super();
         mainMC = new ui_mailBox_friend_item_mc();
         containSprite.addChild(mainMC);
         checkBox = new MCheckBox();
         checkBox.addEventListener(ButtonEvent.RELEASE,onRelease);
         checkBox.text = "";
         checkBox.width = checkBox.height + 2;
         checkBox.scaleX = checkBox.scaleY = 1.25;
         containSprite.addChild(checkBox);
         var mc:Sprite = UIManager.getSprite("IMListItem");
         mc.x = 73;
         _headMc = mc["headMc"];
         _faceMc = mc["faceMc"];
         _nonoMc = mc["nonoMc"];
         nameTxt = mainMC["name_txt"];
         idTxt = mainMC["id_txt"];
         var num:uint = uint(mc.numChildren);
         var array:Array = [];
         for(var i:uint = 0; i < num; i++)
         {
            d = mc.getChildAt(i);
            if(d != _headMc && d != _faceMc && d != _nonoMc)
            {
               array.push(d);
            }
         }
         for each(o in array)
         {
            DisplayUtil.removeForParent(o);
         }
         array = [];
         containSprite.addChild(mc);
         setSizeWH(containSprite.width,mainMC.height);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         checkBox.removeEventListener(ButtonEvent.RELEASE,onRelease);
         checkBox = null;
         _headMc = null;
         _faceMc = null;
         _nonoMc = null;
         nameTxt = null;
         idTxt = null;
         mainMC = null;
      }
      
      public function set isSelected(b:Boolean) : void
      {
         checkBox.selected = b;
      }
      
      private function onRelease(event:ButtonEvent) : void
      {
         dispatchEvent(new Event(SELECT_CHANGE));
      }
      
      public function set info(i:UserInfo) : void
      {
         this.filters = [];
         this.mouseChildren = true;
         this.mouseEnabled = true;
         mainMC["mc"].visible = true;
         _info = i;
         idTxt.text = _info.userID.toString();
         if(_info.serverID)
         {
            _headMc.visible = true;
            DisplayUtil.FillColor(_headMc,_info.color);
            nameTxt.textColor = 16777215;
            if(_info.vip)
            {
               _nonoMc.visible = true;
            }
         }
         else
         {
            _headMc.visible = false;
            _nonoMc.visible = false;
            nameTxt.textColor = 3355443;
         }
         _faceMc.visible = true;
         if(!_info.hasSimpleInfo)
         {
            nameTxt.text = _info.userID.toString();
            return;
         }
         nameTxt.text = _info.nick;
      }
      
      public function get isSelected() : Boolean
      {
         return checkBox.selected;
      }
      
      public function clear() : void
      {
         _info = null;
         this.filters = [ColorFilter.setGrayscale()];
         this.mouseChildren = false;
         this.mouseEnabled = false;
         mainMC["mc"].visible = false;
         _headMc.visible = false;
         _faceMc.visible = false;
         _nonoMc.visible = false;
         nameTxt.text = "";
         idTxt.text = "";
         checkBox.selected = false;
      }
      
      public function get info() : UserInfo
      {
         return _info;
      }
   }
}


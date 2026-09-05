package com.robot.module.app.mailBox
{
   import com.robot.core.event.RelationEvent;
   import com.robot.core.info.UserInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.RelationManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.module.app.mailBox.friendPanel.FriendListItem;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.component.containers.VBox;
   import org.taomee.ds.HashMap;
   import org.taomee.utils.DisplayUtil;
   
   public class SelectFriendPanel extends Sprite
   {
      
      public static const SELECT_COMPLETE:String = "selectComplete";
      
      private var hashMap:HashMap;
      
      private var _scrollBar:UIScrollBar;
      
      private var mainMC:MovieClip;
      
      private var moneyTxt:TextField;
      
      private var _listData:Array;
      
      private var okBtn:SimpleButton;
      
      private var LIST_LENGTH:uint = 7;
      
      private var itemContainer:VBox;
      
      private var backBtn:SimpleButton;
      
      private var _friendList:Array;
      
      public function SelectFriendPanel()
      {
         var item:FriendListItem = null;
         super();
         mainMC = new ui_mailBox_selectFriend();
         addChild(mainMC);
         backBtn = mainMC["backBtn"];
         okBtn = mainMC["okBtn"];
         backBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         okBtn.addEventListener(MouseEvent.CLICK,okHandler);
         moneyTxt = mainMC["money_txt"];
         itemContainer = new VBox(10);
         itemContainer.isMask = false;
         itemContainer.x = 280;
         itemContainer.y = 128;
         mainMC.addChild(itemContainer);
         _scrollBar = new UIScrollBar(mainMC["barBall"],mainMC["barBg"],LIST_LENGTH,mainMC["upBtn"],mainMC["downBtn"]);
         _scrollBar.wheelObject = this;
         _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = new FriendListItem();
            item.addEventListener(FriendListItem.SELECT_CHANGE,onSelectChange);
            item.clear();
            itemContainer.append(item);
         }
         hashMap = new HashMap();
      }
      
      public function hide() : void
      {
         var item:FriendListItem = null;
         RelationManager.removeEventListener(RelationEvent.FRIEND_UPDATE_ONLINE,onRelation);
         DisplayUtil.removeForParent(this);
         hashMap.clear();
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = itemContainer.getChildAt(i) as FriendListItem;
            item.clear();
         }
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var rel:UserInfo = null;
         var item:FriendListItem = null;
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            rel = _listData[i + _scrollBar.index] as UserInfo;
            item = itemContainer.getChildAt(i) as FriendListItem;
            item.clear();
            item.isSelected = hashMap.containsKey(rel.userID);
            item.info = rel;
         }
      }
      
      private function onRelation(event:RelationEvent) : void
      {
         var dis:FriendListItem = null;
         var rel:UserInfo = null;
         var item:FriendListItem = null;
         RelationManager.removeEventListener(RelationEvent.FRIEND_UPDATE_ONLINE,onRelation);
         var data:Array = RelationManager.getFriendInfos();
         for(var k:int = 0; k < LIST_LENGTH; k++)
         {
            dis = itemContainer.getChildAt(k) as FriendListItem;
            dis.clear();
         }
         var ldLen:int = int(data.length);
         _listData = data;
         _scrollBar.totalLength = ldLen;
         var len:int = Math.min(LIST_LENGTH,ldLen);
         for(var i:int = 0; i < len; i++)
         {
            rel = _listData[i + _scrollBar.index] as UserInfo;
            item = itemContainer.getChildAt(i) as FriendListItem;
            item.info = rel;
         }
      }
      
      private function onSelectChange(event:Event) : void
      {
         var item:FriendListItem = event.currentTarget as FriendListItem;
         if(item.isSelected)
         {
            if(hashMap.length >= 10)
            {
               Alarm.show("你最多只能同时给10个好友发送邮件！");
               item.isSelected = false;
               return;
            }
            hashMap.add(item.info.userID,item.info);
         }
         else
         {
            hashMap.remove(item.info.userID);
         }
         moneyTxt.text = (hashMap.length * 10).toString();
      }
      
      private function okHandler(event:MouseEvent) : void
      {
         if(hashMap.length == 0)
         {
            Alarm.show("你还没有选择发送的好友！");
            return;
         }
         _friendList = hashMap.getKeys().slice();
         dispatchEvent(new Event(SELECT_COMPLETE));
      }
      
      public function get friendList() : Array
      {
         return _friendList;
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         mainMC = null;
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this);
         RelationManager.addEventListener(RelationEvent.FRIEND_UPDATE_ONLINE,onRelation);
         RelationManager.setOnLineFriend();
      }
   }
}


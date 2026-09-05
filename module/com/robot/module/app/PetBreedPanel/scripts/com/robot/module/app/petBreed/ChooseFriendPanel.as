package com.robot.module.app.petBreed
{
   import com.robot.core.CommandID;
   import com.robot.core.event.RelationEvent;
   import com.robot.core.info.UserInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.RelationManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.uic.UIScrollBar;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class ChooseFriendPanel
   {
      
      private static const LIST_LENGTH:uint = 10;
      
      private var _ui:MovieClip;
      
      private var _scrollBar:UIScrollBar;
      
      private var _currentItem:FriendListItem;
      
      private var _listCon:Sprite;
      
      private var _listData:Array = [];
      
      private var _info:EggInfo;
      
      private var _fun:Function;
      
      private var _cancel:Function;
      
      public function ChooseFriendPanel()
      {
         var _loc1_:FriendListItem = null;
         super();
         this._ui = new chooseFriend_ui();
         this._ui["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._scrollBar = new UIScrollBar(this._ui["barBall"],this._ui["barBg"],LIST_LENGTH,this._ui["upBtn"],this._ui["downBtn"]);
         this._scrollBar.wheelObject = this._ui;
         this._scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,this.onScrollMove);
         this._listCon = new Sprite();
         this._listCon.x = 36;
         this._listCon.y = 70;
         this._ui.addChild(this._listCon);
         var _loc2_:int = 0;
         while(_loc2_ < LIST_LENGTH)
         {
            _loc1_ = new FriendListItem();
            _loc1_.y = (_loc1_.height + 4) * _loc2_;
            _loc1_.addEventListener(FriendListItem.CLICK,this.onFriend);
            this._listCon.addChild(_loc1_);
            _loc2_++;
         }
      }
      
      public function show(param1:EggInfo, param2:Function, param3:Function) : void
      {
         this._info = param1;
         this._fun = param2;
         this._cancel = param3;
         this._ui.mouseEnabled = false;
         this._ui.mouseChildren = false;
         LevelManager.appLevel.addChild(this._ui);
         DisplayUtil.align(this._ui,null,AlignType.MIDDLE_CENTER);
         RelationManager.addEventListener(RelationEvent.FRIEND_UPDATE_ONLINE,this.onRelation);
         RelationManager.setOnLineFriend();
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         this.hide();
         this._cancel();
      }
      
      private function onScrollMove(param1:MouseEvent) : void
      {
         var _loc2_:UserInfo = null;
         var _loc3_:FriendListItem = null;
         var _loc4_:int = 0;
         while(_loc4_ < LIST_LENGTH)
         {
            _loc2_ = this._listData[_loc4_ + this._scrollBar.index] as UserInfo;
            _loc3_ = this._listCon.getChildAt(_loc4_) as FriendListItem;
            _loc3_.clear();
            _loc3_.info = _loc2_;
            _loc4_++;
         }
      }
      
      private function onFriend(param1:Event) : void
      {
         var e:Event = param1;
         this._currentItem = e.currentTarget as FriendListItem;
         Alert.show("确定要把这只精灵蛋赠送给" + this._currentItem.info.nick + "吗？赠送给好友需要消耗一个精灵蛋防护罩，确定赠送吗？",function():void
         {
            var by:ByteArray = new ByteArray();
            by.writeUnsignedInt(_info.ownerID);
            by.writeUnsignedInt(_info.eggCatchTime);
            by.writeUnsignedInt(_currentItem.info.userID);
            SocketConnection.addCmdListener(CommandID.SEND_EGG_TOFRIEND,function():void
            {
               SocketConnection.removeCmdListener(CommandID.SEND_EGG_TOFRIEND,arguments.callee);
               Alarm.show("你的精灵蛋已经赠送给好友" + _currentItem.info.nick + "了！已经通过星际邮件通知了你的好友！",function():void
               {
                  hide();
                  _fun();
               });
            });
            SocketConnection.send(CommandID.SEND_EGG_TOFRIEND,by);
         });
      }
      
      private function onRelation(param1:RelationEvent) : void
      {
         var _loc2_:UserInfo = null;
         var _loc3_:FriendListItem = null;
         RelationManager.removeEventListener(RelationEvent.FRIEND_UPDATE_ONLINE,this.onRelation);
         this._listData = RelationManager.getFriendInfos();
         this._scrollBar.totalLength = this._listData.length;
         var _loc4_:int = Math.min(LIST_LENGTH,this._listData.length);
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this._listData[_loc5_ + this._scrollBar.index] as UserInfo;
            _loc3_ = this._listCon.getChildAt(_loc5_) as FriendListItem;
            _loc3_.clear();
            _loc3_.info = _loc2_;
            _loc5_++;
         }
         this._ui.mouseEnabled = true;
         this._ui.mouseChildren = true;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._ui);
      }
      
      public function destroy() : void
      {
         var _loc1_:int = 0;
         var _loc2_:FriendListItem = null;
         this.hide();
         if(Boolean(this._ui))
         {
            this._ui["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
            this._scrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,this.onScrollMove);
            this._scrollBar.destroy();
            _loc1_ = 0;
            while(_loc1_ < LIST_LENGTH)
            {
               _loc2_ = new FriendListItem();
               _loc2_.removeEventListener(FriendListItem.CLICK,this.onFriend);
               _loc2_.clear();
               _loc1_++;
            }
         }
         this._ui = null;
         this._scrollBar = null;
         this._currentItem = null;
         this._listCon = null;
         this._listData = null;
         this._info = null;
         this._fun = null;
         this._cancel = null;
      }
   }
}


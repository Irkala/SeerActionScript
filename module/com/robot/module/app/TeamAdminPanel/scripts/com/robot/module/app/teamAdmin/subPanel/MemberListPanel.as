package com.robot.module.app.teamAdmin.subPanel
{
   import com.robot.app.team.TeamController;
   import com.robot.core.CommandID;
   import com.robot.core.info.UserInfo;
   import com.robot.core.info.relation.OnLineInfo;
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.info.team.TeamMemberInfo;
   import com.robot.core.info.team.TeamMemberListInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.SOManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamLogo;
   import com.robot.core.uic.UIPanel;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.module.app.TeamAdminPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import org.taomee.ds.HashSet;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class MemberListPanel extends UIPanel
   {
      
      private static var _relSO:SharedObject;
      
      private static const SO_MEMBER:String = "member";
      
      private static const LIST_LENGTH:int = 9;
      
      private var _soTimePokeSet:HashSet;
      
      private var _listCon:Sprite;
      
      private var _scrollBar:UIScrollBar;
      
      private var upBtn:SimpleButton;
      
      private var admin:uint;
      
      private var delBtn:SimpleButton;
      
      private var index:uint = 0;
      
      private var userArray:Array = [];
      
      private var currentPriv:uint;
      
      private var downBtn:SimpleButton;
      
      private var logo:TeamLogo;
      
      private var selectItem:TeamMemberListItem;
      
      public function MemberListPanel()
      {
         var item:TeamMemberListItem = null;
         super(new ui_memberListPanel());
         upBtn = _mainUI["adminUpBtn"];
         downBtn = _mainUI["adminDownBtn"];
         delBtn = _mainUI["delBtn"];
         upBtn.addEventListener(MouseEvent.CLICK,upHandler);
         downBtn.addEventListener(MouseEvent.CLICK,downHandler);
         delBtn.addEventListener(MouseEvent.CLICK,delHandler);
         _scrollBar = new UIScrollBar(_mainUI["barBall"],_mainUI["barBg"],LIST_LENGTH,_mainUI["upBtn"],_mainUI["downBtn"]);
         _scrollBar.wheelObject = this;
         _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         _listCon = new Sprite();
         _listCon.x = 153;
         _listCon.y = 90;
         _mainUI.addChild(_listCon);
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = new TeamMemberListItem();
            item.y = (item.height + 4) * i;
            _listCon.addChild(item);
         }
      }
      
      public function show() : void
      {
         var dis:TeamMemberListItem = null;
         SocketConnection.addCmdListener(CommandID.TEAM_CHANGE_ADMIN,onChangeAdmin);
         SocketConnection.addCmdListener(CommandID.TEAM_DELET_MEMBER,onDel);
         initLogo();
         if(selectItem)
         {
            selectItem.filters = [];
         }
         selectItem = null;
         if(admin != TeamController.ADMIN)
         {
            upBtn.filters = [ColorFilter.setGrayscale()];
            downBtn.filters = [ColorFilter.setGrayscale()];
            delBtn.filters = [ColorFilter.setGrayscale()];
            upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = false;
         }
         else
         {
            upBtn.filters = [];
            downBtn.filters = [];
            delBtn.filters = [];
            upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = true;
         }
         checkSelectItem();
         index = 0;
         userArray = [];
         getMemberList();
         for(var k:int = 0; k < LIST_LENGTH; k++)
         {
            dis = _listCon.getChildAt(k) as TeamMemberListItem;
            dis.mouseChildren = false;
            dis.mouseEnabled = false;
            dis.clear();
         }
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         super._show();
      }
      
      private function onTimePoke(e:SocketEvent) : void
      {
         var i:int;
         var data:ByteArray;
         var count:uint;
         var id:uint = 0;
         var tp:uint = 0;
         SocketConnection.removeCmdListener(CommandID.GET_TIMEPOKE,onTimePoke);
         data = e.data as ByteArray;
         count = data.readUnsignedInt();
         for(i = 0; i < count; i++)
         {
            id = data.readUnsignedInt();
            tp = data.readUnsignedInt();
            userArray.some(function(item:UserInfo, index:int, array:Array):Boolean
            {
               if(item.userID == id)
               {
                  item.timePoke = tp;
                  return true;
               }
               return false;
            });
         }
         soInit();
      }
      
      private function soInit() : void
      {
         var arr:Array = null;
         var info:UserInfo = null;
         var has:Boolean = false;
         var o:Object = null;
         _relSO = SOManager.getUserSO(SOManager.TEAM_MB);
         if(_relSO.data.hasOwnProperty(SO_MEMBER))
         {
            _soTimePokeSet = new HashSet();
            arr = _relSO.data[SO_MEMBER];
            for each(info in userArray)
            {
               has = false;
               for each(o in arr)
               {
                  if(info.userID == o.userID)
                  {
                     has = true;
                     if(info.timePoke > o.timePoke)
                     {
                        _soTimePokeSet.add(info);
                     }
                     info.hasSimpleInfo = true;
                     info.nick = o.nick;
                     info.color = o.color;
                     info.texture = o.texture;
                     info.vip = o.vip;
                     info.status = o.status;
                     info.mapID = o.mapID;
                     info.isCanBeTeacher = o.isCanBeTeacher;
                     info.teacherID = o.teacherID;
                     info.studentID = o.studentID;
                     info.graduationCount = o.graduationCount;
                     info.clothes = o.clothes.slice();
                     break;
                  }
               }
               if(!has)
               {
                  _soTimePokeSet.add(info);
               }
            }
         }
         setSOInfo();
      }
      
      private function getOnline() : void
      {
         var i:int;
         var byd:ByteArray;
         SocketConnection.addCmdListener(CommandID.SEE_ONLINE,function(event:SocketEvent):void
         {
            var t_m:TeamMemberInfo = null;
            var online:OnLineInfo = null;
            var j:UserInfo = null;
            var t_index:uint = 0;
            SocketConnection.removeCmdListener(CommandID.SEE_ONLINE,arguments.callee);
            var data:ByteArray = event.data as ByteArray;
            var len:uint = data.readUnsignedInt();
            for(var i:int = 0; i < len; i++)
            {
               online = new OnLineInfo(data);
               for each(j in userArray)
               {
                  if(j.userID == online.userID)
                  {
                     j.serverID = online.serverID;
                  }
               }
            }
            userArray.sortOn("serverID",Array.NUMERIC | Array.DESCENDING);
            for each(t_m in userArray)
            {
               if(t_m.priv == 0)
               {
                  t_index = uint(userArray.indexOf(t_m));
                  userArray.splice(t_index,1);
                  userArray.unshift(t_m);
                  break;
               }
            }
            showMember();
         });
         byd = new ByteArray();
         for(i = 0; i < userArray.length; i++)
         {
            byd.writeUnsignedInt(UserInfo(userArray[i]).userID);
         }
         SocketConnection.send(CommandID.SEE_ONLINE,userArray.length,byd);
      }
      
      public function setSOInfo() : void
      {
         var _fInfos:Array = null;
         var _fKeyLen:int = 0;
         var loopInfo:Function = function(i:int):void
         {
            if(i == _fKeyLen)
            {
               getOnline();
               _fInfos = null;
               _fKeyLen = NaN;
               if(_relSO)
               {
                  _relSO.data[SO_MEMBER] = userArray.concat();
                  SOManager.flush(_relSO);
               }
               return;
            }
            UserInfoManager.upDateSimpleInfo(_fInfos[i],function():void
            {
               ++i;
               loopInfo(i);
            });
         };
         if(_soTimePokeSet == null)
         {
            _fInfos = userArray.concat();
         }
         else
         {
            _fInfos = _soTimePokeSet.toArray();
         }
         _fKeyLen = int(_fInfos.length);
         if(_fKeyLen == 0)
         {
            getOnline();
            return;
         }
         loopInfo(0);
      }
      
      private function getMemberList() : void
      {
         SocketConnection.addCmdListener(CommandID.TEAM_GET_MEMBER_LIST,onGetMemberList);
         SocketConnection.send(CommandID.TEAM_GET_MEMBER_LIST,TeamAdminPanel.teamID);
         _mainUI["loadingMC"].visible = true;
         _mainUI.addChild(_mainUI["loadingMC"]);
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var item:TeamMemberListItem = null;
         selectItem = null;
         checkSelectItem();
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = _listCon.getChildAt(i) as TeamMemberListItem;
            item.clear();
            item.setMemberInfo(userArray[i + _scrollBar.index]);
         }
      }
      
      private function downHandler(event:MouseEvent) : void
      {
         currentPriv = selectItem.memberInfo.priv;
         ++currentPriv;
         TeamController.changePriv(selectItem.info.userID,currentPriv);
      }
      
      private function checkSelectItem() : void
      {
         if(admin != TeamController.ADMIN)
         {
            upBtn.filters = [ColorFilter.setGrayscale()];
            downBtn.filters = [ColorFilter.setGrayscale()];
            delBtn.filters = [ColorFilter.setGrayscale()];
            upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = false;
            return;
         }
         if(!selectItem)
         {
            upBtn.filters = [ColorFilter.setGrayscale()];
            downBtn.filters = [ColorFilter.setGrayscale()];
            delBtn.filters = [ColorFilter.setGrayscale()];
            upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = false;
            return;
         }
         if(selectItem.info.userID == MainManager.actorID)
         {
            upBtn.filters = [ColorFilter.setGrayscale()];
            downBtn.filters = [ColorFilter.setGrayscale()];
            delBtn.filters = [ColorFilter.setGrayscale()];
            upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = false;
            return;
         }
         if(selectItem.memberInfo.priv == 5)
         {
            upBtn.filters = [];
            delBtn.filters = [];
            upBtn.mouseEnabled = delBtn.mouseEnabled = true;
            downBtn.filters = [ColorFilter.setGrayscale()];
            downBtn.mouseEnabled = false;
            return;
         }
         upBtn.filters = [];
         downBtn.filters = [];
         delBtn.filters = [];
         upBtn.mouseEnabled = downBtn.mouseEnabled = delBtn.mouseEnabled = true;
      }
      
      private function onChangeAdmin(event:SocketEvent) : void
      {
         selectItem.changePriv(currentPriv);
         selectItem.filters = [];
         selectItem = null;
         checkSelectItem();
      }
      
      private function initLogo() : void
      {
         DisplayUtil.removeForParent(logo);
         var teamInfo:SimpleTeamInfo = TeamAdminPanel.teamInfo;
         logo = new TeamLogo();
         logo.info = teamInfo;
         logo.scaleX = logo.scaleY = 1.5;
         var icon:MovieClip = _mainUI["iconMC"];
         DisplayUtil.align(logo,icon.getRect(icon),AlignType.MIDDLE_CENTER);
         icon.addChild(logo);
      }
      
      private function onDel(event:SocketEvent) : void
      {
         var i:UserInfo = null;
         var index:int = -1;
         var count:uint = 0;
         for each(i in userArray)
         {
            if(i.userID == selectItem.info.userID)
            {
               index = int(count);
               break;
            }
            count++;
         }
         if(index != -1)
         {
            userArray.splice(index,1);
            showMember();
         }
         selectItem.clear();
         selectItem.mouseChildren = false;
         selectItem.mouseEnabled = false;
         selectItem.removeEventListener(Event.SELECT,onSelectItem);
         selectItem.filters = [];
         selectItem = null;
         checkSelectItem();
      }
      
      private function onSelectItem(event:Event) : void
      {
         selectItem = event.currentTarget as TeamMemberListItem;
         checkSelectItem();
      }
      
      private function upHandler(event:MouseEvent) : void
      {
         currentPriv = selectItem.memberInfo.priv;
         --currentPriv;
         TeamController.changePriv(selectItem.info.userID,currentPriv);
      }
      
      private function showMember() : void
      {
         var item:TeamMemberListItem = null;
         _mainUI["loadingMC"].visible = false;
         for(var i:uint = 0; i < LIST_LENGTH; i++)
         {
            if(i < userArray.length)
            {
               item = _listCon.getChildAt(i) as TeamMemberListItem;
               item.addEventListener(Event.SELECT,onSelectItem);
               item.setMemberInfo(userArray[i]);
               item.mouseChildren = true;
               item.mouseEnabled = true;
            }
         }
      }
      
      override public function destroy() : void
      {
         super.destroy();
         SocketConnection.removeCmdListener(CommandID.TEAM_CHANGE_ADMIN,onChangeAdmin);
         SocketConnection.removeCmdListener(CommandID.TEAM_DELET_MEMBER,onDel);
         _listCon = null;
         _scrollBar.removeEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         _scrollBar.destroy();
         _scrollBar = null;
         upBtn.removeEventListener(MouseEvent.CLICK,upHandler);
         downBtn.removeEventListener(MouseEvent.CLICK,downHandler);
         delBtn.removeEventListener(MouseEvent.CLICK,delHandler);
         upBtn = null;
         downBtn = null;
         delBtn = null;
      }
      
      private function getTimePoke() : void
      {
         var data:ByteArray = null;
         data = new ByteArray();
         userArray.forEach(function(item:UserInfo, index:int, array:Array):void
         {
            data.writeUnsignedInt(item.userID);
         });
         SocketConnection.addCmdListener(CommandID.GET_TIMEPOKE,onTimePoke);
         SocketConnection.send(CommandID.GET_TIMEPOKE,userArray.length,data);
      }
      
      public function setup(admin:uint) : void
      {
         this.admin = admin;
      }
      
      private function onGetMemberList(event:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.TEAM_GET_MEMBER_LIST,onGetMemberList);
         var data:TeamMemberListInfo = event.data as TeamMemberListInfo;
         userArray = data.memberList.slice();
         var teamInfo:SimpleTeamInfo = TeamAdminPanel.teamInfo;
         if(teamInfo.superCoreNum >= 10)
         {
            _mainUI["num_txt"].text = userArray.length + "/" + 70;
         }
         else
         {
            _mainUI["num_txt"].text = userArray.length + "/" + 50;
         }
         _scrollBar.totalLength = userArray.length;
         showMember();
         getTimePoke();
      }
      
      private function delHandler(event:MouseEvent) : void
      {
         TeamController.del(selectItem.info.userID);
      }
   }
}


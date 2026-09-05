package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.info.UserInfo;
   import com.robot.core.info.relation.OnLineInfo;
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.info.team.TeamMemberInfo;
   import com.robot.core.info.team.TeamMemberListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.SOManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamInfoManager;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.module.app.teamAdmin.subPanel.TeamMemberListItem;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.net.SharedObject;
   import flash.utils.ByteArray;
   import org.taomee.ds.HashSet;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TeamMemberPanel extends Sprite implements IModule
   {
      
      private static var _relSO:SharedObject;
      
      private static const SO_MEMBER:String = "member";
      
      private static const LIST_LENGTH:int = 10;
      
      private var _soTimePokeSet:HashSet;
      
      private var _scrollBar:UIScrollBar;
      
      private var _teamInfo:SimpleTeamInfo;
      
      private var _valMc:MovieClip;
      
      private var _levMc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var teamID:uint;
      
      private var _listCon:Sprite;
      
      private var _dragBtn:SimpleButton;
      
      private var userArray:Array = [];
      
      private var index:uint = 0;
      
      private var _userVaArray:Array = [];
      
      public function TeamMemberPanel()
      {
         super();
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
      
      public function destroy() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _closeBtn = null;
         _dragBtn = null;
      }
      
      private function onScrollMove(e:MouseEvent) : void
      {
         var item:TeamMemberListItem = null;
         var type:uint = 0;
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = _listCon.getChildAt(i) as TeamMemberListItem;
            item.clear();
            type = 0;
            if(_levMc.currentFrame == 2)
            {
               type = 1;
            }
            if(type == 0)
            {
               item.setMemberInfo(userArray[i + _scrollBar.index],true,type);
            }
            else
            {
               item.setMemberInfo(_userVaArray[i + _scrollBar.index],true,type);
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
         teamID = uint(data);
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
      
      public function show() : void
      {
         var k:int;
         var dis:TeamMemberListItem = null;
         index = 0;
         userArray = [];
         for(k = 0; k < LIST_LENGTH; k++)
         {
            dis = _listCon.getChildAt(k) as TeamMemberListItem;
            dis.mouseChildren = false;
            dis.mouseEnabled = false;
            dis.clear();
         }
         TeamInfoManager.getSimpleTeamInfo(teamID,function(info:SimpleTeamInfo):void
         {
            _teamInfo = info;
            getMemberList();
         });
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(_mainUI);
      }
      
      public function setup() : void
      {
         var item:TeamMemberListItem = null;
         _mainUI = new ui_SignleTeamMemberPanel();
         _dragBtn = _mainUI["dragBtn"];
         _closeBtn = _mainUI["closeBtn"];
         _levMc = _mainUI["mc1"];
         _levMc.gotoAndStop(1);
         _levMc.addEventListener(MouseEvent.CLICK,onLevMcClickHandler);
         ToolTipManager.add(_levMc,"职位");
         _valMc = _mainUI["mc2"];
         _valMc.gotoAndStop(2);
         ToolTipManager.add(_valMc,"贡献度");
         _valMc.addEventListener(MouseEvent.CLICK,onValMcClickHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _scrollBar = new UIScrollBar(_mainUI["barBall"],_mainUI["barBg"],LIST_LENGTH,_mainUI["upBtn"],_mainUI["downBtn"]);
         _scrollBar.wheelObject = this;
         _scrollBar.addEventListener(MouseEvent.MOUSE_MOVE,onScrollMove);
         _listCon = new Sprite();
         _listCon.x = 36;
         _listCon.y = 85;
         _mainUI.addChild(_listCon);
         for(var i:int = 0; i < LIST_LENGTH; i++)
         {
            item = new TeamMemberListItem();
            item.y = (item.height + 4) * i;
            _listCon.addChild(item);
         }
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      private function onGetMemberList(event:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.TEAM_GET_MEMBER_LIST,onGetMemberList);
         var data:TeamMemberListInfo = event.data as TeamMemberListInfo;
         userArray = data.memberList.slice();
         if(_teamInfo.superCoreNum >= 10)
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
      
      private function onLevMcClickHandler(e:MouseEvent) : void
      {
         if(_levMc.currentFrame == 2)
         {
            _levMc.gotoAndStop(1);
            _valMc.gotoAndStop(2);
            setVis(false);
            onScrollMove(null);
         }
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
      
      private function onValMcClickHandler(e:MouseEvent) : void
      {
         if(_valMc.currentFrame == 2)
         {
            _levMc.gotoAndStop(2);
            _valMc.gotoAndStop(1);
            _userVaArray = new Array();
            _userVaArray = userArray.slice();
            _userVaArray = _userVaArray.sortOn("contribute",Array.NUMERIC);
            _userVaArray = _userVaArray.reverse();
            setVis(true);
            onScrollMove(null);
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
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
      
      private function getMemberList() : void
      {
         SocketConnection.addCmdListener(CommandID.TEAM_GET_MEMBER_LIST,onGetMemberList);
         SocketConnection.send(CommandID.TEAM_GET_MEMBER_LIST,teamID);
         _mainUI["loadingMC"].visible = true;
         _mainUI.addChild(_mainUI["loadingMC"]);
      }
      
      protected function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function setVis(b1:Boolean) : void
      {
         var item:TeamMemberListItem = null;
         for(var i:uint = 0; i < LIST_LENGTH; i++)
         {
            item = _listCon.getChildAt(i) as TeamMemberListItem;
            item.setVisible(b1);
         }
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         _mainUI.startDrag();
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
               item.setMemberInfo(userArray[i],true);
               item.mouseChildren = true;
               item.mouseEnabled = true;
            }
         }
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
   }
}


package com.robot.module.app
{
   import com.robot.app.bag.BagClothPreview;
   import com.robot.app.team.TeamController;
   import com.robot.app.user.UserInfoController;
   import com.robot.core.info.UserInfo;
   import com.robot.core.info.team.TeamInformInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MessageManager;
   import com.robot.core.manager.RelationManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.skeleton.ClothPreview;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.events.TextEvent;
   import flash.text.TextField;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class AddFriendMsgPanel extends Sprite implements IModule
   {
      
      private var _msgFridList:Array = [];
      
      private var _isAddTeam:Boolean = false;
      
      private var _closeBtn:SimpleButton;
      
      private var _refuseBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var _nextBtn:SimpleButton;
      
      private var _acceptBtn:SimpleButton;
      
      private var _userInfoList:Array = [];
      
      private var _txt:TextField;
      
      private var _faceShow:Sprite;
      
      private var _dragMC:MovieClip;
      
      private var _prevBtn:SimpleButton;
      
      private var _clothPrev:BagClothPreview;
      
      private var _currentNum:uint = 0;
      
      private var _seerMC:MovieClip;
      
      public function AddFriendMsgPanel()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
         _isAddTeam = data as Boolean;
      }
      
      private function updateData() : void
      {
         var info:UserInfo = _msgFridList[_currentNum] as UserInfo;
         MessageManager.removeAddFridInfo(info.userID);
         MessageManager.removeInviteJoinTeamInfo(info.userID);
         _msgFridList.splice(_currentNum,1);
         _currentNum = 0;
         removeEvent();
         getData();
      }
      
      public function setup() : void
      {
         _mainUI = new UI_AddFriendMsgPanel();
         _seerMC = _mainUI["mc"];
         _txt = _mainUI["txt"];
         _closeBtn = _mainUI["closeBtn"];
         _prevBtn = _mainUI["prevBtn"];
         _prevBtn.mouseEnabled = false;
         _nextBtn = _mainUI["nextBtn"];
         _nextBtn.mouseEnabled = false;
         _acceptBtn = _mainUI["acceptBtn"];
         _refuseBtn = _mainUI["refuseBtn"];
         _dragMC = _mainUI["dragMC"];
         DragManager.add(_dragMC,_mainUI);
      }
      
      private function getData() : void
      {
         var arr:Array = null;
         var count:uint = 0;
         var loop:Function = function(cnt:uint):void
         {
            UserInfoManager.getInfo(arr[cnt].userID,function(i:UserInfo):void
            {
               _msgFridList.push(i);
               ++count;
               if(count == arr.length)
               {
                  addItem();
                  addEvent();
                  return;
               }
               loop(count);
            });
         };
         arr = [];
         if(_isAddTeam)
         {
            arr = MessageManager.inviteJoinTeamMap.getValues();
         }
         else
         {
            arr = MessageManager.friendAddInfoMap.getValues();
         }
         count = 0;
         if(arr.length == 0)
         {
            hide();
            return;
         }
         if(arr.length > 1)
         {
            _nextBtn.mouseEnabled = true;
         }
         else
         {
            _prevBtn.mouseEnabled = false;
            _nextBtn.mouseEnabled = false;
         }
         loop(count);
      }
      
      private function onPrev(evt:MouseEvent) : void
      {
         _nextBtn.mouseEnabled = true;
         --_currentNum;
         if(_currentNum == 0)
         {
            _prevBtn.mouseEnabled = false;
         }
         addItem();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         removeEvent();
      }
      
      private function onAccept(evt:MouseEvent) : void
      {
         var tinfo:TeamInformInfo = null;
         var info:UserInfo = _msgFridList[_currentNum] as UserInfo;
         if(_isAddTeam)
         {
            tinfo = MessageManager.getInviteJoinTeamInfo(info.userID);
            if(tinfo)
            {
               TeamController.join(tinfo.data2);
               MessageManager.removeInviteJoinTeamInfo(info.userID);
               hide();
            }
         }
         else
         {
            RelationManager.answerFriend(info.userID,true);
            RelationManager.addFriendInfo(info);
            RelationManager.upDateInfo(info.userID);
            Alarm.show("恭喜你与" + info.nick + "\n成为好友！",updateData);
         }
      }
      
      private function onRefuse(evt:MouseEvent) : void
      {
         var info:UserInfo = _msgFridList[_currentNum] as UserInfo;
         RelationManager.answerFriend(info.userID,false);
         updateData();
      }
      
      private function addItem() : void
      {
         if(_faceShow)
         {
            DisplayUtil.removeAllChild(_faceShow);
            _seerMC.removeChildAt(1);
         }
         _faceShow = getFaceBg();
         _faceShow.x = 35;
         _faceShow.y = 20;
         _seerMC.addChildAt(_faceShow,1);
         if(_clothPrev)
         {
            _clothPrev.destroy();
            _clothPrev = null;
         }
         _clothPrev = new BagClothPreview(_faceShow,null,ClothPreview.MODEL_SHOW);
         changeInfo(_msgFridList[_currentNum]);
      }
      
      private function onClose(evt:MouseEvent) : void
      {
         var i:UserInfo = null;
         hide();
         for each(i in _msgFridList)
         {
            MessageManager.removeAddFridInfo(i.userID);
            MessageManager.removeInviteJoinTeamInfo(i.userID);
         }
         _msgFridList = [];
      }
      
      private function onNext(evt:MouseEvent) : void
      {
         _prevBtn.mouseEnabled = true;
         ++_currentNum;
         if(_currentNum == _msgFridList.length - 1)
         {
            _nextBtn.mouseEnabled = false;
         }
         addItem();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _prevBtn.removeEventListener(MouseEvent.CLICK,onPrev);
         _nextBtn.removeEventListener(MouseEvent.CLICK,onNext);
         _acceptBtn.removeEventListener(MouseEvent.CLICK,onAccept);
         _refuseBtn.removeEventListener(MouseEvent.CLICK,onRefuse);
      }
      
      private function getFaceBg() : Sprite
      {
         var face_mc:Sprite = UIManager.getSprite("ComposeMC");
         face_mc.mouseEnabled = false;
         face_mc.mouseChildren = false;
         face_mc.scaleX = face_mc.scaleY = 0.45;
         return face_mc;
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _prevBtn.addEventListener(MouseEvent.CLICK,onPrev);
         _nextBtn.addEventListener(MouseEvent.CLICK,onNext);
         _acceptBtn.addEventListener(MouseEvent.CLICK,onAccept);
         _refuseBtn.addEventListener(MouseEvent.CLICK,onRefuse);
      }
      
      public function destroy() : void
      {
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         if(_isAddTeam)
         {
            _mainUI["typeMC"].gotoAndStop(2);
         }
         else
         {
            _mainUI["typeMC"].gotoAndStop(1);
         }
         getData();
      }
      
      private function changeInfo(userInfo:UserInfo) : void
      {
         UserInfoManager.upDateMoreInfo(userInfo,function():void
         {
            _clothPrev.changeColor(userInfo.color);
            _clothPrev.showCloths(userInfo.clothes);
            _clothPrev.showDoodle(userInfo.texture);
            if(_isAddTeam)
            {
               _txt.htmlText = TextFormatUtil.getEventTxt(userInfo.nick,userInfo.userID.toString()) + "邀请你加入战队";
            }
            else
            {
               _txt.htmlText = TextFormatUtil.getEventTxt(userInfo.nick,userInfo.userID.toString()) + "想要添加你为好友";
            }
            _txt.addEventListener(TextEvent.LINK,function(evt:TextEvent):void
            {
               UserInfoController.show(uint(evt.text));
               LevelManager.topLevel.addChild(UserInfoController.panel);
            });
         });
      }
   }
}


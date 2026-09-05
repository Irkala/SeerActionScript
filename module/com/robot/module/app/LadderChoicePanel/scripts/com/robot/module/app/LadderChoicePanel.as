package com.robot.module.app
{
   import com.robot.app.mapProcess.MapProcess_10035;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LadderChoicePanel extends Sprite implements IModule
   {
      
      private const MAXLEVEL:uint = 80;
      
      private var _panel:LadderFightPanel;
      
      private var _closeBtn:SimpleButton;
      
      private var _startBtn:SimpleButton;
      
      private var _goOnBtn:SimpleButton;
      
      private var _viewBtn:SimpleButton;
      
      private var _maxLevel:uint;
      
      private var _currentLevel:uint;
      
      private var _petArr:Array;
      
      private var _userRecordPetId:uint;
      
      private var _userRecordLevel:uint;
      
      private var _bestRecordLevel:uint;
      
      private var _selectPetId:uint;
      
      private var _catchTime:uint;
      
      private var _challengeLevel:uint;
      
      public function LadderChoicePanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._panel = new LadderFightPanel();
         this._closeBtn = this._panel["closeBtn"];
         this._startBtn = this._panel["startFightBtn"];
         this._goOnBtn = this._panel["goOnBtn"];
         this._viewBtn = this._panel["viewRecord"];
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         SocketConnection.send(1022,86057539);
         for(var i:uint = 0; i < 6; i++)
         {
            this._panel["sideBar"]["item" + i].visible = false;
         }
         SocketConnection.addCmdListener(CommandID.FIGHTLADDER_GET_USER_RECORD,this.onRecordGet);
         SocketConnection.send(CommandID.FIGHTLADDER_GET_USER_RECORD);
         SocketConnection.addCmdListener(CommandID.FIGHTLADDER_GET_KEEPRECORD_BONUS,this.onBonusGet);
         SocketConnection.send(CommandID.FIGHTLADDER_GET_KEEPRECORD_BONUS);
      }
      
      private function onBonusGet(e:SocketEvent) : void
      {
         var bonusPetId:uint = 0;
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_KEEPRECORD_BONUS,this.onBonusGet);
         var dataArr:ByteArray = e.data as ByteArray;
         dataArr.position = 0;
         var len:uint = dataArr.readUnsignedInt();
         for(var j:uint = 0; j < len; j++)
         {
            bonusPetId = dataArr.readUnsignedInt();
            this.showPetAlarm(bonusPetId,j + 1,len);
         }
      }
      
      private function showPetAlarm(bonusPetId:uint, index:uint, len:uint) : void
      {
         Alarm.show(TextFormatUtil.getRedTxt(PetXMLInfo.getName(bonusPetId)) + "已经放入你的仓库中！");
         if(index == len)
         {
            PetManager.refreshStorageList();
         }
      }
      
      private function onRecordGet(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_USER_RECORD,this.onRecordGet);
         var dataArr:ByteArray = e.data as ByteArray;
         this._userRecordPetId = dataArr.readUnsignedInt();
         this._userRecordLevel = dataArr.readUnsignedInt();
         KTool.showScore(this._panel["myLevel"]["lvMC"],this._userRecordLevel);
         UserInfoManager.upDateMoreInfo(MainManager.actorInfo,this.upDatahandler);
      }
      
      private function updatePanelStatus() : void
      {
         var info:PetInfo = null;
         for(var i:uint = 0; i < this._petArr.length; i++)
         {
            info = this._petArr[i] as PetInfo;
            this.fillSideBar(info,i);
            if(i == 0)
            {
               this._selectPetId = info.id;
               this._catchTime = info.catchTime;
               this._panel["sideBar"]["item" + i].gotoAndStop(2);
            }
            if(info.id == this._userRecordPetId)
            {
               this._panel["sideBar"]["item" + i].gotoAndStop(2);
               this._selectPetId = this._userRecordPetId;
               this._catchTime = info.catchTime;
               if(i != 0)
               {
                  this._panel["sideBar"]["item0"].gotoAndStop(1);
               }
            }
            else if(i != 0)
            {
               this._panel["sideBar"]["item" + i].gotoAndStop(1);
            }
         }
         this.setMeetStatus();
         this.getPetChallengeRecordInfo();
      }
      
      private function fillSideBar(info:PetInfo, index:uint) : void
      {
         this._panel["sideBar"]["item" + index].visible = true;
         this._panel["sideBar"]["item" + index]["petName"].text = PetXMLInfo.getName(info.id);
         this._panel["sideBar"]["item" + index]["petLevel"].text = "Lv " + info.level.toString();
         this._panel["sideBar"]["item" + index]["petBlood"].text = info.hp.toString() + "/" + info.maxHp.toString();
         ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id,info.catchTime),function(dis:DisplayObject):void
         {
            var mc:MovieClip = dis as MovieClip;
            KTool.scaleByRect(mc,55,55,1.3);
            DisplayUtil.removeAllChild(_panel["sideBar"]["item" + index]["pet"]);
            DisplayUtil.stopAllMovieClip(mc);
            _panel["sideBar"]["item" + index]["pet"].addChild(mc);
         },"pet");
      }
      
      private function setMeetStatus() : void
      {
         if(this._selectPetId == this._userRecordPetId)
         {
            this._panel["myLevel"].visible = true;
            this._startBtn.visible = false;
            if(this._userRecordLevel >= this.MAXLEVEL)
            {
               this._goOnBtn.visible = false;
            }
            else
            {
               this._goOnBtn.visible = true;
            }
            KTool.showScore(this._panel["myLevel"]["lvMC"],this._userRecordLevel);
         }
         else
         {
            this._panel["myLevel"].visible = false;
            this._startBtn.visible = true;
            this._goOnBtn.visible = false;
            KTool.showScore(this._panel["myLevel"]["lvMC"],0);
         }
         this.getPetChallengeRecordInfo();
      }
      
      private function upDatahandler() : void
      {
         LevelManager.topLevel.addChild(this._panel);
         KTool.setAlignMid(this._panel,694,405);
         LevelManager.closeMouseEvent();
         LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
         this._currentLevel = MainManager.actorInfo.maxLadderState;
         this._petArr = PetManager.infos;
         this._petArr.sortOn("isDefault",Array.DESCENDING);
         this.updatePanelStatus();
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onCloseClick);
         this._startBtn.addEventListener(MouseEvent.CLICK,this.onStartBtnClick);
         this._goOnBtn.addEventListener(MouseEvent.CLICK,this.onGoOnBtnClick);
         this._viewBtn.addEventListener(MouseEvent.CLICK,this.onViewClick);
         for(var i:uint = 0; i <= 5; i++)
         {
            this._panel["sideBar"]["item" + i].buttonMode = true;
            this._panel["sideBar"]["item" + i].addEventListener(MouseEvent.CLICK,this.onItemClick);
         }
      }
      
      private function getPetChallengeRecordInfo() : void
      {
         SocketConnection.addCmdListener(CommandID.FIGHTLADDER_GET_PET_BESTRECORD,this.onBestRecordGet);
         SocketConnection.send(CommandID.FIGHTLADDER_GET_PET_BESTRECORD,this._selectPetId);
      }
      
      private function onBestRecordGet(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_PET_BESTRECORD,this.onBestRecordGet);
         var dataArr:ByteArray = e.data as ByteArray;
         var recordExist:uint = dataArr.readUnsignedInt();
         dataArr.readUTFBytes(16);
         this._bestRecordLevel = dataArr.readUnsignedInt();
         dataArr.readUnsignedInt();
         if(recordExist == 1)
         {
            this._panel["txtBestLevel"].htmlText = "当前使用<font color=\'0x33FFFF\'>" + PetXMLInfo.getName(this._selectPetId) + "</font>的最高记录为：";
            KTool.showScore(this._panel["recordMC"],this._bestRecordLevel);
         }
         else
         {
            this._panel["txtBestLevel"].htmlText = "当前无人使用该精灵挑战！快挑战吧！";
            KTool.showScore(this._panel["recordMC"],0);
         }
      }
      
      private function PetLevelCertificate() : Boolean
      {
         var i:uint = 0;
         var arrLen:uint = this._petArr.length;
         if(arrLen == 0)
         {
            Alarm.show("你的背包中还没有精灵，不能挑战战斗阶梯！");
            return false;
         }
         for(i = 0; i < arrLen; i++)
         {
            if((this._petArr[i] as PetInfo).level >= this._maxLevel)
            {
               this._maxLevel = (this._petArr[i] as PetInfo).level;
            }
         }
         if(this._maxLevel <= 50)
         {
            Alarm.show("你背包中没有51级以上的精灵，不能挑战战斗阶梯！");
            return false;
         }
         return true;
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         var selectIndex:uint = uint((e.currentTarget as MovieClip).name.charAt(4));
         for(var i:uint = 0; i <= 5; i++)
         {
            this._panel["sideBar"]["item" + i].gotoAndStop(1);
         }
         this._panel["sideBar"]["item" + selectIndex].gotoAndStop(2);
         this._selectPetId = (this._petArr[selectIndex] as PetInfo).id;
         this._catchTime = (this._petArr[selectIndex] as PetInfo).catchTime;
         this.setMeetStatus();
      }
      
      private function onCloseClick(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onStartFight(e:SocketEvent) : void
      {
         this.hide();
         var by:ByteArray = e.data as ByteArray;
         if(by.bytesAvailable == 0)
         {
            return;
         }
         var isBlack:uint = by.readUnsignedInt();
         var monID:uint = by.readUnsignedInt();
         MapProcess_10035.isBlack = isBlack;
         MapProcess_10035.monID = monID;
         MapProcess_10035.level = this._challengeLevel;
         MapProcess_10035.isFirstEnter = true;
         MapProcess_10035.petID = this._selectPetId;
         MapManager.changeLocalMap(10035);
      }
      
      private function onStartBtnClick(e:MouseEvent) : void
      {
         if(this.PetLevelCertificate())
         {
            if(this._userRecordLevel > 1 && this._userRecordPetId != 0)
            {
               Alert.show("你当前使用" + TextFormatUtil.getRedTxt(PetXMLInfo.getName(this._userRecordPetId)) + "挑战到" + TextFormatUtil.getRedTxt(this._userRecordLevel.toString()) + "层。你确定要放弃，并重新开始挑战吗？",function():void
               {
                  _challengeLevel = 0;
                  PetManager.setDefault(_catchTime);
                  SocketConnection.addCmdListener(CommandID.CHALLENGE_FIGHT_LADDER,onStartFight);
                  SocketConnection.send(CommandID.CHALLENGE_FIGHT_LADDER,_catchTime);
               });
            }
            else
            {
               this._challengeLevel = 0;
               PetManager.setDefault(this._catchTime);
               SocketConnection.addCmdListener(CommandID.CHALLENGE_FIGHT_LADDER,this.onStartFight);
               SocketConnection.send(CommandID.CHALLENGE_FIGHT_LADDER,this._catchTime);
            }
         }
      }
      
      private function onGoOnBtnClick(e:MouseEvent) : void
      {
         if(this.PetLevelCertificate())
         {
            this._challengeLevel = this._userRecordLevel;
            PetManager.setDefault(this._catchTime);
            SocketConnection.addCmdListener(CommandID.CHALLENGE_FIGHT_LADDER,this.onStartFight);
            SocketConnection.send(CommandID.CHALLENGE_FIGHT_LADDER,this._catchTime);
         }
      }
      
      private function onViewClick(e:MouseEvent) : void
      {
         this.hide();
         ModuleManager.showModule(ClientConfig.getAppModule("LadderRankPanel"));
      }
      
      public function hide() : void
      {
         LevelManager.openMouseEvent();
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_KEEPRECORD_BONUS,this.onBonusGet);
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_PET_BESTRECORD,this.onBestRecordGet);
         SocketConnection.removeCmdListener(CommandID.FIGHTLADDER_GET_USER_RECORD,this.onRecordGet);
         SocketConnection.removeCmdListener(CommandID.CHALLENGE_FIGHT_LADDER,this.onStartFight);
         this._closeBtn.removeEventListener(MouseEvent.CLICK,this.onCloseClick);
         this._startBtn.removeEventListener(MouseEvent.CLICK,this.onStartBtnClick);
         this._goOnBtn.removeEventListener(MouseEvent.CLICK,this.onGoOnBtnClick);
         this._viewBtn.removeEventListener(MouseEvent.CLICK,this.onViewClick);
         for(var i:uint = 0; i <= 5; i++)
         {
            this._panel["sideBar"]["item" + i].removeEventListener(MouseEvent.CLICK,this.onItemClick);
         }
         DisplayUtil.removeForParent(this._panel);
      }
      
      public function destroy() : void
      {
         this.hide();
         this._panel = null;
      }
   }
}


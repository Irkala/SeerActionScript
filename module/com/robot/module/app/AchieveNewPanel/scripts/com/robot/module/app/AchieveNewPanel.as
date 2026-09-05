package com.robot.module.app
{
   import com.robot.app.achieve.AchievePanelController;
   import com.robot.app.mapProcess.control.HonorsHallController;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.AchieveXMLInfo;
   import com.robot.core.info.AchieveInfo;
   import com.robot.core.info.AchieveListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.uic.UIScrollBar;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import flash.utils.clearTimeout;
   import flash.utils.setTimeout;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.BitUtil;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class AchieveNewPanel extends Sprite implements IModule
   {
      
      private var _main:AchieveNewPanel_UI;
      
      private var _scroll:UIScrollBar;
      
      private var _IDList:Array;
      
      private var _max:uint;
      
      private var _activeList:AchieveListInfo;
      
      private var _list:Array;
      
      private var _notActiveList:Array;
      
      private var _loopCount:uint;
      
      private var _clickTab:uint;
      
      private var branchID0:uint;
      
      private var ruleID0:uint;
      
      private var branchID1:uint;
      
      private var ruleID1:uint;
      
      private var tip1:Tip1;
      
      private var tip2:Tip2;
      
      private var tip1Value:uint;
      
      private var tip2Value:uint;
      
      private var autoSwitch:uint;
      
      public function AchieveNewPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._main = new AchieveNewPanel_UI();
      }
      
      public function init(param1:Object = null) : void
      {
         if(param1 != null)
         {
            this.autoSwitch = (param1 as uint) + 1;
            this._main.mouseEnabled = false;
            this._main.mouseChildren = false;
         }
      }
      
      public function show() : void
      {
         var id:uint = 0;
         id = 0;
         var id1:uint = 0;
         LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
         SocketConnection.send(CommandID.ACTIVEACHIEVE,10);
         SocketConnection.send(CommandID.ACTIVEACHIEVE,20);
         SocketConnection.send(CommandID.ACTIVEACHIEVE,83);
         SocketConnection.send(CommandID.ACTIVEACHIEVE,95);
         SocketConnection.send(CommandID.ACTIVEACHIEVE,102);
         SocketConnection.addCmdListener(CommandID.ACHIEVELIST,this.onGetActive);
         SocketConnection.send(CommandID.ACHIEVELIST);
         SocketConnection.addCmdListener(CommandID.ACHIEVE_CURRENT,this.onGetCurrent);
         SocketConnection.send(CommandID.ACHIEVE_CURRENT);
         this._main.curPanel["item_0"].visible = false;
         this._main.curPanel["item_1"].visible = false;
         this._main.curPanel["item_0"]["branchID"].visible = this._main.curPanel["item_0"]["ruleID"].visible = this._main.curPanel["item_0"]["value"].visible = this._main.curPanel["item_0"]["ruleOri"].visible = false;
         this._main.curPanel["item_1"]["branchID"].visible = this._main.curPanel["item_1"]["ruleID"].visible = this._main.curPanel["item_1"]["value"].visible = this._main.curPanel["item_1"]["ruleOri"].visible = false;
         KTool.setAlignMid(this._main,602,480);
         KTool.showScore(this._main.scoreMC,0);
         this._main.info["mc"].gotoAndStop(1);
         this._main.close.addEventListener(MouseEvent.CLICK,this.onClose);
         this._main.tab0.addEventListener(MouseEvent.CLICK,this.onSwitch);
         this._main.tab0.buttonMode = true;
         this.addEvent();
         this.setTab(0);
         this.showMainInfo();
         LevelManager.appLevel.addChild(this._main);
         id = setTimeout(function():void
         {
            clearTimeout(id);
            SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,onGetCurrentInfo);
            SocketConnection.addCmdListener(CommandID.ACHIEVEINFO,onGetTip1Info);
            SocketConnection.send(CommandID.ACHIEVEINFO,10);
         },2000);
         this.tip1 = new Tip1();
         this.tip2 = new Tip2();
         this.tip1.visible = false;
         this.tip2.visible = false;
         this._main.addChild(this.tip1);
         this._main.addChild(this.tip2);
         if(this.autoSwitch > 0)
         {
            id1 = setTimeout(function():void
            {
               clearTimeout(id);
               _clickTab = autoSwitch;
               setTab(autoSwitch);
               _main.mouseEnabled = true;
               _main.mouseChildren = true;
            },500);
         }
      }
      
      private function onSwitch(param1:Event) : void
      {
         this.onClose(null);
         ModuleManager.showModule(ClientConfig.getAppModule("AchievePanel_2013"));
      }
      
      private function showMainInfo() : void
      {
         this._main.tip.visible = false;
         this._main.info["mc"].gotoAndStop(HonorsHallController.rankLv + 1);
         this._main.tip["txt"].text = "下一军衔：下士";
         this._main.info.addEventListener(MouseEvent.ROLL_OVER,this.onMouseOver);
         this._main.info.addEventListener(MouseEvent.ROLL_OUT,this.onMouseOut);
         this.getRankIcon(HonorsHallController.rankLv.toString(),this._main.info["con"]);
         this.getRankIcon((HonorsHallController.rankLv + 1).toString(),this._main.tip["con"]);
      }
      
      private function getRankIcon(param1:String, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:String = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ClientConfig.getResPath("achieve/rank/" + iconID + ".swf");
         ResourceManager.getResource(_url,function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(40,40);
               DisplayUtil.removeAllChild(iconContainer);
               DisplayUtil.stopAllMovieClip(_loc2_);
               iconContainer.addChild(_loc2_);
            }
         },"rank");
      }
      
      private function onMouseOver(param1:Event) : void
      {
         this._main.tip.visible = true;
      }
      
      private function onMouseOut(param1:Event) : void
      {
         this._main.tip.visible = false;
      }
      
      private function onGetActive(param1:SocketEvent) : void
      {
         this._activeList = param1.data as AchieveListInfo;
      }
      
      private function addEvent() : void
      {
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            this._main["btn" + _loc1_].addEventListener(MouseEvent.CLICK,this.onClickTab);
            _loc1_++;
         }
         KTool.showScore(this._main["scoreMC"],MainManager.actorInfo.totalAchieve);
         _loc1_ = 0;
         while(_loc1_ < 4)
         {
            this._main.achievePanel["con"]["item_" + _loc1_]["next"].addEventListener(MouseEvent.CLICK,this.onNext);
            this._main.achievePanel["con"]["item_" + _loc1_]["prev"].addEventListener(MouseEvent.CLICK,this.onPrev);
            _loc1_++;
         }
      }
      
      private function onPrev(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.currentTarget.parent as MovieClip;
         var _loc3_:uint = uint(_loc2_["ruleID"].text);
         var _loc4_:uint = uint(_loc2_["branchID"].text);
         var _loc5_:uint = uint(_loc2_["value"].text);
         var _loc6_:uint = uint(_loc2_["ruleOri"].text);
         if(_loc3_ == 1)
         {
            return;
         }
         _loc2_["ruleID"].text = (_loc3_ - 1).toString();
         _loc2_["desTxt"].text = AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@Desc;
         _loc2_["blood"]["txt"].text = _loc5_.toString() + " / " + AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@Threshold;
         _loc2_["blood"]["bloodMask"].width = _loc5_ / Number(AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@Threshold) * 155.7;
         if(AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@title == undefined)
         {
            _loc2_["titleTxt"].text = "";
         }
         else
         {
            _loc2_["titleTxt"].text = AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@title;
         }
         if(_loc3_ - 1 >= _loc6_)
         {
            _loc2_.filters = [ColorFilter.setGrayscale()];
         }
         else
         {
            _loc2_.filters = null;
         }
         this.getProIcon(AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@proicon,_loc2_["con0"]);
         this.getIcon(AchieveXMLInfo.getRule(_loc4_,_loc3_ - 1).@icon,_loc2_["con1"]);
      }
      
      private function onNext(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.currentTarget.parent as MovieClip;
         var _loc3_:uint = uint(_loc2_["ruleID"].text);
         var _loc4_:uint = uint(_loc2_["branchID"].text);
         var _loc5_:uint = uint(_loc2_["value"].text);
         var _loc6_:uint = uint(_loc2_["ruleOri"].text);
         if(_loc3_ == AchieveXMLInfo.getBranchByID(_loc4_).Rule.length())
         {
            return;
         }
         _loc2_["ruleID"].text = (_loc3_ + 1).toString();
         _loc2_["desTxt"].text = AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@Desc;
         _loc2_["blood"]["txt"].text = _loc5_.toString() + " / " + AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@Threshold;
         _loc2_["blood"]["bloodMask"].width = _loc5_ / Number(AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@Threshold) * 155.7;
         if(AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@title == undefined)
         {
            _loc2_["titleTxt"].text = "";
         }
         else
         {
            _loc2_["titleTxt"].text = AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@title;
         }
         if(_loc3_ + 1 >= _loc6_)
         {
            _loc2_.filters = [ColorFilter.setGrayscale()];
         }
         else
         {
            _loc2_.filters = null;
         }
         if(_loc5_ >= uint(AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@Threshold))
         {
            _loc2_.filters = null;
         }
         else
         {
            _loc2_.filters = [ColorFilter.setGrayscale()];
         }
         this.getProIcon(AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@proicon,_loc2_["con0"]);
         this.getIcon(AchieveXMLInfo.getRule(_loc4_,_loc3_ + 1).@icon,_loc2_["con1"]);
      }
      
      private function onClickTab(param1:Event) : void
      {
         this._clickTab = uint(param1.currentTarget.name.slice(3));
         this.setTab(this._clickTab);
      }
      
      private function setTab(param1:uint) : void
      {
         if(param1 == 0)
         {
            this._main.achievePanel.visible = false;
            this._main.curPanel.visible = true;
         }
         else
         {
            this._main.achievePanel.visible = true;
            this._main.curPanel.visible = false;
            this._list = AchieveXMLInfo.getBranchIDs(param1 - 1);
            this.activeAchieves();
         }
      }
      
      private function onGetCurrent(param1:SocketEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         SocketConnection.removeCmdListener(CommandID.ACHIEVE_CURRENT,this.onGetCurrent);
         var _loc5_:ByteArray = param1.data as ByteArray;
         this.branchID0 = _loc5_.readUnsignedInt();
         this.ruleID0 = _loc5_.readUnsignedInt();
         this.branchID1 = _loc5_.readUnsignedInt();
         this.ruleID1 = _loc5_.readUnsignedInt();
         if(this.branchID0 != 0)
         {
            SocketConnection.addCmdListener(CommandID.ACHIEVEINFO,this.onGetCurrentInfo);
            SocketConnection.send(CommandID.ACHIEVEINFO,this.branchID0);
         }
         if(this.branchID1 != 0)
         {
            SocketConnection.send(CommandID.ACHIEVEINFO,this.branchID1);
         }
         _loc2_ = 0;
         while(_loc2_ < 7)
         {
            _loc3_ = _loc5_.readUnsignedInt();
            _loc4_ = _loc5_.readUnsignedInt();
            this._main.curPanel["txt" + _loc2_].text = _loc3_.toString() + " / " + _loc4_.toString();
            _loc2_++;
         }
         this._main.curPanel["txt6"].text = _loc3_.toString() + " / " + _loc4_.toString();
      }
      
      private function onGetCurrentInfo(param1:SocketEvent) : void
      {
         var _loc2_:MovieClip = null;
         var _loc3_:XML = null;
         var _loc4_:int = 0;
         var _loc5_:uint = 0;
         var _loc6_:AchieveInfo = param1.data as AchieveInfo;
         var _loc7_:uint = uint(_loc6_.value);
         if(_loc6_.id == this.branchID0)
         {
            _loc2_ = this._main.curPanel["item_0"];
            _loc2_.visible = true;
         }
         else if(_loc6_.id == this.branchID1)
         {
            _loc2_ = this._main.curPanel["item_1"];
            _loc2_.visible = true;
         }
         _loc2_["next"].visible = false;
         _loc2_["prev"].visible = false;
         var _loc8_:XML = AchieveXMLInfo.getBranchByID(_loc6_.id);
         _loc2_["branchID"].text = _loc6_.id.toString();
         _loc2_["nameTxt"].text = _loc8_.@Desc;
         if(_loc6_.status > 0)
         {
            _loc2_["bloodBtn"].mouseEnabled = true;
            _loc2_["bloodBtn"].mouseEnabled = true;
            _loc4_ = _loc6_.status - 2;
            if(_loc4_ == 0)
            {
               _loc2_["desTxt"].text = AchieveXMLInfo.getRule(_loc6_.id,1).@Desc;
               _loc2_["blood"]["txt"].text = _loc6_.value.toString() + " / " + AchieveXMLInfo.getRule(_loc6_.id,1).@Threshold;
               _loc2_["ruleID"].text = "1";
               _loc2_["ruleOri"].text = "0";
            }
            else
            {
               _loc2_["desTxt"].text = AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@Desc;
               _loc2_["blood"]["txt"].text = _loc6_.value.toString() + " / " + AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@Threshold;
               _loc2_["ruleID"].text = (_loc4_ + 1).toString();
               _loc2_["ruleOri"].text = (_loc4_ + 1).toString();
            }
            _loc2_["value"].text = _loc6_.value.toString();
            _loc2_["blood"]["bloodMask"].width = _loc6_.value / uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@Threshold) * 155.7;
            _loc2_["blood"]["txt"].visible = true;
            _loc2_.visible = true;
            if(AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@title != undefined)
            {
               _loc2_["titleTxt"].text = AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@title;
            }
            else
            {
               _loc2_["titleTxt"].text = "";
            }
            _loc5_ = uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@proicon);
            this.getProIcon(_loc5_.toString(),_loc2_["con0"]);
            _loc5_ = uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_ + 1).@icon);
            this.getIcon(_loc5_.toString(),_loc2_["con1"]);
         }
         else
         {
            _loc2_["bloodBtn"].mouseEnabled = false;
            _loc2_["bloodBtn"].mouseEnabled = false;
            if(_loc6_.id == this.branchID0)
            {
               _loc4_ = int(this.ruleID0);
            }
            else if(_loc6_.id == this.branchID1)
            {
               _loc4_ = int(this.ruleID1);
            }
            _loc2_["desTxt"].text = AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@Desc;
            _loc2_["blood"].visible = false;
            if(AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@title != undefined)
            {
               _loc2_["titleTxt"].text = AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@title;
            }
            else
            {
               _loc2_["titleTxt"].text = "";
            }
            if([2,64,18,103,104,105,106,110].indexOf(_loc6_.id) != -1)
            {
               _loc5_ = uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@proicon);
               this.getSptIcon(_loc5_.toString(),_loc2_["con0"]);
            }
            else
            {
               _loc5_ = uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@proicon);
               this.getProIcon(_loc5_.toString(),_loc2_["con0"]);
            }
            _loc5_ = uint(AchieveXMLInfo.getRule(_loc6_.id,_loc4_).@icon);
            this.getIcon(_loc5_.toString(),_loc2_["con1"]);
         }
      }
      
      private function activeAchieves() : void
      {
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         this._notActiveList = [];
         _loc1_ = 0;
         while(_loc1_ < this._list.length)
         {
            if(this._activeList.achieveArr.indexOf(uint(this._list[_loc1_])) == -1)
            {
               this._notActiveList.push(uint(this._list[_loc1_]));
            }
            _loc1_++;
         }
         if(this._notActiveList[0] == 49 && this._notActiveList.length == 1)
         {
            this.checkInfo();
            return;
         }
         if(this._notActiveList.length > 0)
         {
            SocketConnection.addCmdListener(CommandID.ACTIVEACHIEVE,this.onActive);
            this._loopCount = this._notActiveList.length;
            _loc1_ = 0;
            while(_loc1_ < this._notActiveList.length)
            {
               _loc2_ = uint(this._notActiveList[_loc1_]);
               SocketConnection.send(CommandID.ACTIVEACHIEVE,_loc2_);
               _loc1_++;
            }
         }
         else
         {
            this.checkInfo();
         }
      }
      
      private function onActive(param1:SocketEvent) : void
      {
         --this._loopCount;
         if(this._loopCount == 0)
         {
            SocketConnection.removeCmdListener(CommandID.ACTIVEACHIEVE,this.onActive);
            this.checkInfo();
         }
      }
      
      private function checkInfo() : void
      {
         var _loc1_:int = 0;
         var _loc2_:uint = 0;
         AchievePanelController.infoList = [];
         if(this._list.length > 0)
         {
            SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetCurrentInfo);
            SocketConnection.addCmdListener(CommandID.ACHIEVEINFO,this.onGetAchieveInfo);
            this._loopCount = this._list.length;
            _loc1_ = 0;
            while(_loc1_ < this._list.length)
            {
               _loc2_ = uint(this._list[_loc1_]);
               if(_loc2_ == 49)
               {
                  --this._loopCount;
               }
               else
               {
                  SocketConnection.send(CommandID.ACHIEVEINFO,_loc2_);
               }
               _loc1_++;
            }
         }
      }
      
      private function onGetAchieveInfo(param1:SocketEvent) : void
      {
         --this._loopCount;
         var _loc2_:AchieveInfo = param1.data as AchieveInfo;
         if(_loc2_.id == 9)
         {
            _loc2_.value = _loc2_.status * 10;
         }
         AchievePanelController.infoList.push(_loc2_);
         if(this._loopCount == 0)
         {
            SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetAchieveInfo);
            this.unfoldBranch();
         }
      }
      
      private function unfoldBranch() : void
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:Object = null;
         var _loc6_:AchieveInfo = null;
         var _loc7_:XML = null;
         AchievePanelController.openList = [];
         _loc1_ = 0;
         while(_loc1_ < AchievePanelController.infoList.length)
         {
            _loc6_ = AchievePanelController.infoList[_loc1_] as AchieveInfo;
            _loc3_ = uint(_loc6_.id);
            if(_loc6_.status > 0)
            {
               _loc5_ = {
                  "info":AchievePanelController.infoList[_loc1_],
                  "rule":0
               };
               AchievePanelController.openList.push(_loc5_);
            }
            else
            {
               _loc4_ = uint(AchieveXMLInfo.getBranchByID(_loc3_).Rule.length());
               _loc2_ = 1;
               while(_loc2_ < _loc4_ + 1)
               {
                  _loc5_ = {
                     "info":AchievePanelController.infoList[_loc1_],
                     "rule":_loc2_
                  };
                  _loc7_ = AchieveXMLInfo.getRule(_loc6_.id,_loc2_);
                  if(_loc7_ != null)
                  {
                     if(!(Boolean(_loc7_) && _loc7_.@hide == "1"))
                     {
                        if(int(_loc7_.@AchievementPoint) != 0)
                        {
                           AchievePanelController.openList.push(_loc5_);
                        }
                     }
                  }
                  _loc2_++;
               }
            }
            _loc1_++;
         }
         this.showAchieves(this._clickTab - 1);
      }
      
      private function showAchieves(param1:uint) : void
      {
         this._scroll = new UIScrollBar(this._main.achievePanel["barBall"],this._main.achievePanel["barBg"],4,this._main.achievePanel["upBtn"],this._main.achievePanel["downBtn"]);
         this._scroll.addEventListener(MouseEvent.MOUSE_MOVE,this.onScrollMove);
         this._scroll.wheelObject = this._main.achievePanel["con"];
         this._scroll.totalLength = AchievePanelController.openList.length;
         this.updateInfos(0);
      }
      
      private function initInfoList() : void
      {
      }
      
      private function onScrollMove(param1:Event) : void
      {
         this.updateInfos(this._scroll.index);
      }
      
      private function updateInfos(param1:uint) : void
      {
         var j:int = 0;
         var i:uint = param1;
         var iconID:uint = 0;
         var mc:MovieClip = null;
         var branchXML:XML = null;
         var ruleXML:XML = null;
         var rule:uint = 0;
         var temp:uint = 0;
         var info:AchieveInfo = null;
         var info1:AchieveInfo = null;
         var status:uint = 0;
         var index:int = 0;
         var list:Array = AchievePanelController.openList;
         j = int(i);
         while(j < i + 4)
         {
            mc = this._main.achievePanel["con"]["item_" + index];
            mc["branchID"].visible = false;
            mc["ruleID"].visible = false;
            mc["value"].visible = false;
            mc["ruleOri"].visible = false;
            mc["blood"].visible = false;
            mc["bloodBtn"].buttonMode = true;
            mc["bloodBtn"].addEventListener(MouseEvent.CLICK,function(param1:Event):void
            {
               param1.currentTarget.parent["blood"].visible = true;
            });
            if(j < list.length)
            {
               branchXML = AchieveXMLInfo.getBranchByID(list[j]["info"].id);
               mc["branchID"].text = list[j]["info"].id.toString();
               mc["nameTxt"].text = branchXML.@Desc;
               if((list[j]["info"] as AchieveInfo).status > 0)
               {
                  mc["bloodBtn"].mouseEnabled = true;
                  mc["bloodBtn"].mouseEnabled = true;
                  mc["next"].visible = true;
                  mc["prev"].visible = true;
                  rule = (list[j]["info"] as AchieveInfo).status - 1;
                  if(rule == 0)
                  {
                     mc["desTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,1).@Desc;
                     mc.filters = [ColorFilter.setGrayscale()];
                     mc["blood"]["txt"].text = list[j]["info"].value.toString() + " / " + AchieveXMLInfo.getRule(list[j]["info"].id,1).@Threshold;
                     mc["ruleID"].text = "1";
                     mc["ruleOri"].text = "0";
                     if(AchieveXMLInfo.getRule(list[j]["info"].id,1).@title != undefined)
                     {
                        mc["titleTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,1).@title;
                     }
                     else
                     {
                        mc["titleTxt"].text = "";
                     }
                     iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,1).@proicon);
                     this.getProIcon(iconID.toString(),mc["con0"]);
                     iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,1).@icon);
                     this.getIcon(iconID.toString(),mc["con1"]);
                     if(list[j]["info"].id == 56)
                     {
                        if(list[j]["info"].value < uint(AchieveXMLInfo.getRule(56,1).@Threshold))
                        {
                           mc.filters = [ColorFilter.setGrayscale()];
                        }
                        else
                        {
                           mc["bloodBtn"].mouseEnabled = false;
                           mc["bloodBtn"].mouseEnabled = false;
                           mc["next"].visible = false;
                           mc["prev"].visible = false;
                           mc.filters = null;
                        }
                     }
                  }
                  else
                  {
                     if(AchieveXMLInfo.getRule(list[j]["info"].id,rule + 1) == null)
                     {
                        temp = rule;
                     }
                     else
                     {
                        temp = uint(rule + 1);
                     }
                     mc["desTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,temp).@Desc;
                     mc["blood"]["txt"].text = list[j]["info"].value.toString() + " / " + AchieveXMLInfo.getRule(list[j]["info"].id,temp).@Threshold;
                     if(list[j]["info"].value < uint(AchieveXMLInfo.getRule(list[j]["info"].id,temp).@Threshold))
                     {
                        mc.filters = [ColorFilter.setGrayscale()];
                     }
                     else
                     {
                        mc.filters = null;
                     }
                     mc["ruleID"].text = temp.toString();
                     mc["ruleOri"].text = temp.toString();
                     if((list[j]["info"] as AchieveInfo).status - 1 == 0)
                     {
                        if(AchieveXMLInfo.getRule(list[j]["info"].id,1).@title != undefined)
                        {
                           mc["titleTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,1).@title;
                        }
                        else
                        {
                           mc["titleTxt"].text = "";
                        }
                        iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,1).@proicon);
                        this.getProIcon(iconID.toString(),mc["con0"]);
                        iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,1).@icon);
                        this.getIcon(iconID.toString(),mc["con1"]);
                     }
                     else
                     {
                        if(AchieveXMLInfo.getRule(list[j]["info"].id,temp).@title != undefined)
                        {
                           mc["titleTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,temp).@title;
                        }
                        else
                        {
                           mc["titleTxt"].text = "";
                        }
                        iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,temp).@proicon);
                        this.getProIcon(iconID.toString(),mc["con0"]);
                        iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,temp).@icon);
                        this.getIcon(iconID.toString(),mc["con1"]);
                     }
                  }
                  mc["value"].text = list[j]["info"].value.toString();
                  if(AchieveXMLInfo.getRule(list[j]["info"].id,rule + 1) == null)
                  {
                     mc["blood"]["bloodMask"].width = list[j]["info"].value / uint(AchieveXMLInfo.getRule(list[j]["info"].id,rule).@Threshold) * 155.7;
                  }
                  else
                  {
                     mc["blood"]["bloodMask"].width = list[j]["info"].value / uint(AchieveXMLInfo.getRule(list[j]["info"].id,rule + 1).@Threshold) * 155.7;
                  }
                  mc["blood"]["txt"].visible = true;
                  mc.visible = true;
               }
               else
               {
                  mc["bloodBtn"].mouseEnabled = false;
                  mc["bloodBtn"].mouseEnabled = false;
                  mc["next"].visible = false;
                  mc["prev"].visible = false;
                  rule = uint(list[j]["rule"]);
                  trace(list[j]["info"].id,rule,AchieveXMLInfo.getRule(list[j]["info"].id,rule));
                  mc["desTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,rule).@Desc;
                  if(list[j]["info"].id == 2)
                  {
                     info = list[j]["info"];
                  }
                  if(Boolean(BitUtil.getBit(list[j]["info"].completeValue,rule - 1)))
                  {
                     mc.filters = null;
                  }
                  else
                  {
                     mc.filters = [ColorFilter.setGrayscale()];
                  }
                  mc.visible = true;
                  mc["blood"].visible = false;
                  if(AchieveXMLInfo.getRule(list[j]["info"].id,rule).@title != undefined)
                  {
                     mc["titleTxt"].text = AchieveXMLInfo.getRule(list[j]["info"].id,rule).@title;
                  }
                  else
                  {
                     mc["titleTxt"].text = "";
                  }
                  if([2,64,18,103,104,105,106,110].indexOf(list[j]["info"].id) != -1)
                  {
                     iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,rule).@proicon);
                     this.getSptIcon(iconID.toString(),mc["con0"]);
                  }
                  else
                  {
                     iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,rule).@proicon);
                     this.getProIcon(iconID.toString(),mc["con0"]);
                  }
                  iconID = uint(AchieveXMLInfo.getRule(list[j]["info"].id,rule).@icon);
                  this.getIcon(iconID.toString(),mc["con1"]);
               }
            }
            else
            {
               mc.visible = false;
            }
            mc.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver2);
            mc.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut2);
            mc.removeEventListener(MouseEvent.ROLL_OVER,this.onRollOver1);
            mc.removeEventListener(MouseEvent.ROLL_OUT,this.onRollOut1);
            if(list[j]["info"].id == 10 && mc["desTxt"].text == "完胜盖亚")
            {
               mc.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver1);
               mc.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut1);
            }
            else if(list[j]["info"].id == 20)
            {
               mc.addEventListener(MouseEvent.ROLL_OVER,this.onRollOver2);
               mc.addEventListener(MouseEvent.ROLL_OUT,this.onRollOut2);
            }
            if(list[j]["info"].id == 77)
            {
               mc["bloodBtn"].mouseEnabled = false;
               mc["bloodBtn"].mouseChildren = false;
               info1 = list[j]["info"];
               if(info1 != null)
               {
                  status = Math.log(info1.completeValue + 1) / Math.log(2);
                  if(status < 3)
                  {
                     mc["blood"].visible = false;
                     mc["nameTxt"].text = "乐园连续签到";
                     mc["desTxt"].text = AchieveXMLInfo.getRule(info1.id,status + 1).@Desc;
                     mc.filters = [ColorFilter.setGrayscale()];
                     mc["branchID"].text == "77";
                     mc["ruleOri"].text = (status + 1).toString();
                     if(status == 0)
                     {
                        mc["value"].text = "0";
                     }
                     else if(status == 1)
                     {
                        mc["value"].text = "10";
                     }
                     else if(status == 2)
                     {
                        mc["value"].text = "30";
                     }
                  }
                  else
                  {
                     mc["blood"].visible = false;
                     mc["nameTxt"].text = "乐园连续签到";
                     mc["desTxt"].text = "连续完成签到50次";
                     mc.filters = null;
                     mc["branchID"].text == "77";
                     mc["ruleOri"].text = "3";
                     mc["value"].text = "50";
                  }
               }
            }
            j++;
            index++;
         }
      }
      
      private function getProIcon(param1:String, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:String = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ClientConfig.getResPath("achieve/icon/" + iconID + ".swf");
         ResourceManager.getResource(ClientConfig.getResPath("achieve/icon/" + iconID + ".swf"),function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(45,40);
               DisplayUtil.removeAllChild(iconContainer);
               DisplayUtil.stopAllMovieClip(_loc2_);
               iconContainer.addChild(_loc2_);
            }
         },"icon");
      }
      
      private function getSptIcon(param1:String, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:String = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ClientConfig.getResPath("achieve/spt/" + iconID + ".swf");
         ResourceManager.getResource(_url,function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(45,40);
               DisplayUtil.removeAllChild(iconContainer);
               DisplayUtil.stopAllMovieClip(_loc2_);
               iconContainer.addChild(_loc2_);
            }
         },"spt");
      }
      
      private function getIcon(param1:String, param2:MovieClip) : void
      {
         var _url:String = null;
         var iconID:String = param1;
         var iconContainer:MovieClip = param2;
         DisplayUtil.removeAllChild(iconContainer);
         _url = ClientConfig.getResPath("achieve/point/" + iconID + ".swf");
         ResourceManager.getResource(_url,function(param1:DisplayObject):void
         {
            var _loc2_:MLoadPane = null;
            if(Boolean(param1))
            {
               _loc2_ = new MLoadPane(param1);
               if(param1.width > param1.height)
               {
                  _loc2_.fitType = MLoadPane.FIT_WIDTH;
               }
               else
               {
                  _loc2_.fitType = MLoadPane.FIT_HEIGHT;
               }
               _loc2_.setSizeWH(45,40);
               DisplayUtil.removeAllChild(iconContainer);
               DisplayUtil.stopAllMovieClip(_loc2_);
               iconContainer.addChild(_loc2_);
            }
         },"item");
      }
      
      private function onClose(param1:Event) : void
      {
         this.hide();
         ModuleManager.destroyForInstance(this);
      }
      
      public function hide() : void
      {
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         SocketConnection.removeCmdListener(CommandID.ACHIEVELIST,this.onGetActive);
         SocketConnection.removeCmdListener(CommandID.ACHIEVE_CURRENT,this.onGetCurrent);
         SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetCurrentInfo);
         SocketConnection.removeCmdListener(CommandID.ACTIVEACHIEVE,this.onActive);
         SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetAchieveInfo);
         this._main.close.removeEventListener(MouseEvent.CLICK,this.onClose);
         var _loc1_:int = 0;
         _loc1_ = 0;
         while(_loc1_ < 7)
         {
            this._main["btn" + _loc1_].removeEventListener(MouseEvent.CLICK,this.onClickTab);
            _loc1_++;
         }
         DisplayUtil.removeForParent(this._main);
         DisplayUtil.removeForParent(this.tip1);
         DisplayUtil.removeForParent(this.tip2);
         this.tip1 = null;
         this.tip2 = null;
      }
      
      private function onRollOver1(param1:Event) : void
      {
         this.tip1.y = param1.currentTarget.y + 70;
         this.tip1.x = 572;
         this.tip1.visible = true;
      }
      
      private function onRollOut1(param1:Event) : void
      {
         this.tip1.visible = false;
      }
      
      private function onRollOver2(param1:Event) : void
      {
         this.tip2.y = param1.currentTarget.y + 70;
         this.tip2.x = 572;
         this.tip2.visible = true;
      }
      
      private function onRollOut2(param1:Event) : void
      {
         this.tip2.visible = false;
      }
      
      private function onGetTip1Info(param1:SocketEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetTip1Info);
         var _loc5_:AchieveInfo = param1.data as AchieveInfo;
         this.tip1Value = _loc5_.value;
         _loc3_ = 0;
         while(_loc3_ < 3)
         {
            _loc2_ = this.tip1Value;
            _loc4_ = uint(_loc2_ >> _loc3_);
            if(Boolean(_loc4_ & 1 == 1))
            {
               if(Boolean(this.tip1))
               {
                  this.tip1["tick" + _loc3_].gotoAndStop(1);
               }
            }
            else if(Boolean(this.tip1))
            {
               this.tip1["tick" + _loc3_].gotoAndStop(2);
            }
            _loc3_++;
         }
         SocketConnection.addCmdListener(CommandID.ACHIEVEINFO,this.onGetTip2Info);
         SocketConnection.send(CommandID.ACHIEVEINFO,20);
      }
      
      private function onGetTip2Info(param1:SocketEvent) : void
      {
         var _loc2_:uint = 0;
         var _loc3_:int = 0;
         var _loc4_:uint = 0;
         SocketConnection.removeCmdListener(CommandID.ACHIEVEINFO,this.onGetTip2Info);
         var _loc5_:AchieveInfo = param1.data as AchieveInfo;
         this.tip2Value = _loc5_.value;
         _loc3_ = 0;
         while(_loc3_ < 7)
         {
            _loc2_ = this.tip2Value;
            _loc4_ = uint(_loc2_ >> _loc3_);
            trace(_loc4_,_loc4_ & 1);
            if(Boolean(_loc4_ & 1 == 1))
            {
               if(Boolean(this.tip2))
               {
                  this.tip2["tick" + _loc3_].gotoAndStop(1);
               }
            }
            else if(Boolean(this.tip2))
            {
               this.tip2["tick" + _loc3_].gotoAndStop(2);
            }
            _loc3_++;
         }
      }
      
      public function destroy() : void
      {
         this._main = null;
      }
   }
}


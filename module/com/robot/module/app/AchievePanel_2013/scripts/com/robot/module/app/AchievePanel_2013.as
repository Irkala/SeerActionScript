package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.AchieveXMLInfo;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.ItemInBagAlert;
   import com.robot.core.uic.UIScrollBar;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class AchievePanel_2013 extends Sprite implements IModule
   {
      
      private var xmlClass:Class = AchievePanel_2013_xmlClass;
      
      private var _xml:XML = XML(new this.xmlClass());
      
      private var _xmllist:XMLList;
      
      private var _rootList:Array;
      
      private var _mainUI:AchievePanel_2013_UI;
      
      private var _curIndex:int = -1;
      
      private var _scroll:UIScrollBar;
      
      private const MAX:uint = 10;
      
      private var _curGroupID:uint;
      
      private var _curBtn:MovieClip;
      
      public function AchievePanel_2013()
      {
         super();
      }
      
      public function setup() : void
      {
         var i:int = 0;
         var j:int = 0;
         var achieveInfo:AchieveGroupInfo = null;
         var achieveChildInfo:AchieveChildInfo = null;
         var giftInfo:GiftInfo = null;
         this._mainUI = new AchievePanel_2013_UI();
         this._rootList = [];
         for(i = 0; i < this._xml.Group.length(); i++)
         {
            achieveInfo = new AchieveGroupInfo();
            achieveInfo.groupID = this._xml.Group[i].@Id;
            achieveInfo.name = this._xml.Group[i].@name;
            achieveInfo.achieveList = [];
            achieveInfo.giftList = [];
            for(j = 0; j < this._xml.Group[i].Achievement.length(); j++)
            {
               achieveChildInfo = new AchieveChildInfo();
               achieveChildInfo.type = uint(this._xml.Group[i].Achievement[j].@Type);
               achieveChildInfo.branchID = uint(this._xml.Group[i].Achievement[j].@Branch);
               achieveChildInfo.ruleID = uint(this._xml.Group[i].Achievement[j].@Rule);
               achieveChildInfo.clickType = String(this._xml.Group[i].Achievement[j].@Click_type);
               achieveChildInfo.clickValue = String(this._xml.Group[i].Achievement[j].@Click_value);
               achieveInfo.achieveList.push(achieveChildInfo);
            }
            for(j = 0; j < this._xml.Group[i].Gift.length(); j++)
            {
               giftInfo = new GiftInfo();
               giftInfo.giftID = uint(this._xml.Group[i].Gift[j].@Id);
               giftInfo.giftCount = uint(this._xml.Group[i].Gift[j].@Count);
               achieveInfo.giftList.push(giftInfo);
            }
            this._rootList.push(achieveInfo);
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         var i:int = 0;
         SocketConnection.send(1022,86057631);
         LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
         KTool.setAlignMid(this._mainUI,602,480);
         this._mainUI.close.addEventListener(MouseEvent.CLICK,this.onClose);
         this._mainUI.tab1.addEventListener(MouseEvent.CLICK,this.onSwitch);
         this._mainUI.tab1.buttonMode = true;
         this._mainUI.achievePanel.panel.mask = this._mainUI.achievePanel.maskMC;
         LevelManager.appLevel.addChild(this._mainUI);
         for(i = 0; i < 4; i++)
         {
            this._mainUI.achievePanel["panel"]["item_" + i]["bg"]["down"].addEventListener(MouseEvent.CLICK,this.onClickDown);
            this._mainUI.achievePanel["panel"]["item_" + i]["getBtn"].addEventListener(MouseEvent.CLICK,this.onClickGet);
            this._mainUI.achievePanel.panel["item_" + i]["bg"].gotoAndStop(1);
         }
         SocketConnection.addCmdListener(CommandID.ACHIEVE_GROUP_GET_GIFT,this.onGetGift);
         SocketConnection.addCmdListener(CommandID.ACHIEVE_GROUP_CHECK,this.onCheckInfo);
         SocketConnection.send(CommandID.ACHIEVE_GROUP_CHECK,1,this.MAX);
         KTool.showScore(this._mainUI["scoreMC"],MainManager.actorInfo.totalAchieve);
      }
      
      private function onClickGet(e:Event) : void
      {
         this._curBtn = e.currentTarget as MovieClip;
         this._curGroupID = e.currentTarget.parent.groupID;
         SocketConnection.send(CommandID.ACHIEVE_GROUP_GET_GIFT,this._curGroupID);
      }
      
      private function onGetGift(e:SocketEvent) : void
      {
         var i:int = 0;
         var id:uint = 0;
         var count:uint = 0;
         for(i = 0; i < this._rootList[this._curGroupID - 1].giftList.length; i++)
         {
            id = uint(this._rootList[this._curGroupID - 1].giftList[i].giftID);
            count = uint(this._rootList[this._curGroupID - 1].giftList[i].giftCount);
            ItemInBagAlert.show(id,count + "个" + TextFormatUtil.getRedTxt(ItemXMLInfo.getName(id)) + "已经放入了您的储存箱！");
         }
         this._rootList[this._curGroupID - 1].giftStatus = 1;
         this._curBtn.visible = false;
         this._curBtn.parent["tag"].visible = true;
      }
      
      private function onCheckInfo(e:SocketEvent) : void
      {
         var i:int = 0;
         var j:int = 0;
         var flag1:uint = 0;
         var flag2:uint = 0;
         SocketConnection.removeCmdListener(CommandID.ACHIEVE_GROUP_CHECK,this.onCheckInfo);
         var data:ByteArray = e.data as ByteArray;
         var length:uint = data.readUnsignedInt();
         for(i = 0; i < length; i++)
         {
            data.readUnsignedInt();
            flag1 = data.readUnsignedInt();
            (this._rootList[i] as AchieveGroupInfo).giftStatus = flag1;
            flag2 = data.readUnsignedInt();
            if(flag2 == 31)
            {
               (this._rootList[i] as AchieveGroupInfo).isGoal = 1;
            }
            else
            {
               (this._rootList[i] as AchieveGroupInfo).isGoal = 0;
            }
            for(j = 0; j < this._rootList[i].achieveList.length; j++)
            {
               ((this._rootList[i] as AchieveGroupInfo).achieveList[j] as AchieveChildInfo).isFinish = KTool.getBit(flag2,j + 1);
            }
         }
         this.initScroll();
      }
      
      private function initScroll() : void
      {
         this._scroll = new UIScrollBar(this._mainUI.achievePanel["barBall"],this._mainUI.achievePanel["barBg"],4,this._mainUI.achievePanel["upBtn"],this._mainUI.achievePanel["downBtn"]);
         this._scroll.addEventListener(MouseEvent.MOUSE_MOVE,this.onScrollMove);
         this._scroll.totalLength = this._rootList.length;
         this.updateScrollInfos(0);
      }
      
      private function onScrollMove(e:Event) : void
      {
         this.backToFrame1();
         ResourceManager.cancelAll();
         this.updateScrollInfos(this._scroll.index);
      }
      
      private function onClickDown(e:Event) : void
      {
         var i:int = 0;
         this.removeEvent2();
         this.removeEvent1();
         this._curIndex = uint(e.currentTarget.parent.parent.name.slice(5));
         for(i = 0; i < 4; i++)
         {
            this._mainUI.achievePanel["panel"]["item_" + i]["bg"].gotoAndStop(1);
            if(this._curIndex != 3)
            {
               this._mainUI.achievePanel["panel"]["item_" + i].y = 90 * i;
            }
            else
            {
               this._mainUI.achievePanel["panel"]["item_" + i].y = 90 * (i - 1);
            }
         }
         this._mainUI.addEventListener(Event.ENTER_FRAME,this.onEnterFrame1);
         this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"].gotoAndStop(2);
      }
      
      private function onEnterFrame1(e:Event) : void
      {
         var i:int = 0;
         if(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"].currentFrame == 2)
         {
            this._mainUI.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame1);
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["up"].addEventListener(MouseEvent.CLICK,this.onClickUp);
            if(this._curIndex == 3)
            {
               this._mainUI.achievePanel["panel"]["item_3"].y = 180;
            }
            else
            {
               for(i = this._curIndex + 1; i < 4; i++)
               {
                  this._mainUI.achievePanel["panel"]["item_" + i].y += 90;
               }
            }
            for(i = 0; i < 4; i++)
            {
               if(this._mainUI.achievePanel["panel"]["item_" + i]["bg"].currentFrame == 1 && this._mainUI.achievePanel["panel"]["item_" + i]["bg"]["down"].hasEventListener(MouseEvent.CLICK) == false)
               {
                  this._mainUI.achievePanel["panel"]["item_" + i]["bg"]["down"].addEventListener(MouseEvent.CLICK,this.onClickDown);
               }
            }
            this.showChild(this._mainUI.achievePanel["panel"]["item_" + this._curIndex].groupID);
         }
      }
      
      private function showChild(groupID:uint) : void
      {
         var i:int = 0;
         var branchID:uint = 0;
         var ruleID:uint = 0;
         var iconID:uint = 0;
         for(i = 0; i < this._rootList[groupID - 1].achieveList.length; i++)
         {
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].type = this._rootList[groupID - 1].achieveList[i].type;
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].branchID = this._rootList[groupID - 1].achieveList[i].branchID;
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].ruleID = this._rootList[groupID - 1].achieveList[i].ruleID;
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].clickType = this._rootList[groupID - 1].achieveList[i].clickType;
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].clickValue = this._rootList[groupID - 1].achieveList[i].clickValue;
            if(Boolean(this._rootList[groupID - 1].achieveList[i].isFinish))
            {
               this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i]["tag"].visible = true;
            }
            else
            {
               this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i]["tag"].visible = false;
            }
            branchID = uint(this._rootList[groupID - 1].achieveList[i].branchID);
            ruleID = uint(this._rootList[groupID - 1].achieveList[i].ruleID);
            iconID = uint(AchieveXMLInfo.getRule(branchID,ruleID).@proicon);
            this.getAchieveIcon(iconID,this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i]["con"],branchID == 2 || branchID == 64 || branchID == 18 || branchID == 110 ? true : false,AchieveXMLInfo.getRule(branchID,ruleID).@Desc);
         }
      }
      
      private function backToFrame1() : void
      {
         var i:int = 0;
         if(this._curIndex == -1)
         {
            return;
         }
         if(Boolean(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["up"]))
         {
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["up"].removeEventListener(MouseEvent.CLICK,this.onClickUp);
            for(i = 0; i < 5; i++)
            {
               ToolTipManager.remove(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i]["con"]);
               this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].removeEventListener(MouseEvent.CLICK,this.onClickDetail);
            }
         }
         for(i = 0; i < 4; i++)
         {
            this._mainUI.achievePanel["panel"]["item_" + i].y = 90 * i;
         }
         this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"].gotoAndStop(1);
      }
      
      private function onEnterFrame2(e:Event) : void
      {
         if(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"].currentFrame == 1)
         {
            this._mainUI.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame2);
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["down"].addEventListener(MouseEvent.CLICK,this.onClickDown);
            this.backToFrame1();
            this._curIndex = -1;
         }
      }
      
      private function removeEvent2() : void
      {
         var i:int = 0;
         if(this._curIndex == -1)
         {
            return;
         }
         if(Boolean(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["up"]))
         {
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["up"].removeEventListener(MouseEvent.CLICK,this.onClickUp);
            for(i = 0; i < 5; i++)
            {
               ToolTipManager.remove(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i]["con"]);
               this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["child_" + i].removeEventListener(MouseEvent.CLICK,this.onClickDetail);
            }
         }
      }
      
      private function removeEvent1() : void
      {
         if(this._curIndex == -1)
         {
            return;
         }
         if(Boolean(this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["down"]))
         {
            this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"]["down"].removeEventListener(MouseEvent.CLICK,this.onClickDown);
         }
      }
      
      private function onClickUp(e:Event) : void
      {
         this.removeEvent2();
         this._mainUI.addEventListener(Event.ENTER_FRAME,this.onEnterFrame2);
         this._mainUI.achievePanel["panel"]["item_" + this._curIndex]["bg"].gotoAndStop(1);
      }
      
      private function onClose(e:Event) : void
      {
         this.hide();
         ModuleManager.destroyForInstance(this);
      }
      
      private function onSwitch(e:Event) : void
      {
         this.onClose(null);
         ModuleManager.showModule(ClientConfig.getAppModule("AchieveNewPanel"));
      }
      
      public function hide() : void
      {
         var i:int = 0;
         var j:int = 0;
         SocketConnection.removeCmdListener(CommandID.ACHIEVE_GROUP_GET_GIFT,this.onGetGift);
         this._curBtn = null;
         for(i = 0; i < 4; i++)
         {
            if(this._mainUI.achievePanel["panel"]["item_" + i]["bg"].currentFrame == 1)
            {
               this._mainUI.achievePanel["panel"]["item_" + i]["bg"]["down"].removeEventListener(MouseEvent.CLICK,this.onClickDown);
            }
            else
            {
               this._mainUI.achievePanel["panel"]["item_" + i]["bg"]["up"].removeEventListener(MouseEvent.CLICK,this.onClickUp);
            }
            this._mainUI.achievePanel["panel"]["item_" + i]["getBtn"].removeEventListener(MouseEvent.CLICK,this.onClickGet);
            for(j = 0; j < 3; j++)
            {
               ToolTipManager.remove(this._mainUI.achievePanel["panel"]["item_" + i]["gift_" + j]["con"]);
               DisplayUtil.removeAllChild(this._mainUI.achievePanel["panel"]["item_" + i]["gift_" + j]["con"]);
            }
         }
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         this._mainUI.close.removeEventListener(MouseEvent.CLICK,this.onClose);
         this._mainUI.tab1.removeEventListener(MouseEvent.CLICK,this.onSwitch);
         this._scroll.removeEventListener(MouseEvent.MOUSE_MOVE,this.onScrollMove);
         DisplayUtil.removeForParent(this._mainUI);
      }
      
      private function updateScrollInfos(i:uint) : void
      {
         var index:int = 0;
         var j:int = int(i);
         while(j < i + 4)
         {
            if(j < this._rootList.length)
            {
               this.getGiftIcon(this._rootList[j].giftList[0].giftID,this._mainUI.achievePanel["panel"]["item_" + index]["gift_0"]["con"]);
               this.getGiftIcon(this._rootList[j].giftList[1].giftID,this._mainUI.achievePanel["panel"]["item_" + index]["gift_1"]["con"]);
               this.getGiftIcon(this._rootList[j].giftList[2].giftID,this._mainUI.achievePanel["panel"]["item_" + index]["gift_2"]["con"]);
               this._mainUI.achievePanel["panel"]["item_" + index]["gift_0"]["txt"].text = this._rootList[j].giftList[0].giftCount;
               this._mainUI.achievePanel["panel"]["item_" + index]["gift_1"]["txt"].text = this._rootList[j].giftList[1].giftCount;
               this._mainUI.achievePanel["panel"]["item_" + index]["gift_2"]["txt"].text = this._rootList[j].giftList[2].giftCount;
               this._mainUI.achievePanel["panel"]["item_" + index].groupID = j + 1;
               if(Boolean(this._mainUI.achievePanel["panel"]["item_" + index]["bg"]["down"]) && this._mainUI.achievePanel["panel"]["item_" + index]["bg"]["down"].hasEventListener(MouseEvent.CLICK) == false)
               {
                  this._mainUI.achievePanel["panel"]["item_" + index]["bg"]["down"].addEventListener(MouseEvent.CLICK,this.onClickDown);
               }
               this._mainUI.achievePanel["panel"]["item_" + index].visible = true;
               this._mainUI.achievePanel["panel"]["item_" + index]["nameTxt"].text = (this._rootList[j] as AchieveGroupInfo).name;
               if((this._rootList[j] as AchieveGroupInfo).giftStatus == 0)
               {
                  this._mainUI.achievePanel["panel"]["item_" + index]["tag"].visible = false;
                  if((this._rootList[j] as AchieveGroupInfo).isGoal == 1)
                  {
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].visible = true;
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].gotoAndStop(2);
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].mouseEnabled = true;
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].mouseChildren = true;
                  }
                  else
                  {
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].visible = true;
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].gotoAndStop(1);
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].mouseEnabled = false;
                     this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].mouseChildren = false;
                  }
               }
               else
               {
                  this._mainUI.achievePanel["panel"]["item_" + index]["tag"].visible = true;
                  this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].visible = false;
                  this._mainUI.achievePanel["panel"]["item_" + index]["getBtn"].gotoAndStop(1);
               }
            }
            else
            {
               this._mainUI.achievePanel["panel"]["item_" + index].visible = false;
            }
            j++;
            index++;
         }
      }
      
      private function getGiftIcon(iconID:uint, iconContainer:MovieClip) : void
      {
         ToolTipManager.remove(iconContainer);
         ToolTipManager.add(iconContainer,ItemXMLInfo.getName(iconID));
         ResourceManager.getResource(ItemXMLInfo.getIconURL(iconID),function(obj:DisplayObject):void
         {
            if(!obj)
            {
               return;
            }
            DisplayUtil.removeAllChild(iconContainer);
            iconContainer.addChild(obj);
         });
      }
      
      private function getAchieveIcon(iconID:uint, iconContainer:MovieClip, isSpt:Boolean, name:String) : void
      {
         if(!isSpt)
         {
            ResourceManager.getResource(ClientConfig.getResPath("achieve/icon/" + iconID + ".swf"),function(mc:DisplayObject):void
            {
               var _icon:MLoadPane = null;
               if(Boolean(mc))
               {
                  _icon = new MLoadPane(mc);
                  if(mc.width > mc.height)
                  {
                     _icon.fitType = MLoadPane.FIT_WIDTH;
                  }
                  else
                  {
                     _icon.fitType = MLoadPane.FIT_HEIGHT;
                  }
                  _icon.setSizeWH(60,60);
                  DisplayUtil.removeAllChild(iconContainer);
                  DisplayUtil.stopAllMovieClip(_icon);
                  iconContainer.addChild(_icon);
                  ToolTipManager.remove(_icon);
                  ToolTipManager.add(_icon,name);
                  iconContainer.parent.addEventListener(MouseEvent.CLICK,onClickDetail);
               }
            },"icon");
         }
         else
         {
            ResourceManager.getResource(ClientConfig.getResPath("achieve/spt/" + iconID + ".swf"),function(mc:DisplayObject):void
            {
               var _icon:MLoadPane = null;
               if(Boolean(mc))
               {
                  _icon = new MLoadPane(mc);
                  if(mc.width > mc.height)
                  {
                     _icon.fitType = MLoadPane.FIT_WIDTH;
                  }
                  else
                  {
                     _icon.fitType = MLoadPane.FIT_HEIGHT;
                  }
                  _icon.setSizeWH(60,60);
                  DisplayUtil.removeAllChild(iconContainer);
                  DisplayUtil.stopAllMovieClip(_icon);
                  iconContainer.addChild(_icon);
                  ToolTipManager.remove(_icon);
                  ToolTipManager.add(_icon,name);
                  iconContainer.parent.addEventListener(MouseEvent.CLICK,onClickDetail);
               }
            },"icon");
         }
      }
      
      private function onClickDetail(e:Event) : void
      {
         var type:uint = uint(e.currentTarget.type);
         this.hide();
         ModuleManager.destroyForInstance(this);
         switch(e.currentTarget.clickType)
         {
            case "map":
               MapManager.changeMap(int(e.currentTarget.clickValue));
               break;
            case "module":
               ModuleManager.showModule(ClientConfig.getAppModule(e.currentTarget.clickValue),"正在打开...",type);
         }
      }
      
      public function destroy() : void
      {
         this._scroll = null;
         this._rootList = null;
         this._mainUI = null;
      }
   }
}

class AchieveGroupInfo
{
   
   public var groupID:uint;
   
   public var name:String;
   
   public var achieveList:Array;
   
   public var giftList:Array;
   
   public var giftStatus:uint;
   
   public var isGoal:uint;
   
   public function AchieveGroupInfo()
   {
      super();
   }
}

class AchieveChildInfo
{
   
   public var type:uint;
   
   public var branchID:uint;
   
   public var ruleID:uint;
   
   public var clickType:String;
   
   public var clickValue:String;
   
   public var isFinish:uint;
   
   public function AchieveChildInfo()
   {
      super();
   }
}

class GiftInfo
{
   
   public var giftID:uint;
   
   public var giftCount:uint;
   
   public function GiftInfo()
   {
      super();
   }
}

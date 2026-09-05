package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.FortressItemXMLInfo;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.info.team.ArmInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamInfoController;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.machineDog.OrgBgPanel;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NeedMatterListPanel extends Sprite implements IModule
   {
      
      private var _allIdA:Array;
      
      private var _panel:MatterList_Mc;
      
      private var _info:ArmInfo;
      
      private var _closeBtn:SimpleButton;
      
      private var _iconA:Array;
      
      private var _form:uint;
      
      private var _mcA:Array;
      
      private var _itemId:uint;
      
      private var _buyTime:uint;
      
      private var _inBtn:SimpleButton;
      
      private var _maxA:Array;
      
      private var _allNumA:Array;
      
      public function NeedMatterListPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         for(var i2:int = 0; i2 < _allIdA.length; i2++)
         {
            ToolTipManager.remove(_panel.getChildByName("icon" + i2) as Sprite);
         }
         hide();
         _panel = null;
         _closeBtn = null;
         _inBtn = null;
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panel);
      }
      
      public function setup() : void
      {
         _panel = new MatterList_Mc();
         _closeBtn = _panel["closeBtn"];
         _inBtn = _panel["inBtn"];
      }
      
      private function removeEvent() : void
      {
         _panel["insBtn"].removeEventListener(MouseEvent.CLICK,onInsClickHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         _inBtn.removeEventListener(MouseEvent.CLICK,onInBtnHandler);
      }
      
      private function onComHandler(e:SocketEvent) : void
      {
         _panel["insBtn"].mouseEnabled = true;
         SocketConnection.removeCmdListener(CommandID.ARM_UP_UPDATE,onComHandler);
         TeamInfoController._isUpdata = 0;
         hide();
         Alarm.show("升级成功!");
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as ArmInfo;
         _itemId = _info.id;
         _buyTime = _info.buyTime;
         _form = _info.form;
         _allIdA = TeamInfoController.needIdA;
         _allNumA = TeamInfoController.curNumA;
         _maxA = TeamInfoController.maxA;
      }
      
      private function onInsClickHandler(e:MouseEvent) : void
      {
         _panel["insBtn"].mouseEnabled = false;
         var a:uint = uint(FortressItemXMLInfo.getNextForm(_itemId,_form));
         if(MainManager.actorInfo.teamInfo.priv == 0 && _form < a)
         {
            SocketConnection.addCmdListener(CommandID.ARM_UP_UPDATE,onComHandler);
            SocketConnection.send(CommandID.ARM_UP_UPDATE,_buyTime,a);
         }
         else if(MainManager.actorInfo.teamInfo.priv != 0)
         {
            Alarm.show("你不是指挥官不能进行升级！");
         }
         else if(_form >= a)
         {
            Alarm.show("设施已经是最高级别了! ");
         }
      }
      
      private function onInBtnHandler(e:MouseEvent) : void
      {
         _inBtn.mouseEnabled = false;
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function removeIcon() : void
      {
         var i1:int = 0;
         if(_mcA)
         {
            for(i1 = 0; i1 < _mcA.length; i1++)
            {
               DisplayUtil.removeAllChild(_mcA[i1]);
               _mcA[i1] = null;
               ToolTipManager.remove(_iconA[i1]);
               DisplayUtil.removeAllChild(_iconA[i1]);
               _iconA[i1] = null;
            }
         }
         _mcA = new Array();
         _iconA = new Array();
      }
      
      private function removeNum(a:Array) : Array
      {
         for(var i1:* = 0; i1 < a.length; i1++)
         {
            if(a[i1] == 0)
            {
               a.splice(i1,1);
               i1--;
            }
         }
         return a;
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function show() : void
      {
         _panel["insBtn"].visible = false;
         _panel["inBtn"].visible = true;
         LevelManager.appLevel.addChild(_panel);
         DisplayUtil.align(_panel,null,AlignType.MIDDLE_CENTER);
         addEvent();
         _inBtn.mouseEnabled = false;
         setData();
         var b1:Boolean = true;
         for(var i1:int = 0; i1 < _allIdA.length; i1++)
         {
            if(_allNumA[i1] != _maxA[i1])
            {
               b1 = false;
               break;
            }
         }
         if(b1)
         {
            _panel["inBtn"].visible = false;
            _panel["insBtn"].visible = true;
            _panel["insBtn"].mouseEnabled = true;
         }
      }
      
      private function addEvent() : void
      {
         _panel["insBtn"].addEventListener(MouseEvent.CLICK,onInsClickHandler);
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _inBtn.addEventListener(MouseEvent.CLICK,onInBtnHandler);
      }
      
      private function setData() : void
      {
         var icon:OrgBgPanel = null;
         var mc:MatterItem_Mc = null;
         _panel["nameTxt"].text = FortressItemXMLInfo.getName(_info.id);
         _panel["ccTxt"].text = "    " + FortressItemXMLInfo.getDes(_info.id);
         removeIcon();
         for(var i2:int = 0; i2 < _allIdA.length; i2++)
         {
            icon = new OrgBgPanel();
            icon.showFormId(_allIdA[i2]);
            mc = new MatterItem_Mc();
            mc["nameTxt"].text = ItemXMLInfo.getName(_allIdA[i2]);
            mc["numTxt"].text = _allNumA[i2].toString() + "/" + _maxA[i2].toString();
            if(_allNumA[i2] / _maxA[i2] > 1)
            {
               mc["scaMc"].scaleX = 1;
            }
            else
            {
               mc["scaMc"].scaleX = _allNumA[i2] / _maxA[i2];
            }
            mc.addChild(icon);
            icon.width = 46;
            icon.height = 46;
            icon.x = 2;
            icon.y = 2;
            icon.name = "icon" + i2;
            ToolTipManager.add(icon,ItemXMLInfo.getName(_allIdA[i2]));
            _panel.addChild(mc);
            mc.x = 32;
            mc.y = (mc.height + 8) * i2 + 130;
            mc.name = "mc" + i2;
            _mcA.push(mc);
            _iconA.push(icon);
         }
         _inBtn.mouseEnabled = true;
      }
   }
}


package com.robot.module.app
{
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetBookXMLInfo;
   import com.robot.core.config.xml.PetEffectXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.RoomPetInfo;
   import com.robot.core.info.UserInfo;
   import com.robot.core.info.pet.PetEffectInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.RelationManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.ui.alert.Alert;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.component.control.MLoadPane;
   import org.taomee.manager.DragManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.StringUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetSimpleInfoPanel extends Sprite implements IModule
   {
      
      private var _personalityTxt:TextField;
      
      private var _ownerInfo:UserInfo;
      
      private var _typeIcon:SimpleButton;
      
      private var _info:RoomPetInfo;
      
      private var _capTimeTxt:TextField;
      
      private var _mainPanel:Pet_SimInfo_Mc;
      
      private var _petMc:MovieClip;
      
      private var _addFriendBtn:SimpleButton;
      
      private var _desTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _nameTxt:TextField;
      
      private var _numTxt:TextField;
      
      private var _ownTxt:TextField;
      
      private var _expTxt:TextField;
      
      private var _levTxt:TextField;
      
      public function PetSimpleInfoPanel()
      {
         super();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         ToolTipManager.remove(_addFriendBtn);
         _addFriendBtn.removeEventListener(MouseEvent.CLICK,onAddFriendHandler);
         DragManager.remove(_mainPanel["dragMc"]);
      }
      
      private function onComHandler(mc:DisplayObject) : void
      {
         if(_petMc)
         {
            DisplayUtil.removeForParent(_petMc);
            _petMc = null;
         }
         _petMc = mc as MovieClip;
         var pc:MLoadPane = new MLoadPane(_petMc);
         pc.setSizeWH(50,90);
         pc.fitType = MLoadPane.FIT_WIDTH;
         _mainPanel.addChild(pc);
         pc.x = 8;
         pc.y = 27;
         DisplayUtil.stopAllMovieClip(_petMc);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainPanel);
         removeEvent();
      }
      
      private function addTypeIcon() : void
      {
         if(_typeIcon)
         {
            DisplayUtil.removeForParent(_typeIcon);
            _typeIcon = null;
         }
         _typeIcon = UIManager.getButton("Icon_PetType_" + PetXMLInfo.getType(_info.id));
         if(_typeIcon)
         {
            _typeIcon.x = 169;
            _typeIcon.y = 45;
            DisplayUtil.uniformScale(_typeIcon,16);
            this._mainPanel.addChild(_typeIcon);
         }
      }
      
      public function init(data:Object = null) : void
      {
         var info:PetEffectInfo;
         if(_info)
         {
            ResourceManager.cancelURL(ClientConfig.getPetSwfPath(_info.id));
         }
         _info = data as RoomPetInfo;
         if(_info.ownerId == MainManager.actorID)
         {
            _addFriendBtn.visible = false;
         }
         else
         {
            _addFriendBtn.visible = true;
         }
         _nameTxt.text = PetXMLInfo.getName(_info.id);
         _numTxt.text = StringUtil.renewZero(_info.id.toString(),3);
         _levTxt.text = _info.lv.toString();
         _capTimeTxt.text = StringUtil.timeFormat(_info.catchTime);
         _desTxt.text = "    " + PetBookXMLInfo.getFeatures(_info.id);
         info = _info.effA[0];
         if(info)
         {
            _personalityTxt.htmlText = "<font color=\'#ffff00\'>" + NatureXMLInfo.getName(_info.nature) + "</font>" + "<font color=\'#ffffff\'>" + " 特性:" + "</font>" + "<font color=\'#ffff00\'>" + PetEffectXMLInfo.getEffect(info.effectID,info.args) + "</font>";
         }
         else
         {
            _personalityTxt.text = NatureXMLInfo.getName(_info.nature);
         }
         UserInfoManager.getInfo(_info.ownerId,function(info:UserInfo):void
         {
            _ownerInfo = info;
            _ownTxt.text = _ownerInfo.nick;
         });
         ResourceManager.getResource(ClientConfig.getPetSwfPath(_info.id),onComHandler);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _addFriendBtn.addEventListener(MouseEvent.CLICK,onAddFriendHandler);
         ToolTipManager.add(_addFriendBtn,"加为好友");
         DragManager.add(_mainPanel["dragMc"],_mainPanel);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         hide();
         _mainPanel = null;
         _numTxt = null;
         _nameTxt = null;
         _levTxt = null;
         _personalityTxt = null;
         _expTxt = null;
         _capTimeTxt = null;
         _ownTxt = null;
         _closeBtn = null;
         _addFriendBtn = null;
         _desTxt = null;
         _info = null;
         _petMc = null;
         _typeIcon = null;
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainPanel);
         DisplayUtil.align(_mainPanel,null,AlignType.MIDDLE_CENTER);
         addTypeIcon();
         addEvent();
      }
      
      private function onAddFriendHandler(e:MouseEvent) : void
      {
         hide();
         Alert.show("你想和" + _ownerInfo.nick + "(" + _ownerInfo.userID + ")\r成为好友吗?",function():void
         {
            RelationManager.addFriend(_ownerInfo.userID);
         });
      }
      
      public function setup() : void
      {
         _mainPanel = new Pet_SimInfo_Mc();
         _numTxt = _mainPanel["numTxt"];
         _nameTxt = _mainPanel["nameTxt"];
         _levTxt = _mainPanel["levTxt"];
         _personalityTxt = _mainPanel["personalityTxt"];
         _capTimeTxt = _mainPanel["capTimeTxt"];
         _ownTxt = _mainPanel["ownTxt"];
         _closeBtn = _mainPanel["closeBtn"];
         _addFriendBtn = _mainPanel["addFriendBtn"];
         _desTxt = _mainPanel["desTxt"];
      }
   }
}


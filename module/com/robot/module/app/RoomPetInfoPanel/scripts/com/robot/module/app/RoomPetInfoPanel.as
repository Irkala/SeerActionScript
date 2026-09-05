package com.robot.module.app
{
   import com.robot.app.sceneInteraction.RoomPetManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetEffectXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.RoomPetInfo;
   import com.robot.core.info.pet.PetEffectInfo;
   import com.robot.core.info.pet.PetListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.mode.AppModel;
   import com.robot.core.ui.alert.PetInBagAlert;
   import com.robot.core.ui.skillBtn.NormalSkillBtn;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.DepthManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.StringUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class RoomPetInfoPanel extends Sprite implements IModule
   {
      
      private static const MAX:int = 4;
      
      private var _speedTxt:TextField;
      
      private var _attackTxt:TextField;
      
      private var _info:RoomPetInfo;
      
      private var _inBagBtn:SimpleButton;
      
      private var _defenceTxt:TextField;
      
      private var _closeBtn:SimpleButton;
      
      private var _infoTxt:TextField;
      
      private var _mainUI:Sprite;
      
      private var _petSwitchPanel:AppModel;
      
      private var _obj:MovieClip;
      
      private var _des1:String = "<font color=\'#ffff00\'>";
      
      private var _des2:String = "</font>";
      
      private var _saTxt:TextField;
      
      private var skillBtnArray:Array = [];
      
      private var _hpTxt:TextField;
      
      private var _sdTxt:TextField;
      
      private var _applyBtn:SimpleButton;
      
      public function RoomPetInfoPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         if(_petSwitchPanel)
         {
            _petSwitchPanel.destroy();
            _petSwitchPanel = null;
         }
         _closeBtn = null;
         _mainUI = null;
         _obj = null;
      }
      
      private function onInBag(e:MouseEvent) : void
      {
         if(_info)
         {
            if(PetManager.length >= 6)
            {
               if(_petSwitchPanel == null)
               {
                  _petSwitchPanel = ModuleManager.getModule(ClientConfig.getAppModule("PetSwitchPanel"),"正在打开精灵切换面板...");
                  _petSwitchPanel.setup();
               }
               _petSwitchPanel.init(_info);
               _petSwitchPanel.show();
            }
            else
            {
               PetManager.storageToInBag(_info.catchTime);
               PetInBagAlert.show(_info.id,TextFormatUtil.getRedTxt(PetXMLInfo.getName(_info.id)) + "已经放入了你的精灵背包。");
            }
            hide();
         }
      }
      
      public function show() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
         onInfo();
      }
      
      public function init(data:Object = null) : void
      {
         var tinfo:RoomPetInfo = data as RoomPetInfo;
         if(_info)
         {
            if(_info.catchTime == tinfo.catchTime)
            {
               return;
            }
            ResourceManager.cancel(ClientConfig.getPetSwfPath(_info.id),onResLoad);
         }
         if(_obj)
         {
            DisplayUtil.removeForParent(_obj);
            _obj = null;
         }
         _info = tinfo;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(_info.id),onResLoad,"pet");
      }
      
      private function onInfo() : void
      {
         var skillBtn:NormalSkillBtn = null;
         var info:PetEffectInfo = _info.effA[0];
         var t:String = "";
         if(info)
         {
            t = " 特性:" + _des1 + PetEffectXMLInfo.getEffect(info.effectID,info.args) + _des2;
         }
         _infoTxt.htmlText = "序号:" + _des1 + StringUtil.renewZero(_info.id.toString(),3) + _des2 + "\n";
         _infoTxt.htmlText += "名字:" + _des1 + PetXMLInfo.getName(_info.id) + _des2 + "\n";
         _infoTxt.htmlText += "等级:" + _des1 + _info.lv.toString() + _des2 + "\n";
         _infoTxt.htmlText += "性格:" + _des1 + NatureXMLInfo.getName(_info.nature) + _des2 + t + "\n";
         _infoTxt.htmlText += "获得时间:" + _des1 + StringUtil.timeFormat(_info.catchTime) + _des2;
         _attackTxt.htmlText = "攻击:" + _des1 + _info.atk.toString() + _des2;
         _defenceTxt.htmlText = "防御:" + _des1 + _info.def.toString() + _des2;
         _saTxt.htmlText = "特攻:" + _des1 + _info.spatk.toString() + _des2;
         _sdTxt.htmlText = "特防:" + _des1 + _info.spdef.toString() + _des2;
         _speedTxt.htmlText = "速度:" + _des1 + _info.speed.toString() + _des2;
         _hpTxt.htmlText = "体力:" + _des1 + _info.hp.toString() + _des2;
         for(var i1:int = 0; i1 < 6; i1++)
         {
            TextField(_mainUI["txt" + i1]).htmlText = _des1 + String(_info.evValueA[i1]) + _des2;
         }
         clearOldBtn();
         for(var i:int = 0; i < MAX; i++)
         {
            if(i < _info.skillNum)
            {
               skillBtn = new NormalSkillBtn(_info.skillInfoArr[i].id,_info.skillInfoArr[i].pp);
            }
            else
            {
               skillBtn = new NormalSkillBtn();
            }
            skillBtn.x = 18 + (skillBtn.width + 10) * (i % 2);
            skillBtn.y = 200 + (skillBtn.height + 8) * Math.floor(i / 2);
            skillBtnArray.push(skillBtn);
            _mainUI.addChild(skillBtn);
         }
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      public function setup() : void
      {
         _mainUI = new UI_RoomPetInfoPanel();
         _closeBtn = _mainUI["closeBtn"];
         _applyBtn = _mainUI["applyBtn"];
         _inBagBtn = _mainUI["inBagBtn"];
         _infoTxt = _mainUI["infoTxt"];
         _attackTxt = _mainUI["attackTxt"];
         _defenceTxt = _mainUI["defenceTxt"];
         _saTxt = _mainUI["saTxt"];
         _sdTxt = _mainUI["sdTxt"];
         _speedTxt = _mainUI["speedTxt"];
         _hpTxt = _mainUI["hpTxt"];
         _infoTxt.mouseEnabled = false;
         _attackTxt.mouseEnabled = false;
         _defenceTxt.mouseEnabled = false;
         _saTxt.mouseEnabled = false;
         _sdTxt.mouseEnabled = false;
         _speedTxt.mouseEnabled = false;
         _hpTxt.mouseEnabled = false;
         if(MainManager.actorID == MainManager.actorInfo.mapID)
         {
            _applyBtn.visible = true;
            _inBagBtn.visible = true;
         }
         else
         {
            _applyBtn.visible = false;
            _inBagBtn.visible = false;
         }
      }
      
      public function hide() : void
      {
         ResourceManager.cancel(ClientConfig.getPetSwfPath(_info.id),onResLoad);
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onResLoad(o:DisplayObject) : void
      {
         _obj = o as MovieClip;
         _obj.mouseEnabled = false;
         DisplayUtil.stopAllMovieClip(_obj);
         _obj.scaleX = 2;
         _obj.scaleY = 2;
         _obj.x = 60;
         _obj.y = 100;
         _mainUI.addChild(_obj);
      }
      
      private function onApply(e:MouseEvent) : void
      {
         var listInfo:PetListInfo = null;
         if(_info)
         {
            RoomPetManager.getInstance().addEventListener(PetEvent.ROOM_PET_SHOW,function(e:PetEvent):void
            {
               RoomPetManager.getInstance().removeEventListener(PetEvent.ROOM_PET_SHOW,arguments.callee);
               hide();
            });
            listInfo = new PetListInfo();
            listInfo.id = _info.id;
            listInfo.catchTime = _info.catchTime;
            RoomPetManager.getInstance().showOrHide(listInfo,false);
         }
      }
      
      private function onClose(e:MouseEvent) : void
      {
         hide();
      }
      
      private function clearOldBtn() : void
      {
         var i:NormalSkillBtn = null;
         for each(i in skillBtnArray)
         {
            i.destroy();
            i = null;
         }
         skillBtnArray = [];
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(_mainUI);
         _mainUI.startDrag();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _applyBtn.removeEventListener(MouseEvent.CLICK,onApply);
         _inBagBtn.removeEventListener(MouseEvent.CLICK,onInBag);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _applyBtn.addEventListener(MouseEvent.CLICK,onApply);
         _inBagBtn.addEventListener(MouseEvent.CLICK,onInBag);
      }
   }
}


package com.robot.module.app.skill
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.ui.skillBtn.BlackSkillBtn;
   import com.robot.core.uic.UIPageBar;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DepthManager;
   import org.taomee.manager.ResourceManager;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.StringUtil;
   
   public class SkillReplacePanel extends Sprite
   {
      
      private static const MAX:int = 4;
      
      private var _cancelBtn:SimpleButton;
      
      private var _speedTxt:TextField;
      
      private var _attackTxt:TextField;
      
      private var _info:PetInfo;
      
      private var num:uint;
      
      private var _skillList:Array = [];
      
      private var _defenceTxt:TextField;
      
      private var _showMc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _infoTxt:TextField;
      
      private var _mainUI:Sprite;
      
      private var _id:uint;
      
      private var targetName:String;
      
      private var _selectHasSkill:BlackSkillBtn;
      
      private var _saTxt:TextField;
      
      private var _listCon:Sprite;
      
      private var _dragBtn:SimpleButton;
      
      private var _pageBar:UIPageBar;
      
      private var _skillBtnArray:Array = [];
      
      private var _hpTxt:TextField;
      
      private var _sdTxt:TextField;
      
      private var _applyBtn:SimpleButton;
      
      private var _selectListSkill:BlackSkillBtn;
      
      public function SkillReplacePanel()
      {
         var item:BlackSkillBtn = null;
         super();
         _mainUI = new UI_SkillReplacePanel();
         _closeBtn = _mainUI["closeBtn"];
         _dragBtn = _mainUI["dragBtn"];
         _applyBtn = _mainUI["applyBtn"];
         _cancelBtn = _mainUI["cancelBtn"];
         _infoTxt = _mainUI["infoTxt"];
         _infoTxt.autoSize = TextFieldAutoSize.LEFT;
         _infoTxt.multiline = true;
         _attackTxt = _mainUI["attackTxt"];
         _defenceTxt = _mainUI["defenceTxt"];
         _saTxt = _mainUI["saTxt"];
         _sdTxt = _mainUI["sdTxt"];
         _speedTxt = _mainUI["speedTxt"];
         _hpTxt = _mainUI["hpTxt"];
         _listCon = new Sprite();
         _listCon.x = 340;
         _listCon.y = 95;
         _mainUI.addChild(_listCon);
         var i:int = 0;
         while(i < MAX)
         {
            item = new BlackSkillBtn();
            item.y = (item.height + 10) * i;
            _listCon.addChild(item);
            i++;
         }
         _pageBar = new UIPageBar(_mainUI["preBtn"],_mainUI["nextBtn"],_mainUI["pageTxt"],MAX);
      }
      
      private function clearItem() : void
      {
         var item:BlackSkillBtn = null;
         _selectListSkill = null;
         var i:int = 0;
         while(i < MAX)
         {
            item = _listCon.getChildAt(i) as BlackSkillBtn;
            item.setSelect(false);
            item.removeEventListener(MouseEvent.CLICK,onItemClick);
            item.mouseEnabled = false;
            item.mouseChildren = false;
            item.clear();
            i++;
         }
      }
      
      private function refreshItem(id:uint) : void
      {
         var item:BlackSkillBtn = null;
         _pageBar.totalLength = _skillList.length;
         var len:int = Math.min(MAX,_pageBar.totalLength);
         var i:int = 0;
         while(i < len)
         {
            item = _listCon.getChildAt(i) as BlackSkillBtn;
            item.init(_skillList[i + _pageBar.index * MAX]);
            item.addEventListener(MouseEvent.CLICK,onItemClick);
            item.mouseEnabled = true;
            item.mouseChildren = true;
            item.buttonMode = true;
            i++;
         }
      }
      
      private function onH1(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.EXCHANGE_BLACKPET_SKILL,onH1);
         showDes();
      }
      
      private function onItemClick(e:MouseEvent) : void
      {
         if(_selectListSkill)
         {
            _selectListSkill.setSelect(false);
         }
         _selectListSkill = e.currentTarget as BlackSkillBtn;
         _selectListSkill.setSelect(true);
      }
      
      private function onH2(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.PET_SKILL_SWICTH,onH2);
         showDes();
      }
      
      private function onPageClick(e:DynamicEvent) : void
      {
         var item:BlackSkillBtn = null;
         clearItem();
         var index:uint = e.paramObject as uint;
         var len:int = Math.min(_skillList.length - index * MAX,MAX);
         var i:int = 0;
         while(i < len)
         {
            item = _listCon.getChildAt(i) as BlackSkillBtn;
            item.init(_skillList[i + index * MAX]);
            item.addEventListener(MouseEvent.CLICK,onItemClick);
            item.mouseEnabled = true;
            item.mouseChildren = true;
            i++;
         }
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         _mainUI.stopDrag();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainUI);
      }
      
      private function onHasSkillClick(e:MouseEvent) : void
      {
         if(_selectHasSkill)
         {
            _selectHasSkill.setSelect(false);
         }
         _selectHasSkill = e.currentTarget as BlackSkillBtn;
         _selectHasSkill.setSelect(true);
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         if(_showMc)
         {
            DisplayUtil.stopAllMovieClip(_showMc);
            _showMc.scaleX = 2;
            _showMc.scaleY = 2;
            _showMc.x = 100;
            _showMc.y = 120;
            _mainUI.addChild(_showMc);
         }
      }
      
      private function onApply(e:MouseEvent) : void
      {
         var isapply:Boolean = true;
         if(_selectHasSkill == null)
         {
            isapply = false;
         }
         if(_selectListSkill == null)
         {
            isapply = false;
         }
         if(!isapply)
         {
            Alarm.show("点击选择两边的技能才能进行技能唤醒。");
            return;
         }
         num = _info.skillNum;
         targetName = PetXMLInfo.getName(_info.id);
         if(_selectHasSkill.skillID > 100000)
         {
            _mainUI.mouseEnabled = false;
            _mainUI.mouseChildren = false;
            Alert.show("更换此技能时，当前技能石会被摧毁，确定要更换这个技能吗？",function():void
            {
               _mainUI.mouseEnabled = true;
               _mainUI.mouseChildren = true;
               execute();
            },function():void
            {
               _mainUI.mouseEnabled = true;
               _mainUI.mouseChildren = true;
            });
         }
         else
         {
            execute();
         }
      }
      
      private function onClose(e:MouseEvent) : void
      {
         destroy();
      }
      
      private function showDes() : void
      {
         if(num >= 4)
         {
            MainManager.actorInfo.coins -= 100;
            Alarm.show("你花费了100赛尔豆使<font color=\'#FF0000\'>" + targetName + "</font>技能唤醒成功！");
         }
         else
         {
            Alarm.show("你的精灵<font color=\'#FF0000\'>" + targetName + "</font>技能唤醒成功！");
         }
      }
      
      private function clearOldBtn() : void
      {
         var i:BlackSkillBtn = null;
         for each(i in _skillBtnArray)
         {
            i.removeEventListener(MouseEvent.CLICK,onHasSkillClick);
            i.destroy();
            i = null;
         }
         _skillBtnArray = [];
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(_mainUI);
         _mainUI.startDrag();
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _applyBtn.removeEventListener(MouseEvent.CLICK,onApply);
         _cancelBtn.removeEventListener(MouseEvent.CLICK,onClose);
         _pageBar.removeEventListener(MouseEvent.CLICK,onPageClick);
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onClose);
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _applyBtn.addEventListener(MouseEvent.CLICK,onApply);
         _cancelBtn.addEventListener(MouseEvent.CLICK,onClose);
         _pageBar.addEventListener(MouseEvent.CLICK,onPageClick);
      }
      
      public function destroy() : void
      {
         if(_id != 0)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(_id),onShowComplete);
         }
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         clearOldBtn();
         hide();
         _info = null;
         _mainUI = null;
         _infoTxt = null;
         _attackTxt = null;
         _defenceTxt = null;
         _saTxt = null;
         _sdTxt = null;
         _speedTxt = null;
         _hpTxt = null;
         clearItem();
         _selectHasSkill = null;
         _selectListSkill = null;
         _listCon = null;
         _skillList = null;
         _pageBar = null;
      }
      
      private function execute() : void
      {
         if(_info.id == 650 || _info.id == 651 || _info.id == 652)
         {
            SocketConnection.addCmdListener(CommandID.EXCHANGE_BLACKPET_SKILL,onH1);
            SocketConnection.send(CommandID.EXCHANGE_BLACKPET_SKILL,_info.catchTime,_selectHasSkill.skillID,_selectListSkill.skillID,1);
         }
         else
         {
            SocketConnection.addCmdListener(CommandID.PET_SKILL_SWICTH,onH2);
            SocketConnection.send(CommandID.PET_SKILL_SWICTH,_info.catchTime,1,1,_selectHasSkill.skillID,_selectListSkill.skillID);
         }
         destroy();
      }
      
      public function show(info:PetInfo, skillList:Array) : void
      {
         var skillBtn:BlackSkillBtn = null;
         if(DisplayUtil.hasParent(_mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         _info = info;
         _skillList = skillList;
         _infoTxt.appendText("序号:" + StringUtil.renewZero(info.id.toString(),3));
         _infoTxt.appendText("\n名字:" + PetXMLInfo.getName(info.id));
         _infoTxt.appendText("\n等级:" + info.level.toString());
         _infoTxt.appendText("\n性格:" + NatureXMLInfo.getName(info.nature));
         if(_id != 0)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(_id),onShowComplete);
         }
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         _id = info.id;
         ResourceManager.getResource(ClientConfig.getPetSwfPath(info.id),onShowComplete,"pet");
         _attackTxt.text = "攻击:" + info.attack.toString();
         _defenceTxt.text = "防御:" + info.defence.toString();
         _saTxt.text = "特攻:" + info.s_a.toString();
         _sdTxt.text = "特防:" + info.s_d.toString();
         _speedTxt.text = "速度:" + info.speed.toString();
         _hpTxt.text = "体力:" + info.hp.toString();
         clearOldBtn();
         var i:int = 0;
         while(i < MAX)
         {
            if(i < info.skillNum)
            {
               skillBtn = new BlackSkillBtn(info.skillArray[i].id,info.skillArray[i].pp);
               skillBtn.buttonMode = true;
               skillBtn.addEventListener(MouseEvent.CLICK,onHasSkillClick);
            }
            else
            {
               skillBtn = new BlackSkillBtn();
            }
            skillBtn.x = 40 + (skillBtn.width + 10) * (i % 2);
            skillBtn.y = 226 + (skillBtn.height + 5) * Math.floor(i / 2);
            _skillBtnArray.push(skillBtn);
            _mainUI.addChild(skillBtn);
            i++;
         }
         refreshItem(_info.id);
         addEvent();
      }
   }
}


package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.manager.UIManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.skillBtn.NormalSkillBtn;
   import com.robot.core.uic.UIPanel;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   import org.taomee.utils.StringUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetSkillSortPanel extends UIPanel implements IModule
   {
      
      private static const MAX:int = 4;
      
      private var _charaTxt:TextField;
      
      private var _attackTxt:TextField;
      
      private var mainUI:PetSkillUI = new PetSkillUI();
      
      private var applyBtn:SimpleButton;
      
      private var _speedTxt:TextField;
      
      private var resetBtn:SimpleButton;
      
      private var attMc:SimpleButton;
      
      private var _showMc:MovieClip;
      
      private var _defenceTxt:TextField;
      
      private var _nameTxt:TextField;
      
      private var _numTxt:TextField;
      
      private var _levelTxt:TextField;
      
      private var _curretItem:NormalSkillBtn;
      
      private var ev_saTxt:TextField;
      
      private var info:PetInfo;
      
      private var _id:uint;
      
      private var upBtn:SimpleButton;
      
      private var _saTxt:TextField;
      
      private var ev_hpTxt:TextField;
      
      private var skillBtnArray:Array = [];
      
      private var _hpTxt:TextField;
      
      private var ev_sdTxt:TextField;
      
      private var _getTimeTxt:TextField;
      
      private var ev_defenceTxt:TextField;
      
      private var _sdTxt:TextField;
      
      private var downBtn:SimpleButton;
      
      private var _upExpTxt:TextField;
      
      private var sortChange:Boolean = false;
      
      private var ev_speedTxt:TextField;
      
      private var ev_attackTxt:TextField;
      
      public function PetSkillSortPanel()
      {
         super(mainUI);
      }
      
      private function onSkillBtnClickHandler(e:MouseEvent) : void
      {
         if(_curretItem)
         {
            _curretItem.setSelect(false);
            _curretItem = null;
         }
         _curretItem = e.currentTarget as NormalSkillBtn;
         _curretItem.setSelect(true);
      }
      
      private function onSuccessHandler(e:SocketEvent) : void
      {
         destroy();
         PetManager.upDate();
         Alarm.show("技能排列成功！");
         MainManager.actorInfo.coins -= 100;
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      private function clearInfo() : void
      {
         _numTxt.text = "";
         _nameTxt.text = "";
         _levelTxt.text = "";
         _upExpTxt.text = "";
         _charaTxt.text = "";
         _getTimeTxt.text = "";
         _attackTxt.text = "";
         _defenceTxt.text = "";
         _saTxt.text = "";
         _sdTxt.text = "";
         _speedTxt.text = "";
         _hpTxt.text = "";
         if(_id != 0)
         {
            ResourceManager.cancel(ClientConfig.getPetSwfPath(_id),onShowComplete);
         }
         if(_showMc)
         {
            DisplayUtil.removeForParent(_showMc);
            _showMc = null;
         }
         if(skillBtnArray)
         {
            clearOldBtn();
         }
         info = null;
      }
      
      override public function destroy() : void
      {
         SocketConnection.removeCmdListener(CommandID.Skill_Sort,onSuccessHandler);
         upBtn.removeEventListener(MouseEvent.CLICK,onUpBtnClickHandler);
         downBtn.removeEventListener(MouseEvent.CLICK,onDownBtnClickHandler);
         upBtn = null;
         downBtn = null;
         applyBtn.removeEventListener(MouseEvent.CLICK,onApplyBtnClickHandler);
         applyBtn = null;
         resetBtn.removeEventListener(MouseEvent.CLICK,onResetBtnClickHandler);
         resetBtn = null;
         clearInfo();
         super.destroy();
      }
      
      public function init(data:Object = null) : void
      {
         info = data as PetInfo;
      }
      
      public function show() : void
      {
         _numTxt.text = "序号:" + StringUtil.renewZero(info.id.toString(),3);
         _nameTxt.text = "名字:" + PetXMLInfo.getName(info.id);
         _levelTxt.text = "等级:" + info.level.toString();
         _upExpTxt.text = "升级所需经验值:" + (info.nextLvExp - info.exp).toString();
         _charaTxt.htmlText = "性格:<font color=\'#ffff00\'>" + NatureXMLInfo.getName(info.nature) + "</font>";
         _getTimeTxt.text = "获得时间:" + StringUtil.timeFormat(info.catchTime);
         if(attMc)
         {
            DisplayUtil.removeForParent(attMc);
            attMc = null;
         }
         attMc = UIManager.getButton("Icon_PetType_" + PetXMLInfo.getType(info.id));
         if(attMc)
         {
            attMc.x = _nameTxt.x + _nameTxt.textWidth + 10;
            attMc.y = _nameTxt.y;
            DisplayUtil.uniformScale(attMc,20);
            _mainUI.addChild(attMc);
         }
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
         ev_attackTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_attack.toString() + "</font>";
         ev_defenceTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_defence.toString() + "</font>";
         ev_saTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_sa.toString() + "</font>";
         ev_sdTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_sd.toString() + "</font>";
         ev_speedTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_sp.toString() + "</font>";
         ev_hpTxt.htmlText = "<font color=\'#ffff00\'>" + info.ev_hp.toString() + "</font>";
         clearOldBtn();
         resetSkill();
         _mainUI.visible = true;
         _show();
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
      }
      
      private function removeSkill() : void
      {
         var i:NormalSkillBtn = null;
         for each(i in skillBtnArray)
         {
            DisplayUtil.removeForParent(i);
         }
      }
      
      private function onShowComplete(o:DisplayObject) : void
      {
         _showMc = o as MovieClip;
         if(_showMc)
         {
            DisplayUtil.stopAllMovieClip(_showMc);
            _showMc.scaleX = 2;
            _showMc.scaleY = 2;
            _showMc.x = 85;
            _showMc.y = 215;
            _mainUI.addChild(_showMc);
         }
      }
      
      private function onDownBtnClickHandler(e:MouseEvent) : void
      {
         if(_curretItem == null)
         {
            Alarm.show("要选中你要调换的技能哦");
            return;
         }
         removeSkill();
         sortSkill(false);
         showSkill();
      }
      
      private function onApplyBtnClickHandler(e:MouseEvent) : void
      {
         var arr:Array = null;
         var by:ByteArray = null;
         var i:uint = 0;
         if(sortChange)
         {
            arr = [];
            arr.push(info.catchTime);
            by = new ByteArray();
            by.writeUnsignedInt(arr[0]);
            SocketConnection.addCmdListener(CommandID.Skill_Sort,onSuccessHandler);
            for(i = 0; i < skillBtnArray.length; i++)
            {
               if(skillBtnArray[i])
               {
                  arr.push(by.writeUnsignedInt((skillBtnArray[i] as NormalSkillBtn).skillID));
               }
               else
               {
                  arr.push(0);
               }
            }
            SocketConnection.send(CommandID.Skill_Sort,by);
         }
      }
      
      private function showSkill() : void
      {
         var blankBtn:NormalSkillBtn = null;
         for(var i:int = 0; i < MAX; i++)
         {
            if(skillBtnArray[i])
            {
               skillBtnArray[i].y = 119 + (skillBtnArray[i].height + 20) * i;
               _mainUI.addChild(skillBtnArray[i]);
            }
            else
            {
               blankBtn = new NormalSkillBtn();
               blankBtn.x = 368;
               blankBtn.y = 119 + (blankBtn.height + 20) * i;
               _mainUI.addChild(blankBtn);
            }
         }
      }
      
      private function onResetBtnClickHandler(e:MouseEvent) : void
      {
         sortChange = false;
         clearOldBtn();
         resetSkill();
      }
      
      private function onUpBtnClickHandler(e:MouseEvent) : void
      {
         if(_curretItem == null)
         {
            Alarm.show("要选中你要调换的技能哦");
            return;
         }
         removeSkill();
         sortSkill(true);
         showSkill();
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
      
      private function sortSkill(b:Boolean) : void
      {
         var temp:NormalSkillBtn = null;
         var temp1:NormalSkillBtn = null;
         var index:uint = 0;
         for(var i:uint = 0; i < skillBtnArray.length; i++)
         {
            if(skillBtnArray[i] == _curretItem)
            {
               index = i;
               break;
            }
         }
         if(b)
         {
            if(index == 0)
            {
               return;
            }
            if(!sortChange)
            {
               sortChange = true;
            }
            temp = skillBtnArray[index];
            skillBtnArray[index] = skillBtnArray[index - 1];
            skillBtnArray[index - 1] = temp;
         }
         else
         {
            if(index == skillBtnArray.length - 1)
            {
               return;
            }
            if(!sortChange)
            {
               sortChange = true;
            }
            temp1 = skillBtnArray[index];
            skillBtnArray[index] = skillBtnArray[index + 1];
            skillBtnArray[index + 1] = temp1;
         }
      }
      
      private function resetSkill() : void
      {
         var skillBtn:NormalSkillBtn = null;
         _curretItem = null;
         for(var i:int = 0; i < MAX; i++)
         {
            if(i < info.skillNum)
            {
               skillBtn = new NormalSkillBtn(info.skillArray[i].id,info.skillArray[i].pp);
               skillBtn.addEventListener(MouseEvent.CLICK,onSkillBtnClickHandler);
               skillBtnArray.push(skillBtn);
            }
            else
            {
               skillBtn = new NormalSkillBtn();
            }
            skillBtn.mouseChildren = false;
            skillBtn.x = 368;
            skillBtn.y = 119 + (skillBtn.height + 20) * i;
            _mainUI.addChild(skillBtn);
         }
      }
      
      public function setup() : void
      {
         _numTxt = mainUI["numTxt"];
         _nameTxt = mainUI["nameTxt"];
         _levelTxt = mainUI["levelTxt"];
         _upExpTxt = mainUI["upExpTxt"];
         _charaTxt = mainUI["charaTxt"];
         _getTimeTxt = mainUI["getTimeTxt"];
         _attackTxt = mainUI["attackTxt"];
         _defenceTxt = mainUI["defenceTxt"];
         _saTxt = mainUI["saTxt"];
         _sdTxt = mainUI["sdTxt"];
         _speedTxt = mainUI["speedTxt"];
         _hpTxt = mainUI["hpTxt"];
         ev_attackTxt = mainUI["ev_attackTxt"];
         ev_defenceTxt = mainUI["ev_defenceTxt"];
         ev_saTxt = mainUI["ev_saTxt"];
         ev_sdTxt = mainUI["ev_sdTxt"];
         ev_speedTxt = mainUI["ev_speedTxt"];
         ev_hpTxt = mainUI["ev_hpTxt"];
         for(var i:uint = 0; i < 6; i++)
         {
            ToolTipManager.add(mainUI["icon_" + i],"学习力");
         }
         upBtn = mainUI["upBtn"];
         downBtn = mainUI["downBtn"];
         upBtn.addEventListener(MouseEvent.CLICK,onUpBtnClickHandler);
         downBtn.addEventListener(MouseEvent.CLICK,onDownBtnClickHandler);
         applyBtn = mainUI["applyBtn"];
         applyBtn.addEventListener(MouseEvent.CLICK,onApplyBtnClickHandler);
         resetBtn = mainUI["resetBtn"];
         resetBtn.addEventListener(MouseEvent.CLICK,onResetBtnClickHandler);
      }
   }
}


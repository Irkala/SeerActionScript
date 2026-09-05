package com.robot.module.app
{
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.events.MouseEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LearningabilityChoosePanle extends SimpleModule
   {
      
      private var _chooseFun:Function;
      
      private var _petName:String;
      
      private var _chooseIndex:int = -1;
      
      private var _petInfo:PetInfo;
      
      private var _addNum:int = 255;
      
      private var _frame:int;
      
      private var config:Object = {
         "0":["攻击学习力",1,"ev_attack"],
         "1":["特攻学习力",3,"ev_sa"],
         "2":["速度学习力",5,"ev_sp"],
         "3":["防御学习力",2,"ev_defence"],
         "4":["特防学习力",4,"ev_sd"],
         "5":["体力学习力",0,"ev_hp"]
      };
      
      public function LearningabilityChoosePanle()
      {
         super();
      }
      
      override public function init(data:Object = null) : void
      {
         this._chooseFun = data["fun"] as Function;
         this._petName = data["name"];
         this._petInfo = data["petInfo"];
         if(Boolean(data["addNum"]))
         {
            this._addNum = data["addNum"];
         }
         if(Boolean(data["frame"]))
         {
            this._frame = data["frame"];
            _ui["titleMC"].gotoAndStop(data["frame"]);
         }
         else
         {
            _ui["titleMC"].gotoAndStop(1);
         }
      }
      
      override public function setup() : void
      {
         _ui = new LearningabilityChooseUI();
         var i:int = 0;
         while(i < 6)
         {
            this.addChooseBtnEvent(i);
            i++;
         }
         addMoudleEvent(this.ui.okBtn,MouseEvent.CLICK,this.onOkbtnClick);
      }
      
      override public function show() : void
      {
         this.setChooseItem(-1);
         super.show();
      }
      
      override public function hide() : void
      {
         super.hide();
      }
      
      private function setChooseItem(chooseIndex:int) : void
      {
         this._chooseIndex = chooseIndex;
         var i:int = 0;
         while(i < 6)
         {
            if(i == this._chooseIndex)
            {
               this.ui["btn" + i].gotoAndStop(2);
               setButtonMode(this.ui["btn" + i],false);
            }
            else
            {
               this.ui["btn" + i].gotoAndStop(1);
               setButtonMode(this.ui["btn" + i],true);
            }
            i++;
         }
      }
      
      private function setButtonMode(param1:*, param2:Boolean) : void
      {
         if(null != param1 && Boolean(param1.hasOwnProperty("buttonMode")))
         {
            param1["buttonMode"] = param2;
         }
      }
      
      private function addChooseBtnEvent(i:int) : void
      {
         addMoudleEvent(this.ui["btn" + i],MouseEvent.CLICK,function(e:*):void
         {
            setChooseItem(i);
         });
      }
      
      private function onOkbtnClick(event:MouseEvent) : void
      {
         if(this._chooseIndex == -1)
         {
            Alarm.show("请先点击选择你要注入的学习力类型！");
            return;
         }
         if(this._petInfo[this.config[this._chooseIndex + ""][2]] == 255)
         {
            Alarm.show("你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(this._petInfo.id) + "</font>的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "已满，无法注入哦！");
         }
         else
         {
            if(this._frame == 3)
            {
               if(this.totalAbility >= 510)
               {
                  Alarm.show("你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(this._petInfo.id) + "</font>的学习力总值不能超过510，无法注入哦！");
                  return;
               }
               if(this._addNum < 255)
               {
                  Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "提升" + this._addNum + "点吗？",function():void
                  {
                     _chooseFun(config[_chooseIndex + ""][1],config[_chooseIndex + ""][0]);
                     hide();
                  });
               }
               else
               {
                  Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "直接提升至255吗？",function():void
                  {
                     _chooseFun(config[_chooseIndex + ""][1],config[_chooseIndex + ""][0]);
                     hide();
                  });
               }
               return;
            }
            if(this.totalAbility - this._petInfo[this.config[this._chooseIndex + ""][2]] + this._addNum > 510)
            {
               Alarm.show("你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(this._petInfo.id) + "</font>的学习力总值不能超过510，无法注入哦！");
            }
            else if(this._addNum < 255)
            {
               Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "提升" + this._addNum + "点吗？",function():void
               {
                  _chooseFun(config[_chooseIndex + ""][1],config[_chooseIndex + ""][0]);
                  hide();
               });
            }
            else
            {
               Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "直接提升至255吗？",function():void
               {
                  _chooseFun(config[_chooseIndex + ""][1],config[_chooseIndex + ""][0]);
                  hide();
               });
            }
         }
      }
      
      private function get totalAbility() : int
      {
         var total:int = 0;
         var i:int = 0;
         while(i < 6)
         {
            total += this._petInfo[this.config[i + ""][2]];
            i++;
         }
         return total;
      }
      
      private function get ui() : LearningabilityChooseUI
      {
         return _ui as LearningabilityChooseUI;
      }
   }
}


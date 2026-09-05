package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.events.MouseEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LearningabilityInjectNewPanel extends SimpleModule
   {
      
      private var _chooseFun:Function;
      
      private var _petName:String;
      
      private var _chooseIndex:int = -1;
      
      private var _injectNum:int;
      
      private var _petInfo:PetInfo;
      
      private var config:Object = {
         "0":["攻击学习力",1,"ev_attack"],
         "1":["特攻学习力",3,"ev_sa"],
         "2":["速度学习力",5,"ev_sp"],
         "3":["防御学习力",2,"ev_defence"],
         "4":["特防学习力",4,"ev_sd"],
         "5":["体力学习力",0,"ev_hp"]
      };
      
      public function LearningabilityInjectNewPanel()
      {
         super();
      }
      
      override public function init(data:Object = null) : void
      {
         this._chooseFun = data["fun"] as Function;
         this._petName = data["name"];
         this._petInfo = data["petInfo"];
         this._injectNum = int(data["num"]);
         KTool.showScore(_ui["num1"],data.num);
      }
      
      override public function setup() : void
      {
         _ui = new LearningabilityInjectNew();
         for(var i:int = 0; i < 6; i++)
         {
            this.addChooseBtnEvent(i);
         }
         addMoudleEvent(this.ui.okBtn,MouseEvent.CLICK,this.onOkbtnClick);
      }
      
      override public function show() : void
      {
         SocketConnection.send(1022,86056791);
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
         for(var i:int = 0; i < 6; i++)
         {
            if(i == this._chooseIndex)
            {
               this.ui["btn" + i].gotoAndStop(2);
               KTool.setButtonMode(this.ui["btn" + i],false);
            }
            else
            {
               this.ui["btn" + i].gotoAndStop(1);
               KTool.setButtonMode(this.ui["btn" + i],true);
            }
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
         var addNum:int = 0;
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
            addNum = this._injectNum + this._petInfo[this.config[this._chooseIndex + ""][2]] <= 255 ? this._injectNum : int(255 - this._petInfo[this.config[this._chooseIndex + ""][2]]);
            if(this.totalAbility + addNum > 510)
            {
               Alarm.show("你的<font color=\'#ff0000\'>" + PetXMLInfo.getName(this._petInfo.id) + "</font>的学习力总值不能超过510，无法注入哦！");
            }
            else if(this._injectNum == 50)
            {
               Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "直接提升50点吗？",function():void
               {
                  _chooseFun(config[_chooseIndex + ""][1],config[_chooseIndex + ""][0]);
                  hide();
               });
            }
            else
            {
               Alert.show("确定要将精灵的" + TextFormatUtil.getRedTxt(this.config[this._chooseIndex][0]) + "直接提升20点吗？",function():void
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
         for(var i:int = 0; i < 6; i++)
         {
            total += this._petInfo[this.config[i + ""][2]];
         }
         return total;
      }
      
      private function get ui() : LearningabilityInjectNew
      {
         return _ui as LearningabilityInjectNew;
      }
   }
}


package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import flash.events.MouseEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LearningabilityInjectPanel extends SimpleModule
   {
      
      private var _chooseFun:Function;
      
      private var _petName:String;
      
      private var _chooseIndex:int = -1;
      
      private var _petInfo:PetInfo;
      
      private var config:Object = {
         "0":["攻击学习力",1,"ev_attack"],
         "1":["特攻学习力",3,"ev_sa"],
         "2":["速度学习力",5,"ev_sp"],
         "3":["防御学习力",2,"ev_defence"],
         "4":["特防学习力",4,"ev_sd"],
         "5":["体力学习力",0,"ev_hp"]
      };
      
      private var _funcClose:Function;
      
      public function LearningabilityInjectPanel()
      {
         super();
      }
      
      override public function init(data:Object = null) : void
      {
         this._chooseFun = data["fun"] as Function;
         this._petName = data["name"];
         this._petInfo = data["petInfo"];
         this._funcClose = data["closeFunc"];
         _ui.Title.gotoAndStop(data.titletype);
         this.UpdataType(data);
      }
      
      private function UpdataType(data:Object) : void
      {
         switch(data.titletype)
         {
            case 0:
               break;
            case 1:
               if(data.time < 10)
               {
                  if(Boolean(data.isWin))
                  {
                     KTool.showScore(_ui.Title["num1"],30,0,true);
                  }
                  else
                  {
                     KTool.showScore(_ui.Title["num1"],20,0,true);
                  }
                  KTool.showScore(_ui.Title["num2"],10);
               }
               else if(data.time == 10)
               {
                  if(Boolean(data.isWin))
                  {
                     KTool.showScore(_ui.Title["num1"],70);
                  }
                  else
                  {
                     KTool.showScore(_ui.Title["num1"],50);
                  }
                  KTool.showScore(_ui.Title["num2"],20);
               }
               else if(data.time == 11)
               {
                  KTool.showScore(_ui.Title["num1"],50);
                  _ui.Title["mcNoNo"].visible = false;
                  _ui.Title["num2"].visible = false;
               }
               break;
            case 2:
               KTool.showScore(_ui.Title["num1"],50,0,true);
         }
      }
      
      override protected function onClose(e:*) : void
      {
         this.hide();
         if(this._funcClose != null)
         {
            this._funcClose.apply();
         }
      }
      
      override public function setup() : void
      {
         _ui = new Learningability_inject_ui();
         for(var i:int = 0; i < 6; i++)
         {
            this.addChooseBtnEvent(i);
         }
         addMoudleEvent(_ui.okBtn,MouseEvent.CLICK,this.onOkbtnClick);
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
               _ui["btn" + i].gotoAndStop(2);
               KTool.setButtonMode(_ui["btn" + i],false);
            }
            else
            {
               _ui["btn" + i].gotoAndStop(1);
               KTool.setButtonMode(_ui["btn" + i],true);
            }
         }
      }
      
      private function addChooseBtnEvent(i:int) : void
      {
         addMoudleEvent(_ui["btn" + i],MouseEvent.CLICK,function(e:*):void
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
            this._chooseFun(this.config[this._chooseIndex + ""][1],this.config[this._chooseIndex + ""][0]);
            this.hide();
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
   }
}


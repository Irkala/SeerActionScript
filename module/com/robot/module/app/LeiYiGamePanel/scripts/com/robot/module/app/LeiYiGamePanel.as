package com.robot.module.app
{
   import com.robot.app.fight.FightManager;
   import com.robot.app.petbag.PetBagControllerNew;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.CommandID;
   import com.robot.core.controller.NewSeerTaskController;
   import com.robot.core.dispatcher.FightDispatcher;
   import com.robot.core.event.PetFightEvent;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.mode.BaseModule;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alarm2;
   import com.robot.core.utils.CommonUI;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LeiYiGamePanel extends BaseModule
   {
      
      private var _today:Array;
      
      private var _current:Array;
      
      private var _total:Array;
      
      public function LeiYiGamePanel()
      {
         super();
         resUrl = "2016/0122/LeiYiGamePanel";
      }
      
      private function addEvent() : void
      {
         if(_ui == null)
         {
            return;
         }
         eventCom.addClickEvent(_ui,this.clickHandle);
         for(var i:int = 0; i < 6; i++)
         {
            this.setArtNum(_ui["num_" + i],this._current[i],this._total[i]);
         }
      }
      
      private function clickHandle(e:MouseEvent) : void
      {
         var index:int = 0;
         var catchTime:uint = 0;
         var petinfo:PetInfo = null;
         var ename:String = e.target.name;
         if(ename.indexOf("btn_") != -1)
         {
            index = int(uint(ename.split("_")[1]));
            if(this._current[index] >= this._total[index])
            {
               Alarm.show("你已经完成了该项特训！");
               return;
            }
            catchTime = uint(PetManager.defaultTime);
            petinfo = PetManager.getPetInfo(catchTime);
            if(Boolean(petinfo) && petinfo.id == 70)
            {
               this.hide();
               FightDispatcher.addEventListener(PetFightEvent.ALARM_CLICK,function(e:PetFightEvent):void
               {
                  var skilltips:Array = null;
                  FightDispatcher.removeEventListener(PetFightEvent.ALARM_CLICK,arguments.callee);
                  ModuleManager.showAppModule("LeiYiGamePanel");
                  if(Boolean(FightManager.isWin) && index > 5)
                  {
                     skilltips = ["极光刃","闪电斗气","元气电光球","雷神觉醒"];
                     Alarm2.show("恭喜你成功学会了新技能：" + skilltips[index - 6]);
                  }
               });
               FightManager.fightNoMapBoss("",10187 + index);
            }
            else
            {
               Alarm.show("请先将拥有雷神之翼的雷伊设为首发！",function():void
               {
                  PetBagControllerNew.showByBuffer();
               });
            }
            return;
         }
         switch(ename)
         {
            case "close":
               this.hide();
               break;
            case "bag":
               PetBagControllerNew.showByBuffer();
               break;
            case "cure":
               PetManager.cureAllFree();
         }
      }
      
      private function setArtNum(mc:TextField, m:uint, s:uint) : void
      {
         if(mc == null)
         {
            return;
         }
         mc.text = m.toString() + "/" + s.toString();
      }
      
      override public function show() : void
      {
         super.show();
         SocketConnection.addCmdListener(CommandID.LEIYI_TRAIN_GET_STATUS,function(e:SocketEvent):void
         {
            var by:ByteArray;
            var i:uint;
            SocketConnection.removeCmdListener(CommandID.LEIYI_TRAIN_GET_STATUS,arguments.callee);
            _today = [];
            _current = [];
            _total = [];
            by = e.data as ByteArray;
            for(i = 0; i < 6; i++)
            {
               _today.push(by.readUnsignedInt());
               _current.push(by.readUnsignedInt());
               _total.push(by.readUnsignedInt());
            }
            KTool.getMultiValue([15870,15871,15872,15873,15874,15875,6909],function(arr:Array):void
            {
               _today = arr;
               var allover:Boolean = true;
               for(var j:int = 0; j < 10; j++)
               {
                  if(j >= 6)
                  {
                     CommonUI.setEnabled(_ui["btn_" + j],KTool.getBit(arr[6],j - 5) == 0);
                     if(KTool.getBit(arr[6],j - 5) == 0)
                     {
                        allover = false;
                     }
                  }
                  else if(_current[j] < _total[j])
                  {
                     allover = false;
                  }
               }
               addEvent();
               if(allover)
               {
                  if(NewSeerTaskController.isNewSeer)
                  {
                     hide();
                     ModuleManager.showAppModule("LeyiTrainNewPanel");
                  }
                  Alarm2.show("恭喜你完成了全部特训内容！");
               }
            });
         });
         SocketConnection.send(CommandID.LEIYI_TRAIN_GET_STATUS,PetManager.defaultTime);
      }
      
      override public function hide() : void
      {
         super.hide();
      }
   }
}


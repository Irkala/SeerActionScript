package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.app2.component.TimeComponent;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.StatManager;
   import com.robot.core.mode.BaseModule;
   import com.robot.core.utils.CommonUI;
   import flash.events.MouseEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class WheelChoiceReadPanel extends BaseModule
   {
      
      private var _isInit:Boolean;
      
      private var _tab:int = 1;
      
      private var _readState:Array;
      
      private var _reading:Boolean;
      
      private var _readSecond:int;
      
      private var _maxNum:int = 6;
      
      public function WheelChoiceReadPanel()
      {
         super();
         resUrl = "2015/1211/WheelChoiceRead_UI";
      }
      
      override public function show() : void
      {
         super.show();
         eventCom.addClickEvent(_ui,this.onClick);
         for(var i:int = 1; i <= this._maxNum; i++)
         {
            eventCom.addClickEvent(_ui["btns_" + i],this.onTab);
            _ui["btns_" + i].gotoAndStop(1);
            _ui["btns_" + i].buttonMode = true;
         }
         addComponent(new TimeComponent(_ui,this.onTime,1000));
         this.update();
         _ui["mc"].stop();
         StatManager.sendStat2014("1211命运之轮重做预告","打开生存法则面板",StatManager.RUN_ACT_2015);
      }
      
      private function onTab(e:MouseEvent) : void
      {
         var index:int = int(String(e.currentTarget.name).split("_")[1]);
         this.tab = index;
      }
      
      private function set tab(value:int) : void
      {
         for(var i:int = 1; i <= this._maxNum; i++)
         {
            if(i == value)
            {
               _ui["btns_" + i].gotoAndStop(2);
            }
            else
            {
               _ui["btns_" + i].gotoAndStop(1);
            }
         }
         this._tab = value;
         _ui["mc"].gotoAndStop(value);
         if(!this._readState[this._tab - 1])
         {
            this._readSecond = 30;
         }
         this._reading = !this._readState[this._tab - 1];
         _ui["txt_1"].text = "";
         _ui["btn_enter"].visible = !this._readState[this._tab - 1];
         CommonUI.setEnabled(_ui["btn_enter"],false);
      }
      
      private function update(e:* = null) : void
      {
         this._isInit = false;
         KTool.getMultiValue([8123],function(f:Array):void
         {
            _readState = [KTool.getBit(f[0],1) > 0,KTool.getBit(f[0],2) > 0,KTool.getBit(f[0],3) > 0,KTool.getBit(f[0],4) > 0,KTool.getBit(f[0],5) > 0,KTool.getBit(f[0],6) > 0];
            tab = _tab;
            _isInit = true;
         });
      }
      
      private function onTime(time:Number = 0) : void
      {
         if(this._reading)
         {
            --this._readSecond;
            if(this._readSecond < 0)
            {
               _ui["txt_1"].text = "";
               this._reading = false;
               CommonUI.setEnabled(_ui["btn_enter"],true);
               return;
            }
            _ui["txt_1"].text = this._readSecond + "秒后即可领取奖励";
         }
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(e.target.name == "close")
         {
            hide();
            ModuleManager.showAppModule("WheelChoicePanel");
            return;
         }
         if(!this._isInit)
         {
            return;
         }
         switch(e.target.name)
         {
            case "btn_enter":
               if(this._tab == 5)
               {
                  KTool.socketSendCallBack(4548,this.update,[1668,1]);
               }
               else if(this._tab == 6)
               {
                  KTool.socketSendCallBack(4548,this.update,[2733,1]);
               }
               else
               {
                  KTool.socketSendCallBack(4548,this.update,[1652 + this._tab - 1,1]);
               }
         }
      }
   }
}


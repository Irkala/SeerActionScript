package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.CommandID;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.mode.BaseModule;
   import com.robot.core.ui.alert.Alarm2;
   import com.robot.core.utils.CommonUI;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class WheelChoiceBulidPanel extends BaseModule
   {
      
      private var _mainUI:MovieClip;
      
      private var _maxNum:int = 3;
      
      private var _petIdArr:Array = [[0,0,3424]];
      
      private var _curPage:int = 1;
      
      public function WheelChoiceBulidPanel()
      {
         super();
         resUrl = "2015/1211/WheelChoiceBulidPanel";
      }
      
      override public function show() : void
      {
         this._mainUI = _ui;
         this.update(this.superShow);
      }
      
      private function superShow() : void
      {
         sendCmd(CommandID.ACTIVEACHIEVE,[25]);
         eventCom.addClickEvent(this._mainUI,this.onClick);
         for(var i:int = 0; i < this._maxNum; i++)
         {
            eventCom.addClickEvent(this._mainUI["getRewardBtn_" + i],this.onGetRewardBtnClick);
         }
         super.show();
      }
      
      private function onGetRewardBtnClick(event:MouseEvent) : void
      {
         var index:int = int(event.currentTarget.name.split("_")[1]);
         if(index == 2)
         {
            KTool.doExchange(10444,function():void
            {
               Alarm2.show("已获得“未来命运降临”成就！");
               update();
            });
         }
         else
         {
            KTool.doExchange(7819 + index,function():void
            {
               update();
            });
         }
      }
      
      private function onClick(evt:MouseEvent) : void
      {
         var index:int = int(evt.target.name.split("_")[1]);
         switch(evt.target.name)
         {
            case "closeBtn":
               hide();
               ModuleManager.showAppModule("WheelChoicePanel");
               break;
            case "preBtn":
            case "nextBtn":
               break;
            case "petTipsBtn_" + index:
               KTool.showPetInfoPanel(this._petIdArr[this._curPage - 1][index]);
         }
      }
      
      private function update(fun:Function = null) : void
      {
         KTool.getGlobalSubkeyValues(113,[1,2,3],function(va:Array):void
         {
            for(var i:int = 0; i < _maxNum; i++)
            {
               _mainUI["havePeopleTx_" + i].text = String(va[i]);
            }
         });
         KTool.getBitSet([236,235,9539],function(va:Array):void
         {
            var i:int;
            for(i = 0; i < _maxNum; i++)
            {
               if(va[i] > 0)
               {
                  CommonUI.setEnabled(_mainUI["getRewardBtn_" + i],true,false);
               }
               else
               {
                  CommonUI.setEnabled(_mainUI["getRewardBtn_" + i],false,true);
               }
            }
            KTool.getMultiValue([100327],function(va:Array):void
            {
               for(var i:int = 0; i < _maxNum; i++)
               {
                  if(Boolean(KTool.getBit(va[0],i + 1)))
                  {
                     _mainUI["flag_" + i].visible = true;
                     CommonUI.setEnabled(_mainUI["getRewardBtn_" + i],false,true);
                  }
                  else
                  {
                     _mainUI["flag_" + i].visible = false;
                  }
               }
            });
         });
         if(fun != null)
         {
            fun();
         }
      }
   }
}


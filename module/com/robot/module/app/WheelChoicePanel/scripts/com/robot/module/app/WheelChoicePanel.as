package com.robot.module.app
{
   import com.robot.app.mapProcess.MapProcess_10037;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.BitBuffSetClass;
   import com.robot.core.CommandID;
   import com.robot.core.animate.AnimateManager;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.MapEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.StatManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.mode.BaseModule;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm2;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class WheelChoicePanel extends BaseModule
   {
      
      private var _isInit:Boolean;
      
      private var _highLvArr:Array = [0,0,0];
      
      private var _surplusNumArr:Array = [0,0,0];
      
      public function WheelChoicePanel()
      {
         super();
         resUrl = "2015/1211/WheelChoice_UI";
      }
      
      override public function show() : void
      {
         if(MapManager.currentMap.id != 1151)
         {
            MapManager.changeMap(1151);
            hide();
            MapManager.addEventListener(MapEvent.MAP_SWITCH_COMPLETE,function(e:MapEvent):void
            {
               MapManager.removeEventListener(MapEvent.MAP_SWITCH_COMPLETE,arguments.callee);
               if(!BitBuffSetClass.getState(22994))
               {
                  AnimateManager.playFullScreenAnimate(ClientConfig.getFullMovie("WheelChoiceFull"),function():void
                  {
                     ModuleManager.showAppModule("WheelChoicePanel");
                     BitBuffSetClass.setState(22994,1);
                  });
               }
               else
               {
                  ModuleManager.showAppModule("WheelChoicePanel");
               }
            });
         }
         else if(!BitBuffSetClass.getState(22994))
         {
            AnimateManager.playFullScreenAnimate(ClientConfig.getFullMovie("WheelChoiceFull"),function():void
            {
               showPanel();
               BitBuffSetClass.setState(22994,1);
            });
         }
         else
         {
            this.showPanel();
         }
      }
      
      private function showPanel() : void
      {
         super.show();
         UserInfoManager.upDateMoreInfo(MainManager.actorInfo,this.update);
         eventCom.addClickEvent(_ui,this.onClick);
         for(var i:int = 1; i <= 3; i++)
         {
            _ui["btns_" + i].gotoAndStop(1);
            if(i == 4)
            {
               break;
            }
            eventCom.addClickEvent(_ui["btns_" + i],this.onClickTab);
            _ui["btns_" + i].buttonMode = true;
         }
         _ui["mc"].gotoAndStop(1);
         StatManager.sendStat2014("1218命运之轮又重做","打开主面板",StatManager.RUN_ACT_2015);
      }
      
      private function onClickTab(e:MouseEvent) : void
      {
         var index:int = int(String(e.currentTarget.name).split("_")[1]);
         this.tab = index;
      }
      
      private function set tab(value:int) : void
      {
         _ui["mc"].gotoAndStop(value);
         for(var i:int = 1; i <= 3; i++)
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
         if(_ui["mc"]["txt"] != null)
         {
            _ui["mc"]["txt"].text = String(this._highLvArr[value - 1]);
         }
         if(_ui["mc"]["numtxt"] != null)
         {
            _ui["mc"]["numtxt"].text = String(this._surplusNumArr[value - 1]);
         }
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(e.target.name == "close")
         {
            hide();
            return;
         }
         if(!this._isInit)
         {
            return;
         }
         switch(e.target.name)
         {
            case "btn_enter":
               this.enterWheel(1);
               break;
            case "btn_right":
               hide();
               ModuleManager.showAppModule("WheelChoiceReadPanel");
               break;
            case "mingYunBtn":
               hide();
               ModuleManager.showAppModule("WheelChoiceBulidPanel");
         }
      }
      
      private function update() : void
      {
         this._isInit = true;
         KTool.getMultiValue([100324,100326,4938],function(va:Array):void
         {
            for(var i:int = 0; i < 3; i++)
            {
               if(i == 1)
               {
                  if(va[i] > 0)
                  {
                     _highLvArr[i] = va[i] - 21;
                     if(_highLvArr[i] > 20)
                     {
                        _highLvArr[i] = 20;
                     }
                  }
                  else
                  {
                     _highLvArr[i] = 0;
                  }
               }
               else
               {
                  _highLvArr[i] = va[i];
               }
            }
            tab = 3;
         });
         KTool.getMultiValue([16440,16441,16644],function(va:Array):void
         {
            for(var i:int = 0; i < 3; i++)
            {
               if(MainManager.actorInfo.isVip)
               {
                  _surplusNumArr[i] = 3 - va[i];
               }
               else
               {
                  _surplusNumArr[i] = 2 - va[i];
               }
            }
            tab = 3;
         });
      }
      
      private function onMysteryClick(e:MouseEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.CHALLENGE_MYSTERY_SPACE,function(e:SocketEvent):void
         {
            var i:int = 0;
            SocketConnection.removeCmdListener(CommandID.CHALLENGE_MYSTERY_SPACE,arguments.callee);
            MapManager.changeLocalMap(10037);
            var by:ByteArray = e.data as ByteArray;
            MapProcess_10037._type = by.readUnsignedInt();
            MapProcess_10037._monCnt = by.readUnsignedInt();
            for(MapProcess_10037._monID = new Array(); i < MapProcess_10037._monCnt; )
            {
               MapProcess_10037._monID.push(by.readUnsignedInt());
               i++;
            }
            hide();
         });
         SocketConnection.send(CommandID.CHALLENGE_MYSTERY_SPACE);
      }
      
      private function enterWheel(stage:int) : void
      {
         if(_ui["mc"].currentFrame == 1)
         {
            if(this._surplusNumArr[0] > 0)
            {
               SocketConnection.addCmdListener(42215,function(e:SocketEvent):void
               {
                  SocketConnection.removeCmdListener(42215,arguments.callee);
                  MapManager.changeLocalMap(10036);
                  hide();
                  StatManager.sendStat2014("1218命运之轮又重做","点击进入尘封命运",StatManager.RUN_ACT_2015);
               });
               SocketConnection.send(42215,1,1,1);
            }
            else
            {
               Alarm2.show("挑战次数不足！");
            }
         }
         else if(_ui["mc"].currentFrame == 2)
         {
            if(this._surplusNumArr[1] > 0)
            {
               SocketConnection.addCmdListener(42215,function(e:SocketEvent):void
               {
                  SocketConnection.removeCmdListener(42215,arguments.callee);
                  MapManager.changeLocalMap(10036);
                  hide();
                  StatManager.sendStat2014("1218命运之轮又重做","点击进入全新命运",StatManager.RUN_ACT_2015);
               });
               SocketConnection.send(42215,1,1,2);
            }
            else
            {
               Alarm2.show("挑战次数不足！");
            }
         }
         else if(_ui["mc"].currentFrame == 3)
         {
            if(this._surplusNumArr[2] > 0)
            {
               SocketConnection.addCmdListener(42215,function(e:SocketEvent):void
               {
                  SocketConnection.removeCmdListener(42215,arguments.callee);
                  MapManager.changeLocalMap(10036);
                  hide();
                  StatManager.sendStat2014("1218命运之轮又重做","点击进入未来命运","贾斯汀太空站玩法");
               });
               SocketConnection.send(42215,1,1,3);
            }
            else
            {
               Alarm2.show("挑战次数不足！");
            }
         }
      }
   }
}


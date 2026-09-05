package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.info.SystemTimeInfo;
   import com.robot.core.info.task.MiningCountInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class GuoqingSignupPanel extends Sprite implements IModule
   {
      
      private var _mainUI:MovieClip;
      
      private var rewarded:Boolean;
      
      private var index:int;
      
      public function GuoqingSignupPanel()
      {
         super();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         this._mainUI = new UI_guoqingSignup();
      }
      
      public function show() : void
      {
         this.updatePanel(this.supershow);
      }
      
      private function updatePanel(func:Function = null) : void
      {
         if(this._mainUI == null)
         {
            return;
         }
         SocketConnection.addCmdListener(CommandID.SYSTEM_TIME,function(event:SocketEvent):void
         {
            var date:Date;
            var i:int = 0;
            SocketConnection.removeCmdListener(CommandID.SYSTEM_TIME,arguments.callee);
            date = (event.data as SystemTimeInfo).date;
            if(date.fullYear == 2018 && date.month == 9 && date.date >= 1 && date.date <= 7)
            {
               index = date.date - 1;
               SocketConnection.addCmdListener(2701,function(event:SocketEvent):void
               {
                  var byte:MiningCountInfo = event.data as MiningCountInfo;
                  rewarded = byte.miningCount == 1;
                  SocketConnection.removeCmdListener(2701,arguments.callee);
                  _mainUI["mc"].gotoAndStop(index + 1);
                  for(var i:int = 0; i < 7; i++)
                  {
                     _mainUI["mc_" + i].gotoAndStop(index == i ? 2 : 1);
                  }
                  _mainUI["sign"].enabled = _mainUI["sign"].mouseEnabled = !rewarded;
                  _mainUI["flag"].visible = rewarded;
                  if(func != null)
                  {
                     func();
                  }
               });
               SocketConnection.send(2701,index + 1503);
            }
            else
            {
               for(i = 0; i < 7; i++)
               {
                  _mainUI["mc_" + i].gotoAndStop(1);
               }
               _mainUI["mc"].gotoAndStop(8);
               _mainUI["sign"].visible = false;
               _mainUI["flag"].visible = false;
            }
            if(func != null)
            {
               func();
            }
         });
         SocketConnection.send(CommandID.SYSTEM_TIME);
      }
      
      private function supershow() : void
      {
         if(DisplayUtil.hasParent(this._mainUI))
         {
            return;
         }
         LevelManager.appLevel.addChild(this._mainUI);
         DisplayUtil.align(this._mainUI,null,AlignType.MIDDLE_CENTER);
         this._mainUI.addEventListener(MouseEvent.CLICK,this.clickHandle);
      }
      
      private function clickHandle(e:MouseEvent) : void
      {
         var ename:String = e.target.name;
         switch(ename)
         {
            case "close":
               this.hide();
               break;
            case "sign":
               SocketConnection.addCmdListener(2702,function(event:SocketEvent):void
               {
                  Alarm.show("领取成功");
                  SocketConnection.removeCmdListener(2702,arguments.callee);
                  updatePanel();
               });
               SocketConnection.send(2702,this.index + 1503);
         }
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._mainUI);
         this.removeEvent();
      }
      
      private function removeEvent() : void
      {
         this._mainUI.removeEventListener(MouseEvent.CLICK,this.clickHandle);
      }
      
      public function destroy() : void
      {
         this.hide();
         this._mainUI = null;
      }
   }
}


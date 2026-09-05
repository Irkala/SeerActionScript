package com.robot.module.app.nonoPanel
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.SystemTimerManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.effect.ColorFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NonoVipDailySignPanel extends Sprite implements IModule
   {
      
      private var today:int;
      
      private var _panel:MovieClip;
      
      private var _parent:DisplayObjectContainer;
      
      private var firstDay:int;
      
      private var todaySign:Boolean = false;
      
      private var signeddays:int;
      
      private var thisBee:Boolean = false;
      
      private var totalDay:int;
      
      public function NonoVipDailySignPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._panel);
         LevelManager.openMouseEvent();
      }
      
      private function freshInfo() : void
      {
         SocketConnection.addCmdListener(9298,this.onGetInfo);
         SocketConnection.send(9298);
      }
      
      public function setup() : void
      {
         this._panel = new NonoVipPanel_UI_Bee();
         KTool.initBenonoBtn(this._panel["beNonoBtn"]);
         this._panel["signBtn"].addEventListener(MouseEvent.CLICK,this.onSign);
         this._panel["getBtn"].addEventListener(MouseEvent.CLICK,this.onGetBee);
         this._panel["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         var _loc1_:Date = SystemTimerManager.sysDate;
         var _loc2_:int = _loc1_.fullYear;
         var _loc3_:int = _loc1_.month;
         var _loc4_:int = _loc1_.date;
         var _loc5_:int = _loc1_.day;
         var _loc6_:Date = new Date(_loc2_,_loc3_,1);
         this.firstDay = _loc6_.day;
         var _loc7_:Date = new Date(_loc2_,_loc3_ + 1,0);
         this.totalDay = _loc7_.date;
         this.today = _loc4_;
         this.initDay();
      }
      
      private function refreshInfoTxt() : void
      {
         this._panel["crtInfo"]["infoTxt_0"].text = "本月已累计签到" + this.signeddays + "天！";
         var _loc1_:int = this.signeddays * 1000 + 1000;
         if(this.todaySign)
         {
            this._panel["crtInfo"]["infoTxt_1"].text = "下次签到可获得" + _loc1_ + "经验值！";
         }
         else
         {
            this._panel["crtInfo"]["infoTxt_1"].text = "本次签到可获得" + _loc1_ + "经验值！";
         }
         if(this.thisBee)
         {
            this._panel["crtInfo"]["infoTxt_2"].text = "已领取本月小蜜蜂奖！";
         }
         else
         {
            this._panel["crtInfo"]["infoTxt_2"].text = "未领取本月小蜜蜂奖！";
         }
      }
      
      private function onGetBee(param1:MouseEvent) : void
      {
         var e:MouseEvent = param1;
         if(this.signeddays < 20)
         {
            Alarm.show("本月签到天数不够20天！");
            return;
         }
         SocketConnection.addCmdListener(9299,function():void
         {
            SocketConnection.removeCmdListener(9299,arguments.callee);
            var _loc2_:MovieClip = _panel["beeMon_" + SystemTimerManager.sysDate.month];
            _loc2_["bee"].visible = true;
            thisBee = true;
            refreshInfoTxt();
         });
         SocketConnection.send(9299);
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         ModuleManager.destroy(ClientConfig.getAppModule("/nonoPanel/NonoVipDailySignPanel"));
         this.hide();
      }
      
      public function destroy() : void
      {
         this.hide();
         KTool.destroyBenonoBtn(this._panel["beNonoBtn"]);
         this._panel["signBtn"].removeEventListener(MouseEvent.CLICK,this.onSign);
         this._panel["getBtn"].removeEventListener(MouseEvent.CLICK,this.onGetBee);
         this._panel["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         this._panel = null;
      }
      
      private function onGetInfo(param1:SocketEvent) : void
      {
         var _loc2_:int = 0;
         var _loc3_:MovieClip = null;
         var _loc4_:MovieClip = null;
         SocketConnection.removeCmdListener(9298,this.onGetInfo);
         var _loc5_:ByteArray = param1.data as ByteArray;
         var _loc6_:int = int(_loc5_.readUnsignedInt());
         this.signeddays = _loc5_.readUnsignedInt();
         var _loc7_:int = 0;
         while(_loc7_ < this.totalDay)
         {
            if(KTool.getBit(_loc6_,_loc7_ + 1))
            {
               _loc2_ = _loc7_ + this.firstDay + 1;
               _loc3_ = this._panel["main_mc"]["mon" + _loc2_];
               _loc3_.filters = [];
               _loc3_.gotoAndStop(2);
               if(_loc7_ + 1 == this.today)
               {
                  this.todaySign = true;
               }
            }
            _loc7_++;
         }
         var _loc8_:int = int(_loc5_.readUnsignedInt());
         var _loc9_:int = 0;
         while(_loc9_ < 12)
         {
            _loc4_ = this._panel["beeMon_" + _loc9_];
            KTool.showScore(_loc4_["mon"],_loc9_ + 1);
            if(KTool.getBit(_loc8_,_loc9_ + 1))
            {
               _loc4_["bee"].visible = true;
               if(SystemTimerManager.sysDate.month == _loc9_)
               {
                  this.thisBee = true;
               }
            }
            else
            {
               _loc4_["bee"].visible = false;
            }
            _loc9_++;
         }
         this.refreshInfoTxt();
      }
      
      private function initDay() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:MovieClip = this._panel["main_mc"];
         var _loc3_:int = 1;
         while(_loc3_ < 38)
         {
            _loc1_ = _loc2_.getChildByName("mon" + _loc3_) as MovieClip;
            if(_loc3_ < this.firstDay + 1 || _loc3_ > this.totalDay + this.firstDay)
            {
               _loc1_.visible = false;
            }
            else
            {
               _loc1_.visible = true;
               KTool.showScore(_loc1_["dayNum"],_loc3_ - this.firstDay);
               _loc1_.filters = [ColorFilter.setGrayscale()];
               _loc1_.gotoAndStop(1);
            }
            _loc3_++;
         }
      }
      
      private function signOver(param1:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(9297,this.signOver);
         this.todaySign = true;
         var _loc2_:MovieClip = this._panel["main_mc"]["mon" + (this.today + this.firstDay)];
         _loc2_.filters = [];
         _loc2_.gotoAndStop(2);
         var _loc3_:int = this.signeddays * 1000 + 1000;
         Alarm.show("恭喜你获得" + _loc3_ + "点经验！");
         ++this.signeddays;
         this.refreshInfoTxt();
      }
      
      private function onSign(param1:MouseEvent) : void
      {
         if(this.todaySign)
         {
            Alarm.show("今天已经签到过了！");
         }
         else
         {
            SocketConnection.addCmdListener(9297,this.signOver);
            SocketConnection.send(9297);
         }
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._panel);
         KTool.setAlignMid(this._panel,748,354);
         LevelManager.closeMouseEvent();
         this.freshInfo();
      }
   }
}


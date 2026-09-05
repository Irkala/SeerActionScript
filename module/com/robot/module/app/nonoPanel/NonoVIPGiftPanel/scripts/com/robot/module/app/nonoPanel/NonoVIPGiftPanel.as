package com.robot.module.app.nonoPanel
{
   import com.robot.app.control.GiftController;
   import com.robot.app.mapProcess.control.ColorfulPrivilegeWishController;
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.app2.control.VipController201408;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.info.task.MiningCountInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class NonoVIPGiftPanel extends Sprite implements IModule
   {
      
      private var _main:MovieClip;
      
      private var _count:uint = 0;
      
      private var _currentClickedBtn:MovieClip;
      
      public function NonoVIPGiftPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._main = new NonoVIPGiftPanel_UI();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         if(Boolean(this._main) && Boolean(DisplayUtil.hasParent(this._main)))
         {
            return;
         }
         this._count = 1;
         LevelManager.appLevel.addChild(this._main);
         this._main.x = this._main.y = 0;
         LevelManager.closeMouseEvent();
         KTool.initBenonoBtn(this._main["beNonoBtn"]);
         this._main["super_nono_rule"].addEventListener(MouseEvent.CLICK,this.onViewRule);
         this._main["extreme_nono_rule"].addEventListener(MouseEvent.CLICK,this.onViewRule);
         this._main["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._main["vipLevel"].gotoAndStop(MainManager.actorInfo.vipLevel);
         if(Boolean(MainManager.actorInfo.isVip) && VipController201408.getVipLeftDay() > 0)
         {
            this._main["leftTime"].text = String(VipController201408.getVipLeftDay());
         }
         else
         {
            this._main["leftTime"].text = "0";
         }
         if(MainManager.actorInfo.isVip)
         {
            this._main["NonoImage"].gotoAndStop(1);
            this._main["superNonoLevelTxt"].gotoAndStop(1);
         }
         else
         {
            this._main["NonoImage"].gotoAndStop(2);
            this._main["superNonoLevelTxt"].gotoAndStop(2);
         }
         if(Boolean(MainManager.actorInfo.isVip) || ColorfulPrivilegeWishController.bonusType == 2)
         {
            this._main["gift_btn_1"].visible = true;
            this._main["gift_btn_2"].visible = true;
         }
         else
         {
            this._main["gift_btn_1"].visible = false;
            this._main["gift_btn_2"].visible = false;
         }
         this._main["gift_btn_1"].buttonMode = true;
         (this._main["gift_btn_1"] as MovieClip).mouseChildren = false;
         this._main["gift_btn_1"].addEventListener(MouseEvent.CLICK,this.onGet);
         this._main["gift_btn_2"].buttonMode = true;
         (this._main["gift_btn_2"] as MovieClip).mouseChildren = false;
         this._main["gift_btn_2"].addEventListener(MouseEvent.CLICK,this.onGet);
         EventManager.addEventListener(GiftController.GET_GIFT_COMPLETE,this.onComplete);
         SocketConnection.addCmdListener(CommandID.TALK_COUNT,this.onCount);
         SocketConnection.send(CommandID.TALK_COUNT,this.param);
      }
      
      private function onClose(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function get param() : uint
      {
         if(!MainManager.actorInfo.isVip && ColorfulPrivilegeWishController._status == 2)
         {
            return 2021;
         }
         if(MainManager.actorInfo.isVip)
         {
            return 2020 + MainManager.actorInfo.vipLevel;
         }
         return 1004;
      }
      
      private function get param2() : uint
      {
         if(!MainManager.actorInfo.isVip && ColorfulPrivilegeWishController._status == 2)
         {
            return 2111;
         }
         if(MainManager.actorInfo.isVip)
         {
            return 2110 + MainManager.actorInfo.vipLevel;
         }
         return 1501;
      }
      
      private function onCount(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.TALK_COUNT,this.onCount);
         var oreCountInfo:MiningCountInfo = e.data as MiningCountInfo;
         var cnt:uint = uint(oreCountInfo.miningCount);
         (this._main["gift_btn_" + this._count] as MovieClip).gotoAndStop(cnt > 0 ? 2 : 1);
         (this._main["gift_btn_" + this._count] as MovieClip).mouseChildren = (this._main["gift_btn_" + this._count] as MovieClip).mouseEnabled = cnt > 0 ? false : true;
         ++this._count;
         if(this._count <= 2)
         {
            SocketConnection.addCmdListener(CommandID.TALK_COUNT,this.onCount);
            SocketConnection.send(CommandID.TALK_COUNT,this.param2);
         }
      }
      
      public function hide() : void
      {
         if(Boolean(this._main))
         {
            DisplayUtil.removeForParent(this._main);
            this._main["gift_btn_1"].removeEventListener(MouseEvent.CLICK,this.onGet);
            this._main["gift_btn_2"].removeEventListener(MouseEvent.CLICK,this.onGet);
            this._main["super_nono_rule"].removeEventListener(MouseEvent.CLICK,this.onViewRule);
            this._main["extreme_nono_rule"].removeEventListener(MouseEvent.CLICK,this.onViewRule);
            KTool.destroyBenonoBtn(this._main["beNonoBtn"]);
            this._main["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         }
         LevelManager.openMouseEvent();
         EventManager.removeEventListener(GiftController.GET_GIFT_COMPLETE,this.onComplete);
         SocketConnection.removeCmdListener(CommandID.TALK_COUNT,this.onCount);
      }
      
      private function onGet(e:MouseEvent) : void
      {
         this._currentClickedBtn = e.currentTarget as MovieClip;
         if(this._currentClickedBtn.name == "gift_btn_1")
         {
            GiftController.tabIndex = 0;
            if(MainManager.actorInfo.isVip)
            {
               GiftController.getWeekGiftNew();
            }
            else if(ColorfulPrivilegeWishController.bonusType == 2)
            {
               GiftController.getWeekGiftNew();
            }
            else
            {
               GiftController.getNormalWeekGift();
            }
         }
         else if(this._currentClickedBtn.name == "gift_btn_2")
         {
            GiftController.tabIndex = 1;
            if(MainManager.actorInfo.isVip)
            {
               GiftController.getMonthGiftNew();
            }
            else if(ColorfulPrivilegeWishController.bonusType == 2)
            {
               GiftController.getMonthGiftNew();
            }
            else
            {
               GiftController.getMonthNormalGift();
            }
         }
      }
      
      private function onViewRule(e:MouseEvent) : void
      {
         switch(e.currentTarget.name)
         {
            case "super_nono_rule":
               ModuleManager.showModule(ClientConfig.getAppModule("nonoPanel/SuperNoNoUpgradeRulePanel"),"正在打开...");
               break;
            case "extreme_nono_rule":
               ModuleManager.showModule(ClientConfig.getAppModule("xingLingWang/SuperNoNoIntro"));
         }
      }
      
      private function onComplete(e:Event) : void
      {
         if(Boolean(this._currentClickedBtn))
         {
            this._currentClickedBtn.gotoAndStop(2);
            this._currentClickedBtn.mouseChildren = this._currentClickedBtn.mouseEnabled = false;
            this._currentClickedBtn = null;
         }
      }
      
      public function destroy() : void
      {
         this._main = null;
      }
   }
}


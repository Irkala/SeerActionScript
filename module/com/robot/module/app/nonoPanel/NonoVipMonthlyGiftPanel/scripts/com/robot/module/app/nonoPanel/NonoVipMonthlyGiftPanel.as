package com.robot.module.app.nonoPanel
{
   import com.robot.app.control.GiftController;
   import com.robot.app.mapProcess.control.ColorfulPrivilegeWishController;
   import com.robot.app.task.petstory.util.KTool;
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
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class NonoVipMonthlyGiftPanel extends Sprite implements IModule
   {
      
      private var _main:MovieClip;
      
      private var _count:uint = 1;
      
      private var _currentClickedBtn:MovieClip;
      
      public function NonoVipMonthlyGiftPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._main = new monthly_gift_ui();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         var i:uint = 0;
         GiftController.tabIndex = 1;
         GiftController.pageIndex = 1;
         this._count = 1;
         for(i = 1; i < 6; i++)
         {
            this._main["enable_flg_" + i].visible = false;
         }
         LevelManager.appLevel.addChild(this._main);
         DisplayUtil.align(this._main,null,AlignType.MIDDLE_CENTER);
         LevelManager.closeMouseEvent();
         KTool.initBenonoBtn(this._main["beNonoBtn"]);
         this._main["gift_btn_1"].visible = false;
         this._main["gift_btn_1"].addEventListener(MouseEvent.CLICK,this.onGet);
         (this._main["gift_btn_1"] as MovieClip).mouseChildren = false;
         this._main["gift_btn_1"].buttonMode = true;
         this._main["gift_btn_1"].addEventListener(MouseEvent.CLICK,this.onGet);
         this._main["super_nono_rule"].addEventListener(MouseEvent.CLICK,this.onViewRule);
         this._main["extreme_nono_rule"].addEventListener(MouseEvent.CLICK,this.onViewRule);
         this._main["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._main["txt_info"].text = KTool.formatString("超NO每月礼包更加诱人哟，还有无敌精灵胶囊免费领取！你当前的超NO等级为：{0}",MainManager.actorInfo.vipLevel);
         this._main["txt_info"].width = this._main["txt_info"].textWidth + 10;
         EventManager.addEventListener(GiftController.GET_GIFT_COMPLETE,this.onComplete);
         for(i = 1; i < 6; i++)
         {
            if(MainManager.actorInfo.isVip)
            {
               if(i == MainManager.actorInfo.vipLevel)
               {
                  this._main["enable_flg_" + i].visible = true;
               }
               else
               {
                  this._main["enable_flg_" + i].visible = false;
               }
            }
            else
            {
               this._main["enable_flg_" + i].visible = false;
            }
         }
         if(ColorfulPrivilegeWishController.bonusType == 2)
         {
            this._main["enable_flg_1"].visible = true;
         }
         for(i = 1; i < 6; i++)
         {
            if(Boolean(this._main["enable_flg_" + i].visible))
            {
               this._main["gift_btn_1"].visible = true;
               break;
            }
         }
         SocketConnection.addCmdListener(CommandID.TALK_COUNT,this.onCount);
         SocketConnection.send(CommandID.TALK_COUNT,1501);
      }
      
      private function get param() : uint
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
         ++this._count;
         if(this._count < 2)
         {
            SocketConnection.addCmdListener(CommandID.TALK_COUNT,this.onCount);
            SocketConnection.send(CommandID.TALK_COUNT,this.param);
         }
      }
      
      private function onGet(e:MouseEvent) : void
      {
         this._currentClickedBtn = e.currentTarget as MovieClip;
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
      
      private function onClose(e:MouseEvent) : void
      {
         this.hide();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this._main);
         LevelManager.openMouseEvent();
         this._main["gift_btn_1"].removeEventListener(MouseEvent.CLICK,this.onGet);
         this._main["super_nono_rule"].removeEventListener(MouseEvent.CLICK,this.onViewRule);
         this._main["extreme_nono_rule"].removeEventListener(MouseEvent.CLICK,this.onViewRule);
         SocketConnection.removeCmdListener(CommandID.TALK_COUNT,this.onCount);
         this._main["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         EventManager.removeEventListener(GiftController.GET_GIFT_COMPLETE,this.onComplete);
      }
      
      private function onViewRule(e:MouseEvent) : void
      {
         switch(e.currentTarget.name)
         {
            case "super_nono_rule":
               ModuleManager.showModule(ClientConfig.getAppModule("nonoPanel/SuperNoNoUpgradeRulePanel"));
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
            this._currentClickedBtn = null;
         }
      }
      
      public function destroy() : void
      {
         this._main = null;
      }
   }
}


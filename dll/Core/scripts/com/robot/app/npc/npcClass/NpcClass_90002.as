package com.robot.app.npc.npcClass
{
   import com.robot.app.fightNote.FightInviteManager;
   import com.robot.core.event.NpcEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.mode.NpcModel;
   import com.robot.core.npc.INpc;
   import com.robot.core.npc.NPC;
   import com.robot.core.npc.NpcDialog;
   import com.robot.core.npc.NpcInfo;
   import com.robot.core.ui.alert.Alert;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   
   public class NpcClass_90002 implements INpc
   {
      
      private var _curNpcModel:NpcModel;
      
      public function NpcClass_90002(param1:NpcInfo, param2:DisplayObject)
      {
         super();
         this._curNpcModel = new NpcModel(param1,param2 as Sprite);
         this._curNpcModel.addEventListener(NpcEvent.NPC_CLICK,this.onClickNpc);
         this._curNpcModel.direction = "down";
         if(MainManager.actorInfo.mapID == 461)
         {
            this._curNpcModel.hide();
         }
         else
         {
            this._curNpcModel.visible = true;
         }
      }
      
      private function onClickNpc(param1:NpcEvent) : void
      {
         this._curNpcModel.refreshTask();
         if(MainManager.actorInfo.mapID == 461)
         {
            NpcDialog.show(NPC.ERDANGJIA,["这里是赫鲁卡城，想挑战我的话就尽管放马过来吧！"],["来吧，二当家！","下次再说"],[this.fight,this.nofight]);
         }
         else
         {
            NpcDialog.show(90006,["哎呀！被你发现了，圣诞快乐，孩子！我是神秘的圣诞老人，这次是特地带了很多礼物来看你！不过，在给你礼物前让我看看你的实力吧！"],["没问题，来吧！","不理会"],[this.fight,this.nofight]);
         }
      }
      
      private function fight() : void
      {
         if(MainManager.actorInfo.mapID == 461)
         {
            FightInviteManager.fightWithBoss("二当家",0);
         }
         else if(MainManager.actorInfo.mapID == 107)
         {
            FightInviteManager.fightWithBoss("圣诞快乐",0);
         }
      }
      
      private function nofight() : void
      {
         if(MainManager.actorInfo.mapID == 107)
         {
            Alert.show("呵呵呵！胆小鬼！");
         }
      }
      
      public function destroy() : void
      {
         if(Boolean(this._curNpcModel))
         {
            this._curNpcModel.removeEventListener(NpcEvent.NPC_CLICK,this.onClickNpc);
            this._curNpcModel.destroy();
            this._curNpcModel = null;
         }
      }
      
      public function get npc() : NpcModel
      {
         return this._curNpcModel;
      }
   }
}


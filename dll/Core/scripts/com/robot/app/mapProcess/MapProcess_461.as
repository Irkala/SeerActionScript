package com.robot.app.mapProcess
{
   import com.robot.app.fightNote.FightInviteManager;
   import com.robot.app.toolBar.ToolBarController;
   import com.robot.core.manager.map.config.BaseMapProcess;
   import com.robot.core.mode.ActorModel;
   import com.robot.core.npc.NPC;
   import com.robot.core.npc.NpcDialog;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class MapProcess_461 extends BaseMapProcess
   {
      
      private var model:ActorModel;
      
      private var edj_npc:MovieClip;
      
      private var treeMc:MovieClip;
      
      public function MapProcess_461()
      {
         super();
      }
      
      override protected function init() : void
      {
         ToolBarController.showOrHideAllUser(false);
         this.edj_npc = depthLevel["erdangjia"];
         this.edj_npc.visible = true;
         this.edj_npc.buttonMode = true;
         this.edj_npc.addEventListener(MouseEvent.CLICK,this.onEdjClick);
         this.conLevel["taskMC"].visible = false;
         this.conLevel["dumpLightMc0"].visible = false;
         this.conLevel["dumpLightMc1"].visible = false;
         this.conLevel["dumpLightMc2"].visible = false;
         this.conLevel["dumpLightMc3"].visible = false;
         this.conLevel["dumpLightMc4"].visible = false;
         this.conLevel["task_561_2"].visible = false;
         this.conLevel["task_561_4"].visible = false;
         this.topLevel["task_561_1"].visible = false;
         this.treeMc = this.topLevel["tree"] as MovieClip;
         this.treeMc.stop();
         this.treeMc.addEventListener(Event.ENTER_FRAME,this.onTreeFrame);
         this.treeMc.gotoAndPlay(1);
      }
      
      private function onEdjClick(param1:MouseEvent) : void
      {
         NpcDialog.show(NPC.ERDANGJIA,["这里是赫鲁卡城，想挑战我的话就尽管放马过来吧！"],["来吧，二当家！","下次再说"],[this.onEdjFight,function():void
         {
         }]);
      }
      
      private function onEdjFight() : void
      {
         FightInviteManager.fightWithBoss("二当家",0);
      }
      
      private function onTreeFrame(param1:Event) : void
      {
         var _loc2_:MovieClip = param1.currentTarget as MovieClip;
         if(_loc2_.currentFrame == _loc2_.totalFrames || _loc2_.currentFrame == 3)
         {
            _loc2_.gotoAndPlay(1);
         }
      }
      
      override public function destroy() : void
      {
         ToolBarController.showOrHideAllUser(true);
         if(Boolean(this.edj_npc))
         {
            this.edj_npc.removeEventListener(MouseEvent.CLICK,this.onEdjClick);
            this.edj_npc = null;
         }
         if(Boolean(this.treeMc))
         {
            this.treeMc.removeEventListener(Event.ENTER_FRAME,this.onTreeFrame);
            this.treeMc = null;
         }
      }
   }
}


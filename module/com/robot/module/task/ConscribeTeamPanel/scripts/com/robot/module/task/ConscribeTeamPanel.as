package com.robot.module.task
{
   import com.robot.app.task.conscribeTeam.ConscribeTeam;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class ConscribeTeamPanel extends Sprite implements IModule
   {
      
      private var _giveUp_btn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      private var _cici_txt:MovieClip;
      
      private var renwu1_mc:MovieClip;
      
      private var _goOn_btn:SimpleButton;
      
      private var renwu0_mc:MovieClip;
      
      public function ConscribeTeamPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         DisplayUtil.removeForParent(mainUI);
         _close_btn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _giveUp_btn.removeEventListener(MouseEvent.CLICK,giveUpHandler);
         _goOn_btn.removeEventListener(MouseEvent.CLICK,closeHandler);
         mainUI = null;
         _close_btn = null;
         _goOn_btn = null;
         _giveUp_btn = null;
         _cici_txt = null;
         renwu0_mc = null;
         renwu1_mc = null;
      }
      
      public function hide() : void
      {
         _cici_txt.visible = false;
         renwu0_mc.visible = false;
         renwu1_mc.visible = false;
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
         hasFileTool();
         hasKillM();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function giveUpHandler(e:MouseEvent) : void
      {
         Answer.show("你确定要放弃这个任务吗？",function():void
         {
            TasksManager.quit(ConscribeTeam.TASK_ID,function(b:Boolean):void
            {
               if(b)
               {
                  Alarm.show("你已经成功放弃了该任务！");
                  hide();
                  ConscribeTeam.delIcon();
               }
            });
         });
      }
      
      private function isShowTxt() : void
      {
         if(renwu0_mc.visible == true && renwu1_mc.visible == true)
         {
            _goOn_btn.visible = false;
            _giveUp_btn.visible = false;
            _cici_txt.visible = true;
         }
      }
      
      private function hasFileTool() : void
      {
         ItemManager.addEventListener(ItemEvent.CLOTH_LIST,hasFile);
         ItemManager.getCloth();
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function hasKillM() : void
      {
         if(TasksManager.getTaskStatus(301) == 3)
         {
            renwu1_mc.visible = true;
            isShowTxt();
            TasksManager.getProStatus(ConscribeTeam.TASK_ID,1,function(b:Boolean):void
            {
               if(!b)
               {
                  TasksManager.complete(ConscribeTeam.TASK_ID,1);
               }
            });
         }
      }
      
      private function hasFile(e:ItemEvent) : void
      {
         var i:int;
         var closeId:uint;
         var array:Array;
         ItemManager.removeEventListener(ItemEvent.CLOTH_LIST,hasFile);
         closeId = 100044;
         array = ItemManager.getClothIDs();
         for(i = 0; i < array.length; i++)
         {
            if(array[i] == 100044)
            {
               renwu0_mc.visible = true;
               hasKillM();
               TasksManager.getProStatus(ConscribeTeam.TASK_ID,0,function(b:Boolean):void
               {
                  if(!b)
                  {
                     TasksManager.complete(ConscribeTeam.TASK_ID,0);
                  }
               });
               return;
            }
         }
      }
      
      public function setup() : void
      {
         mainUI = new ConscribeTeamUI_ConscribeTeam();
         _close_btn = mainUI["close_btn"];
         _goOn_btn = mainUI["goOn_btn"];
         _giveUp_btn = mainUI["giveUp_btn"];
         _cici_txt = mainUI["cici_txt"];
         renwu0_mc = mainUI["renwu0_mc"];
         renwu1_mc = mainUI["renwu1_mc"];
         renwu0_mc.visible = false;
         renwu1_mc.visible = false;
         _cici_txt.visible = false;
         _close_btn.addEventListener(MouseEvent.CLICK,closeHandler);
         _giveUp_btn.addEventListener(MouseEvent.CLICK,giveUpHandler);
         _goOn_btn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
   }
}


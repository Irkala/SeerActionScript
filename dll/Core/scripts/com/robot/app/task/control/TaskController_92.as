package com.robot.app.task.control
{
   import com.robot.core.animate.*;
   import com.robot.core.config.*;
   import com.robot.core.manager.*;
   import com.robot.core.mode.*;
   import com.robot.core.npc.*;
   import flash.display.InteractiveObject;
   import flash.display.MovieClip;
   
   public class TaskController_92
   {
      
      private static var icon:InteractiveObject;
      
      private static var lightMC:MovieClip;
      
      private static var _showFun:Function;
      
      public static const TASK_ID:uint = 92;
      
      private static var panel:AppModel = null;
      
      private static var panel1:AppModel = null;
      
      public function TaskController_92()
      {
         super();
      }
      
      public static function showPanel() : void
      {
         if(panel == null)
         {
            panel = new AppModel(ClientConfig.getTaskModule("TaskPanel_92"),"正在打开任务信息");
            panel.setup();
         }
         panel.show();
      }
      
      public static function showNPC(param1:Function) : void
      {
         var showFun:Function = param1;
         _showFun = function():void
         {
            showFun();
            NpcDialog.show(NPC.SEER,["派特博士！雷蒙教官！还有大家！#4"],["大家都来了"],[function():void
            {
               NpcDialog.show(NPC.SHIPER,["让我们大家一起齐心协力帮助贾斯汀回来吧！"],["嗯嗯嗯嗯"],[function():void
               {
                  TasksManager.complete(92,0,null,true);
               }]);
            }]);
         };
      }
      
      public static function showPanel1() : void
      {
         if(Boolean(panel1))
         {
            panel1.destroy();
            panel1 = null;
         }
         if(panel1 == null)
         {
            panel1 = new AppModel(ClientConfig.getTaskModule("TaskPanel0_92"),"正在打开任务信息");
            panel1.setup();
            panel1.show();
         }
         else
         {
            panel1.show();
         }
      }
      
      public static function setup() : void
      {
      }
      
      public static function start() : void
      {
         NpcDialog.show(NPC.SHIPER,["小铁皮，你来啦！刚才在赛尔号上收到了两只神秘精灵正在高速接近的讯号！"],["神秘精灵？！"],[function():void
         {
            NpcDialog.show(NPC.SHIPER,["侦测报告显示，其中一只竟然是迪恩的精灵拉博！……不过，茜茜那里可能会需要你的帮助，我会召集星际船员委员会召开一次紧急会议，随后就会去和你会合。"],["我这就去找她！"],[function():void
            {
               TasksManager.accept(92,function(param1:Boolean):void
               {
                  if(param1)
                  {
                     showPanel();
                  }
               });
            }]);
         }]);
      }
      
      public static function showTalk1() : void
      {
         NpcDialog.show(NPC.CICI,["这个Ⅾ难道是……#7"],["是迪恩吗？","是谁"],[function():void
         {
            talkDien("");
         },function():void
         {
            talkDien("看起来像是迪恩！");
         }]);
      }
      
      private static function talkDien(param1:String) : void
      {
         var str:String = param1;
         NpcDialog.show(NPC.CICI,[str + "虽然这些代码很可能帮我们唤醒贾斯汀。但是如果这真的是迪恩一手策划。我很担心这里面还会有什么阴谋，你觉得呢？"],["能救活站长的话，管不了那么多了","保险起见，先分析下代码再说吧"],[function():void
         {
            showTalk2();
         },function():void
         {
            showTalk2();
         }]);
      }
      
      private static function showTalk2() : void
      {
         NpcDialog.show(NPC.CICI,["贾斯汀凭借自己的意志力坚持了那么久已经是一个奇迹了。如果时间再拖久的话，可能就真的没法再苏醒过来。我们现在要利用一切可以利用的东西。"],["让我们马上唤醒站长"],[function():void
         {
            NpcDialog.show(NPC.CICI,["小铁皮,你说得没错，其他工作已经早就准备好了。我这就来导入代码完成启动程式！"],["导入代码"],[function():void
            {
               NpcDialog.show(NPC.SHIPER,["还没等我来你们就自作主张了吗？我并没有责怪的意思，还为你们带了更多人！"],["回头看"],[function():void
               {
                  AnimateManager.playFullScreenAnimate("resource/bounsMovie/task_92_0.swf",_showFun,null,"sound");
               }]);
            }]);
         }]);
      }
      
      public static function delIcon() : void
      {
      }
   }
}


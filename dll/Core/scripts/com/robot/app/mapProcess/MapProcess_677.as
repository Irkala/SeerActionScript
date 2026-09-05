package com.robot.app.mapProcess
{
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.manager.map.config.BaseMapProcess;
   import com.robot.core.net.SocketConnection;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.DynamicEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class MapProcess_677 extends BaseMapProcess
   {
      
      private var _finalBossMc:MovieClip;
      
      private var _onFinalBossClick:Function;
      
      private var _crystalClicks:Array;
      
      private var _onCrystalClick:Function;
      
      private var _onYiNengStatus:Function;
      
      private var _onTaskComplete:Function;
      
      public function MapProcess_677()
      {
         super();
      }
      
      private function refreshCrystalAndBoss() : void
      {
         var m:MovieClip;
         var allComplete:Boolean;
         var i:int = 0;
         var taskToFloor:Array = [["floor_3","crystal_3"],["floor_4","crystal_4"],["floor_5","crystal_5"],["floor_2","crystal_2"],["floor_1","crystal_1"],["floor_0","crystal_0"]];
         var taskIds:Array = [758,759,760,761,762,763];
         i = 0;
         while(i <= 5)
         {
            if(TasksManager.getTaskStatus(taskIds[i]) == TasksManager.COMPLETE)
            {
               if(conLevel[taskToFloor[i][0]])
               {
                  conLevel[taskToFloor[i][0]].gotoAndStop(2);
               }
               if(conLevel[taskToFloor[i][1]])
               {
                  (conLevel[taskToFloor[i][1]] as MovieClip).visible = true;
                  (conLevel[taskToFloor[i][1]] as MovieClip).gotoAndStop(8);
               }
            }
            i++;
         }
         m = conLevel["yinengBoss"] as MovieClip;
         if(!m)
         {
            m = conLevel["finalBoss"] as MovieClip;
         }
         if(m)
         {
            if(_finalBossMc === m && _onFinalBossClick != null)
            {
               m.removeEventListener(MouseEvent.CLICK,_onFinalBossClick,true);
               _finalBossMc = null;
               _onFinalBossClick = null;
            }
            allComplete = true;
            i = 0;
            while(i <= 5)
            {
               if(TasksManager.getTaskStatus(taskIds[i]) != TasksManager.COMPLETE)
               {
                  allComplete = false;
                  break;
               }
               i++;
            }
            if(allComplete)
            {
               if(m.parent == null)
               {
                  conLevel.addChild(m);
               }
               _finalBossMc = m;
               m.visible = true;
               if(_onFinalBossClick == null)
               {
                  _onFinalBossClick = function(e:MouseEvent):void
                  {
                     SocketConnection.send(1022,86053857);
                     ModuleManager.showModule(ClientConfig.getAppModule("YiNengBossPanel"),"正在打开异能王的六重试炼....");
                  };
               }
               m.addEventListener(MouseEvent.CLICK,_onFinalBossClick,true);
            }
            else
            {
               DisplayUtil.removeForParent(m);
            }
         }
      }
      
      override protected function init() : void
      {
         var m:MovieClip = null;
         var mc:MovieClip = null;
         var i:int = 0;
         if(conLevel["arrow"])
         {
            conLevel["arrow"].visible = false;
         }
         if(conLevel["task746"])
         {
            conLevel["task746"].visible = false;
         }
         refreshCrystalAndBoss();
         _onYiNengStatus = function(e:SocketEvent):void
         {
            var ba:ByteArray = e.data as ByteArray;
            if(ba && ba.length >= 6)
            {
               var j:int = 0;
               while(j < 6)
               {
                  if(ba[j] == 1)
                  {
                     TasksManager.setTaskStatus(758 + j,TasksManager.COMPLETE);
                  }
                  j++;
               }
               refreshCrystalAndBoss();
            }
            SocketConnection.removeCmdListener(CommandID.GET_YINENG_TASK_STATUS,_onYiNengStatus);
            _onYiNengStatus = null;
            if(MapManager.currentMap)
            {
               MapManager.currentMap.closeLoading();
            }
         };
         SocketConnection.addCmdListener(CommandID.GET_YINENG_TASK_STATUS,_onYiNengStatus);
         SocketConnection.send(CommandID.GET_YINENG_TASK_STATUS);
         _onTaskComplete = function(e:DynamicEvent):void
         {
            var tid:int = int(e.data);
            if(tid >= 758 && tid <= 763)
            {
               refreshCrystalAndBoss();
            }
         };
         EventManager.addEventListener(RobotEvent.DAILY_TASK_COMPLETE,_onTaskComplete);
         _crystalClicks = [];
         _onCrystalClick = function(e:MouseEvent):void
         {
            SocketConnection.send(1022,86053857);
            ModuleManager.showModule(ClientConfig.getAppModule("YiNengBossPanel"),"正在打开异能王的六重试炼....");
         };
         i = 0;
         while(i <= 5)
         {
            mc = conLevel["crystalTig_" + i] as MovieClip;
            if(mc)
            {
               mc.buttonMode = true;
               mc.mouseChildren = false;
               mc.mouseEnabled = true;
               mc.addEventListener(MouseEvent.CLICK,_onCrystalClick);
               _crystalClicks.push(mc);
            }
            mc = conLevel["crystal_" + i] as MovieClip;
            if(mc && _crystalClicks.indexOf(mc) < 0)
            {
               mc.buttonMode = true;
               mc.mouseChildren = false;
               mc.mouseEnabled = true;
               mc.addEventListener(MouseEvent.CLICK,_onCrystalClick);
               _crystalClicks.push(mc);
            }
            i++;
         }
         m = conLevel["yinengBoss"] as MovieClip;
         if(!m)
         {
            m = conLevel["finalBoss"] as MovieClip;
         }
         if(m)
         {
            m.buttonMode = true;
            m.mouseEnabled = true;
            m.mouseChildren = true;
            if(TasksManager.getTaskStatus(758) == TasksManager.COMPLETE && TasksManager.getTaskStatus(759) == TasksManager.COMPLETE && TasksManager.getTaskStatus(760) == TasksManager.COMPLETE && TasksManager.getTaskStatus(761) == TasksManager.COMPLETE && TasksManager.getTaskStatus(762) == TasksManager.COMPLETE && TasksManager.getTaskStatus(763) == TasksManager.COMPLETE)
            {
               _finalBossMc = m;
               if(_onFinalBossClick == null)
               {
                  _onFinalBossClick = function(e:MouseEvent):void
                  {
                     SocketConnection.send(1022,86053857);
                     ModuleManager.showModule(ClientConfig.getAppModule("YiNengBossPanel"),"正在打开异能王的六重试炼....");
                  };
               }
               m.addEventListener(MouseEvent.CLICK,_onFinalBossClick,true);
            }
            else
            {
               DisplayUtil.removeForParent(m);
            }
         }
         if(MapManager.currentMap)
         {
            MapManager.currentMap.closeLoading();
         }
      }
      
      override public function destroy() : void
      {
         var j:int = 0;
         if(_onYiNengStatus != null)
         {
            SocketConnection.removeCmdListener(CommandID.GET_YINENG_TASK_STATUS,_onYiNengStatus);
            _onYiNengStatus = null;
         }
         if(_onTaskComplete != null)
         {
            EventManager.removeEventListener(RobotEvent.DAILY_TASK_COMPLETE,_onTaskComplete);
            _onTaskComplete = null;
         }
         if(_crystalClicks && _onCrystalClick != null)
         {
            j = 0;
            while(j < _crystalClicks.length)
            {
               if(_crystalClicks[j] is MovieClip)
               {
                  (_crystalClicks[j] as MovieClip).removeEventListener(MouseEvent.CLICK,_onCrystalClick);
               }
               j++;
            }
            _crystalClicks = null;
            _onCrystalClick = null;
         }
         if(_finalBossMc && _onFinalBossClick != null)
         {
            _finalBossMc.removeEventListener(MouseEvent.CLICK,_onFinalBossClick,true);
            _finalBossMc = null;
            _onFinalBossClick = null;
         }
      }
   }
}


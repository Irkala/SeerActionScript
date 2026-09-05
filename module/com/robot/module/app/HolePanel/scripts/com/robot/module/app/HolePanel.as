package com.robot.module.app
{
   import com.robot.app.mapProcess.control.mysteryHole.MysteryHoleConfig;
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.filters.ColorMatrixFilter;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class HolePanel extends Sprite implements IModule
   {
      
      private var mysteryHoleConfig:MysteryHoleConfig;
      
      private var _mainMc:Sprite;
      
      private var BlackWhiteColorArr:Array = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,1,0];
      
      private var gotoMapId:int;
      
      public function HolePanel()
      {
         super();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainMc);
         DisplayUtil.align(_mainMc,null,AlignType.MIDDLE_CENTER);
         _mainMc["petmc"].gotoAndStop(1);
         mysteryHoleConfig = new MysteryHoleConfig();
         initBlackWhiteColorArr();
         initGoMapBtn();
         chackTaskAddEvent();
         _mainMc["closeBtn"].addEventListener(MouseEvent.CLICK,closeHolePanel);
         _mainMc["maMapBtn10001"].addEventListener(MouseEvent.CLICK,isGo);
         NonoManager.nonoGoHome();
         _mainMc["goTopBtn"].addEventListener(MouseEvent.CLICK,isGoTopBtn);
      }
      
      private function chackTaskAddEvent() : void
      {
         var taskState:int = 0;
         var taskNumberArr:Array = mysteryHoleConfig.mysteryHoleObj.taskNumber as Array;
         var taskArr:Array = new Array();
         for(var i:int = 0; i < taskNumberArr.length; i++)
         {
            taskState = int(TasksManager.getTaskStatus(taskNumberArr[i]));
            if(taskState == TasksManager.UN_ACCEPT)
            {
               taskArr.push(0);
               if(i > 0)
               {
                  _mainMc["goMapBtn1000" + int(i + 1)].filters = new Array(new ColorMatrixFilter(BlackWhiteColorArr));
               }
               _mainMc["goMapBtn1000" + int(i + 1)].buttonMode = false;
               _mainMc["goMapBtn1000" + int(i + 1)].removeEventListener(MouseEvent.CLICK,fightHolePanel);
            }
            else if(taskState == TasksManager.COMPLETE)
            {
               taskArr.push(1);
               _mainMc["goMapBtn1000" + int(i + 1)].filters = [];
               _mainMc["goMapBtn1000" + int(i + 1)].buttonMode = true;
               _mainMc["goMapBtn1000" + int(i + 1)].addEventListener(MouseEvent.CLICK,fightHolePanel);
            }
         }
         for(var r:int = 0; r < taskArr.length; r++)
         {
            if(r < int(taskArr.length - 1) && taskArr[r] == 1)
            {
               _mainMc["goMapBtn1000" + int(r + 2)].filters = [];
               _mainMc["goMapBtn1000" + int(r + 2)].buttonMode = true;
               _mainMc["goMapBtn1000" + int(r + 2)].addEventListener(MouseEvent.CLICK,fightHolePanel);
            }
         }
      }
      
      private function closeHolePanel(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         _mainMc["closeBtn"].removeEventListener(MouseEvent.CLICK,closeHolePanel);
         _mainMc["maMapBtn10001"].removeEventListener(MouseEvent.CLICK,fightHolePanel);
         _mainMc["goMapBtn10002"].removeEventListener(MouseEvent.CLICK,fightHolePanel);
         _mainMc["goMapBtn10003"].removeEventListener(MouseEvent.CLICK,fightHolePanel);
         _mainMc["goMapBtn10004"].removeEventListener(MouseEvent.CLICK,fightHolePanel);
         SocketConnection.removeCmdListener(CommandID.MYSTERYHOLE_JOIN,onJoinHandler);
         DisplayUtil.removeForParent(_mainMc);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function initGoMapBtn() : void
      {
         var taskNumberArr:Array = mysteryHoleConfig.mysteryHoleObj.taskNumber as Array;
         for(var j:int = 0; j < taskNumberArr.length; j++)
         {
            _mainMc["goMapBtn1000" + int(j + 1)].filters = new Array(new ColorMatrixFilter(BlackWhiteColorArr));
            _mainMc["goMapBtn1000" + int(j + 1)].gotoAndStop(1);
         }
         gotoMapId = 10001;
         _mainMc["goMapBtn1000" + int(0 + 1)].filters = [];
         _mainMc["goMapBtn1000" + int(0 + 1)].gotoAndStop(2);
      }
      
      private function isGoTopBtn(evt:MouseEvent) : void
      {
         MapManager.changeMap(450);
         hide();
      }
      
      private function onJoinHandler(evt:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.MYSTERYHOLE_JOIN,onJoinHandler);
         hide();
         MapManager.changeLocalMap(gotoMapId);
      }
      
      private function isGo(evt:MouseEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.MYSTERYHOLE_JOIN,onJoinHandler);
         SocketConnection.send(CommandID.MYSTERYHOLE_JOIN,int(gotoMapId - 10000));
      }
      
      private function initBlackWhiteColorArr() : void
      {
         BlackWhiteColorArr[0] = (1 - 0) * 0.3086 + 0;
         BlackWhiteColorArr[1] = (1 - 0) * 0.6094;
         BlackWhiteColorArr[2] = (1 - 0) * 0.082;
         BlackWhiteColorArr[5] = (1 - 0) * 0.3086;
         BlackWhiteColorArr[6] = (1 - 0) * 0.6094 + 0;
         BlackWhiteColorArr[7] = (1 - 0) * 0.082;
         BlackWhiteColorArr[10] = (1 - 0) * 0.3086;
         BlackWhiteColorArr[11] = (1 - 0) * 0.6094;
         BlackWhiteColorArr[12] = (1 - 0) * 0.082 + 0;
         BlackWhiteColorArr[18] = 1;
      }
      
      public function destroy() : void
      {
         hide();
         ModuleManager.destroyForInstance(this);
         _mainMc = null;
      }
      
      private function fightHolePanel(evt:MouseEvent) : void
      {
         gotoMapId = int(String(evt.currentTarget.name).slice(8));
         var farme:uint = uint(int(String(evt.currentTarget.name).slice(12)));
         var taskNumberArr:Array = mysteryHoleConfig.mysteryHoleObj.taskNumber as Array;
         for(var j:int = 0; j < taskNumberArr.length; j++)
         {
            _mainMc["goMapBtn1000" + int(j + 1)].gotoAndStop(1);
         }
         _mainMc["petmc"].gotoAndStop(farme);
         evt.currentTarget.gotoAndStop(2);
      }
      
      public function setup() : void
      {
         _mainMc = new holePanelUI();
      }
   }
}


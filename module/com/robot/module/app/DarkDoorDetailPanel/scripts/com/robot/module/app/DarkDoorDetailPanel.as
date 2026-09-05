package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.app2.control.TwelveDoorController;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorDetailPanel extends Sprite implements IModule
   {
      
      private var _mainUI:DarkDoorDetailPanel_UI;
      
      public function DarkDoorDetailPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainUI = new DarkDoorDetailPanel_UI();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         this._mainUI.close.addEventListener(MouseEvent.CLICK,this.onClose);
         SocketConnection.addCmdListener(CommandID.CHECK_DOORS_STATUS,this.onCheckDoors);
         SocketConnection.send(CommandID.CHECK_DOORS_STATUS,678);
      }
      
      public function onCheckDoors(e:SocketEvent) : void
      {
         var i:int = 0;
         var flag:uint = 0;
         SocketConnection.removeCmdListener(CommandID.CHECK_DOORS_STATUS,this.onCheckDoors);
         var data:ByteArray = e.data as ByteArray;
         var value:uint = data.readUnsignedInt();
         for(i = 1; i < 12; i++)
         {
            flag = uint(KTool.getBit(value,i));
            if(Boolean(flag))
            {
               this._mainUI["door_" + i].gotoAndStop(2);
            }
            else
            {
               this._mainUI["door_" + i].gotoAndStop(1);
               this._mainUI["door_" + i].buttonMode = true;
               this._mainUI["door_" + i].addEventListener(MouseEvent.CLICK,this.onClickDoor);
            }
            ToolTipManager.add(this._mainUI["door_" + i],"第" + i + "门");
         }
         LevelManager.showOrRemoveMapLevelandToolslevel(false);
         LevelManager.appLevel.addChild(this._mainUI);
      }
      
      public function onClickDoor(e:Event) : void
      {
         if(MapManager.currentMap.id != 110)
         {
            return;
         }
         var index:uint = uint(e.currentTarget.name.split("_")[1]) - 1;
         this.hide();
         ModuleManager.destroyForInstance(this);
         TwelveDoorController.showDoor(index);
      }
      
      public function onClose(e:Event) : void
      {
         this.hide();
         ModuleManager.destroyForInstance(this);
         ModuleManager.showModule(ClientConfig.getAppModule("DarkMazeEnterPanel"));
      }
      
      public function hide() : void
      {
         var i:int = 0;
         for(i = 1; i < 12; i++)
         {
            ToolTipManager.remove(this._mainUI["door_" + i]);
         }
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         this._mainUI.close.removeEventListener(MouseEvent.CLICK,this.onClose);
         DisplayUtil.removeForParent(this._mainUI);
      }
      
      public function destroy() : void
      {
         this._mainUI = null;
      }
   }
}


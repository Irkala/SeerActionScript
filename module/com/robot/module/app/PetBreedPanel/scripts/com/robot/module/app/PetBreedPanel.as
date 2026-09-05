package com.robot.module.app
{
   import com.robot.app.info.BreedInfo;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.event.MapEvent;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.module.app.petBreed.BreedPanel;
   import com.robot.module.app.petBreed.IBreedPanel;
   import flash.display.Sprite;
   import flash.media.Sound;
   import flash.net.URLRequest;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class PetBreedPanel extends Sprite implements IModule
   {
      
      private var _sound:Sound;
      
      private var _currentPanel:IBreedPanel;
      
      public function PetBreedPanel()
      {
         super();
      }
      
      public function setup() : void
      {
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      public function show() : void
      {
         this.showPanel(new BreedPanel());
         MapManager.addEventListener(MapEvent.MAP_DESTROY,this.onMap);
      }
      
      public function onMap(param1:MapEvent) : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      public function showPanel(param1:IBreedPanel) : void
      {
         if(Boolean(this._currentPanel))
         {
            this._currentPanel.hide();
            this._currentPanel = null;
         }
         this._currentPanel = param1;
         this._currentPanel.show(this);
      }
      
      public function updateInfo(param1:Function) : void
      {
         var fun:Function = param1;
         SocketConnection.addCmdListener(CommandID.GET_BREED_INFO,function(param1:SocketEvent):void
         {
            SocketConnection.removeCmdListener(CommandID.GET_BREED_INFO,arguments.callee);
            fun(param1.data as BreedInfo);
         });
         SocketConnection.send(CommandID.GET_BREED_INFO);
      }
      
      public function playSound(param1:String) : void
      {
         this._sound = new Sound();
         this._sound.load(new URLRequest(ClientConfig.getResPath("music/" + param1 + ".mp3")));
         this._sound.play();
      }
      
      public function hide() : void
      {
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         MapManager.removeEventListener(MapEvent.MAP_DESTROY,this.onMap);
         this._sound = null;
         if(Boolean(this._currentPanel))
         {
            this._currentPanel.hide();
            this._currentPanel = null;
         }
      }
   }
}


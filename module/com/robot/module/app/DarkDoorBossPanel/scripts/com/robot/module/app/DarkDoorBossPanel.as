package com.robot.module.app
{
   import com.robot.app.task.petstory.util.KTool;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class DarkDoorBossPanel extends Sprite implements IModule
   {
      
      private var _mainUI:DarkDoorBossPanel_UI;
      
      public function DarkDoorBossPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainUI = new DarkDoorBossPanel_UI();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         SocketConnection.send(1022,86070874);
         LevelManager.showOrRemoveMapLevelandToolslevel(false,true);
         this._mainUI.close.addEventListener(MouseEvent.CLICK,this.onClose);
         this._mainUI.go.addEventListener(MouseEvent.CLICK,this.onGo);
         this._mainUI.go.visible = false;
         KTool.getForeverNum(6037,function(value:uint):void
         {
            var i:int = 0;
            for(i = 0; i < 4; i++)
            {
               if(Boolean(KTool.getBit(value,i + 1)))
               {
                  _mainUI["boss" + i].gotoAndStop(2);
               }
               else
               {
                  _mainUI["boss" + i].gotoAndStop(1);
                  _mainUI.go.visible = true;
               }
            }
            LevelManager.appLevel.addChild(_mainUI);
         });
      }
      
      private function onClose(e:Event) : void
      {
         this.hide();
      }
      
      private function onGo(e:Event) : void
      {
         this.hide();
         MapManager.changeMap(364);
      }
      
      public function hide() : void
      {
         LevelManager.showOrRemoveMapLevelandToolslevel(true);
         this._mainUI.close.removeEventListener(MouseEvent.CLICK,this.onClose);
         this._mainUI.go.removeEventListener(MouseEvent.CLICK,this.onGo);
         DisplayUtil.removeForParent(this._mainUI);
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         this._mainUI = null;
      }
   }
}


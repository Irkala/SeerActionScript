package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.info.nono.OpenSupperNonoInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class OpenSuperNonoPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _mainUI:MovieClip;
      
      private var _openBtn:SimpleButton;
      
      public function OpenSuperNonoPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
      }
      
      public function hide() : void
      {
      }
      
      private function onOpen(param1:MouseEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.OPEN_SUPER_NONO,this.onOpenFinish);
         SocketConnection.send(CommandID.OPEN_SUPER_NONO);
      }
      
      private function onOpenFinish(param1:Object) : void
      {
         SocketConnection.removeCmdListener(CommandID.OPEN_SUPER_NONO,this.onOpenFinish);
         var _loc2_:OpenSupperNonoInfo = param1.data as OpenSupperNonoInfo;
         if(_loc2_.success == 0)
         {
            Alarm.show("开通成功");
         }
         else
         {
            Alarm.show("开通失败");
         }
      }
      
      public function init(param1:Object = null) : void
      {
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._mainUI);
         DisplayUtil.align(this._mainUI,null,AlignType.MIDDLE_CENTER);
      }
      
      private function onClose(param1:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this._mainUI);
      }
      
      public function setup() : void
      {
         this._mainUI = new OpenSuperNono_mc();
         this._closeBtn = this._mainUI["closeBtn"];
         this._openBtn = this._mainUI["openBtn"];
         this._closeBtn.addEventListener(MouseEvent.CLICK,this.onClose);
         this._openBtn.addEventListener(MouseEvent.CLICK,this.onOpen);
      }
   }
}


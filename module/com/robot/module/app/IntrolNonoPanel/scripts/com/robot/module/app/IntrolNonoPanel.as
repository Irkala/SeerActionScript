package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class IntrolNonoPanel extends Sprite implements IModule
   {
      
      private var goMapBtn:SimpleButton;
      
      private var page:TextField;
      
      private var index:uint = 0;
      
      private var _panelMc:SuperNONOPanel;
      
      public function IntrolNonoPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_panelMc);
         removeEvent();
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function removeEvent() : void
      {
         ToolTipManager.remove(_panelMc["closeBtn"]);
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function addEvent() : void
      {
         ToolTipManager.add(_panelMc["closeBtn"],"关闭");
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _panelMc = null;
      }
      
      public function setup() : void
      {
         _panelMc = new SuperNONOPanel();
         _panelMc.gotoAndStop(1);
         SocketConnection.addCmdListener(CommandID.READ_COUNT,function():void
         {
            trace("ok");
         });
         SocketConnection.send(CommandID.READ_COUNT);
      }
   }
}


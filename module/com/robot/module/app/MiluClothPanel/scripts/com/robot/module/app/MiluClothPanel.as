package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.config.xml.ItemXMLInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class MiluClothPanel extends Sprite implements IModule
   {
      
      private var btn_0:SimpleButton;
      
      private var btn_1:SimpleButton;
      
      private var btn_2:SimpleButton;
      
      private var btn_3:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var close_btn:SimpleButton;
      
      public function MiluClothPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         mainUI = new MiluClothChangePanel();
         close_btn = mainUI["close_btn"];
         btn_0 = mainUI["btn_0"];
         btn_1 = mainUI["btn_1"];
         btn_2 = mainUI["btn_2"];
         btn_3 = mainUI["btn_3"];
         close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
         btn_0.addEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_1.addEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_2.addEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_3.addEventListener(MouseEvent.CLICK,clickBtnHandler);
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function clostCompLeteHandler(e:SocketEvent) : void
      {
         var id:uint = 0;
         var count:uint = 0;
         SocketConnection.removeCmdListener(CommandID.EXCHANGE_CLOTH_COMPLETE,clostCompLeteHandler);
         var by:ByteArray = e.data as ByteArray;
         by.readUnsignedInt();
         by.readUnsignedInt();
         MainManager.actorInfo.fightBadge = by.readUnsignedInt();
         var len:uint = by.readUnsignedInt();
         for(var i1:int = 0; i1 < len; i1++)
         {
            id = by.readUnsignedInt();
            count = by.readUnsignedInt();
            Alarm.show(count + "个" + TextFormatUtil.getRedTxt(ItemXMLInfo.getName(id)) + "已经放入你的背包。");
         }
      }
      
      private function clickBtnHandler(e:MouseEvent) : void
      {
         var str:String = e.target.name;
         var n:uint = uint(str.substr(4,1));
         switch(n)
         {
            case 0:
               n = 165;
               break;
            case 1:
               n = 164;
               break;
            case 2:
               n = 166;
               break;
            case 3:
               n = 167;
         }
         SocketConnection.send(CommandID.EXCHANGE_CLOTH_COMPLETE,n);
         SocketConnection.addCmdListener(CommandID.EXCHANGE_CLOTH_COMPLETE,clostCompLeteHandler);
      }
      
      public function destroy() : void
      {
         close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         btn_0.removeEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_1.removeEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_2.removeEventListener(MouseEvent.CLICK,clickBtnHandler);
         btn_3.removeEventListener(MouseEvent.CLICK,clickBtnHandler);
         close_btn = null;
         btn_0 = null;
         btn_1 = null;
         btn_2 = null;
         btn_3 = null;
      }
   }
}


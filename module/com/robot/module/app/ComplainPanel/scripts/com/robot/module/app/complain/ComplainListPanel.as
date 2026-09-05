package com.robot.module.app.complain
{
   import com.robot.core.CommandID;
   import com.robot.core.info.UserInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.net.SocketConnection;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class ComplainListPanel
   {
      
      private static var panel:MovieClip;
      
      private static var info:UserInfo;
      
      public function ComplainListPanel()
      {
         super();
      }
      
      private static function clickList(event:MouseEvent) : void
      {
         var btn:SimpleButton = event.currentTarget as SimpleButton;
         var num:uint = uint(btn.name.substr(-1,1));
         SocketConnection.addCmdListener(CommandID.COMPLAIN_USER,onComplain);
         SocketConnection.send(CommandID.COMPLAIN_USER,info.userID,num + 1);
      }
      
      public static function hide() : void
      {
         DisplayUtil.removeForParent(panel);
      }
      
      private static function initPanel() : void
      {
         var i:uint;
         var closeBtn:SimpleButton;
         var btn:SimpleButton = null;
         panel["txt"].text = info.nick + "违反了《赛尔号船员公约》";
         closeBtn = panel["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,function(event:Event):void
         {
            DisplayUtil.removeForParent(panel);
         });
         for(i = 0; i < 4; i++)
         {
            btn = panel.getChildByName("list_" + i) as SimpleButton;
            btn.addEventListener(MouseEvent.CLICK,clickList);
         }
      }
      
      public static function show(_info:UserInfo) : void
      {
         info = _info;
         if(!panel)
         {
            panel = new ui_complain_list();
            initPanel();
         }
         LevelManager.closeMouseEvent();
         DisplayUtil.align(panel,null,AlignType.MIDDLE_CENTER);
         LevelManager.topLevel.addChild(panel);
      }
      
      private static function onComplain(event:SocketEvent) : void
      {
         LevelManager.openMouseEvent();
         SocketConnection.removeCmdListener(CommandID.COMPLAIN_USER,onComplain);
         ComplainAlarm.show();
         hide();
      }
   }
}


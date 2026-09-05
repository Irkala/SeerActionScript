package com.robot.module.app.teamAdmin
{
   import com.robot.core.CommandID;
   import com.robot.core.info.teamPK.TeamPkHistoryInfo;
   import com.robot.core.net.SocketConnection;
   import org.taomee.events.SocketEvent;
   
   public class HistoryInfoManager
   {
      
      private static var info:TeamPkHistoryInfo;
      
      private static var _empty:Boolean = true;
      
      public function HistoryInfoManager()
      {
         super();
      }
      
      public static function getHistoryInfo(fun:Function) : void
      {
         if(_empty)
         {
            SocketConnection.addCmdListener(CommandID.TEAM_PK_HISTORY,function(event:SocketEvent):void
            {
               SocketConnection.removeCmdListener(CommandID.TEAM_PK_HISTORY,arguments.callee);
               info = event.data as TeamPkHistoryInfo;
               fun(info);
               _empty = false;
            });
            SocketConnection.send(CommandID.TEAM_PK_HISTORY);
         }
         else
         {
            fun(info);
         }
      }
      
      public static function clear() : void
      {
         _empty = true;
      }
   }
}


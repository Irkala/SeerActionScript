package com.robot.module.app.teamAdmin.subPanel
{
   import com.robot.app.team.TeamController;
   import com.robot.core.CommandID;
   import com.robot.core.info.UserInfo;
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.manager.ArmManager;
   import com.robot.core.manager.UserInfoManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import com.robot.core.utils.TextFormatUtil;
   import com.robot.module.app.TeamAdminPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.component.containers.HBox;
   import org.taomee.component.control.UIMovieClip;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   public class TeamInfoPanel extends Sprite implements ITeamSubPanel
   {
      
      private var memberNumTxt:TextField;
      
      private var box:HBox;
      
      private var quitBtn:SimpleButton;
      
      private var admin:uint;
      
      private var houseNumTxt:TextField;
      
      private var levelTxt:TextField;
      
      private var idTxt:TextField;
      
      private var mc:MovieClip;
      
      private var joinBtn:SimpleButton;
      
      private var leveInfoTxt:TextField;
      
      private var nameTxt:TextField;
      
      private var interestTxt:TextField;
      
      private var leaderTxt:TextField;
      
      private var barMC:MovieClip;
      
      private var desTxt:TextField;
      
      public function TeamInfoPanel()
      {
         super();
         mc = new ui_teamInfoPanel();
         addChild(mc);
         nameTxt = mc["nameTxt"];
         leaderTxt = mc["leaderTxt"];
         interestTxt = mc["interestTxt"];
         levelTxt = mc["levelTxt"];
         idTxt = mc["idTxt"];
         desTxt = mc["desTxt"];
         memberNumTxt = mc["memberNumTxt"];
         houseNumTxt = mc["houseNumTxt"];
         leveInfoTxt = mc["leveInfoTxt"];
         barMC = mc["barMC"];
         quitBtn = mc["quitBtn"];
         joinBtn = mc["joinBtn"];
         quitBtn.addEventListener(MouseEvent.CLICK,quitHandler);
         joinBtn.addEventListener(MouseEvent.CLICK,joinHandler);
         box = new HBox(1);
         box.setSizeWH(100,28);
         box.x = 140;
         box.y = 230;
         mc.addChild(box);
      }
      
      private function joinHandler(event:MouseEvent) : void
      {
         TeamController.join(TeamAdminPanel.teamID);
         dispatchEvent(new Event(TeamAdminPanel.CLOSE_ALL));
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      private function onGetInfo(event:SocketEvent) : void
      {
         var a:uint;
         var i:uint;
         var nextExp:Number;
         var level:uint;
         var info:SimpleTeamInfo;
         var b:uint;
         var star:MovieClip = null;
         var c:UIMovieClip = null;
         box.removeAll();
         SocketConnection.removeCmdListener(CommandID.TEAM_GET_INFO,onGetInfo);
         info = event.data as SimpleTeamInfo;
         houseNumTxt.text = (ArmManager.getUsedList().length + ArmManager.getUsedList_Up().length).toString();
         nameTxt.text = info.name;
         memberNumTxt.text = info.memberCount.toString();
         ToolTipManager.remove(box);
         level = getLevel(info.score);
         ToolTipManager.add(box,level + "级");
         a = Math.floor(level / 20);
         b = level % 20;
         i = 0;
         for(i = 0; i < a; i++)
         {
            star = new teamAdmin_level_star();
            star.scaleX = star.scaleY = 0.8;
            star.gotoAndStop(2);
            c = new UIMovieClip(star);
            box.append(c);
         }
         if(b > 0)
         {
            star = new teamAdmin_level_star();
            star.scaleX = star.scaleY = 0.8;
            star.gotoAndStop(1);
            c = new UIMovieClip(star);
            box.append(c);
         }
         idTxt.text = info.teamID.toString();
         desTxt.text = info.slogan;
         nextExp = Math.ceil(6 * Math.pow(info.level + 1,3) / 5 - 15 * Math.pow(info.level + 1,2) + 100 * (info.level + 1) - 140);
         levelTxt.text = info.level.toString();
         leveInfoTxt.text = info.exp + "/" + nextExp.toString();
         barMC.width = 115 * (info.exp / nextExp);
         UserInfoManager.getInfo(info.leader,function(o:UserInfo):void
         {
            leaderTxt.text = o.nick;
         });
      }
      
      private function onSurHandler() : void
      {
         Alarm.show("你真的要退出战队吗？",function():void
         {
            quitBtn.mouseEnabled = true;
            SocketConnection.addCmdListener(CommandID.TEAM_QUIT,function(event:SocketEvent):void
            {
               SocketConnection.removeCmdListener(CommandID.TEAM_QUIT,arguments.callee);
               dispatchEvent(new Event(TeamAdminPanel.CLOSE_ALL));
            });
            SocketConnection.send(CommandID.TEAM_QUIT);
         });
      }
      
      private function getInfo() : void
      {
         SocketConnection.addCmdListener(CommandID.TEAM_GET_INFO,onGetInfo);
         SocketConnection.send(CommandID.TEAM_GET_INFO,TeamAdminPanel.teamID);
      }
      
      private function getLevel(score:uint) : uint
      {
         var l:uint = 1;
         while(15 * (l + 1) * l / 2 < score)
         {
            l++;
         }
         if(l > 100)
         {
            l = 100;
         }
         return l;
      }
      
      public function destroy() : void
      {
         hide();
         mc = null;
         nameTxt = null;
         leaderTxt = null;
         interestTxt = null;
         levelTxt = null;
         idTxt = null;
         desTxt = null;
         joinBtn.removeEventListener(MouseEvent.CLICK,joinHandler);
         joinBtn = null;
      }
      
      private function quitHandler(event:MouseEvent) : void
      {
         quitBtn.mouseEnabled = false;
         Answer.show("你确定要退出战队吗？\n" + TextFormatUtil.getRedTxt("警告：退出会失去现在的职位"),onSurHandler,function():void
         {
            quitBtn.mouseEnabled = true;
         });
      }
      
      public function setup(admin:uint) : void
      {
         this.admin = admin;
         if(admin == TeamController.GUEST)
         {
            joinBtn.visible = true;
            quitBtn.visible = false;
         }
         else
         {
            joinBtn.visible = false;
            quitBtn.visible = true;
         }
         getInfo();
      }
      
      private function enterHandler(event:MouseEvent) : void
      {
         TeamController.enter(TeamAdminPanel.teamID);
         dispatchEvent(new Event(TeamAdminPanel.CLOSE_ALL));
      }
   }
}


package com.robot.module.app.teamAdmin.subPanel
{
   import com.robot.app.team.TeamController;
   import com.robot.core.CommandID;
   import com.robot.core.event.TeamEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.TeamAdminPanel;
   import com.robot.module.app.TeamCreater;
   import com.robot.module.app.tream.TeamLogoPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.utils.DisplayUtil;
   
   public class TeamModifyPanel extends Sprite implements ITeamSubPanel
   {
      
      private var listPanel:MemberListPanel;
      
      private var admin:uint;
      
      private var mc:MovieClip;
      
      private var logoPanel:TeamLogoPanel;
      
      private var listBtn:SimpleButton;
      
      private var okBtn:SimpleButton;
      
      private var logoBtn:SimpleButton;
      
      private var joinFlag:uint;
      
      private var desTxt:TextField;
      
      public function TeamModifyPanel()
      {
         super();
         mc = new ui_modifyInfoPanel();
         addChild(mc);
         desTxt = mc["des_txt"];
         okBtn = mc["okBtn"];
         okBtn.addEventListener(MouseEvent.CLICK,okHandler);
         logoBtn = mc["logoBtn"];
         logoBtn.addEventListener(MouseEvent.CLICK,modifyLogo);
         if(!MainManager.actorInfo.superNono)
         {
            DisplayUtil.removeForParent(logoBtn);
         }
         listBtn = mc["listBtn"];
         listBtn.addEventListener(MouseEvent.CLICK,listHandler);
         initJoinPanel();
      }
      
      public function destroy() : void
      {
         hide();
         mc = null;
         okBtn.removeEventListener(MouseEvent.CLICK,okHandler);
         okBtn = null;
         logoBtn.removeEventListener(MouseEvent.CLICK,modifyLogo);
         logoBtn = null;
         if(logoPanel)
         {
            logoPanel.removeEventListener(TeamLogoPanel.CREATE_TEAM,onCreate);
            logoPanel.destroy();
            logoPanel = null;
         }
         if(listPanel)
         {
            listPanel.destroy();
         }
         listPanel = null;
         listBtn.removeEventListener(MouseEvent.CLICK,listHandler);
      }
      
      private function onSet(event:SocketEvent) : void
      {
         Alarm.show("恭喜你，设置成功！");
      }
      
      private function modifyLogo(event:MouseEvent) : void
      {
         if(!logoPanel)
         {
            logoPanel = new TeamLogoPanel();
            logoPanel.addEventListener(TeamLogoPanel.CREATE_TEAM,onCreate);
         }
         logoPanel.showByModify(TeamAdminPanel.teamInfo);
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
         if(listPanel)
         {
            listPanel.hide();
         }
         if(logoPanel)
         {
            logoPanel.hide();
         }
      }
      
      private function initJoinPanel() : void
      {
         var b:MovieClip = null;
         this.mc["dotMC"].mouseEnabled = false;
         this.mc["dotMC"].x = this.mc["dotMC"].y = 0;
         for(var i:uint = 0; i < 3; i++)
         {
            b = mc["radioMC_" + i] as MovieClip;
            b.buttonMode = true;
            b.addEventListener(MouseEvent.CLICK,clickRadio);
         }
      }
      
      private function okHandler(event:MouseEvent) : void
      {
         if(!TeamCreater.checkStrLength(desTxt.text,60))
         {
            Alarm.show("战队口号过长");
            return;
         }
         var slogan:String = desTxt.text;
         var sloganBy:ByteArray = new ByteArray();
         sloganBy.writeUTFBytes(slogan);
         sloganBy.length = 60;
         SocketConnection.send(CommandID.TEAM_SET_JOIN_FLAG,joinFlag);
         SocketConnection.send(CommandID.TEAM_SET_SLOGAN,sloganBy);
         SocketConnection.addCmdListener(CommandID.TEAM_SET_SLOGAN,onSet);
      }
      
      private function clickRadio(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         mc.addChild(this.mc["dotMC"]);
         joinFlag = uint(mc.name.substr(-1,1));
      }
      
      private function listHandler(event:MouseEvent) : void
      {
         if(!listPanel)
         {
            listPanel = new MemberListPanel();
         }
         listPanel.setup(admin);
         listPanel.show();
      }
      
      private function onModify(event:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.TEAM_CREATE,onModify);
         Alarm.show("恭喜你，战队队徽修改成功！");
         dispatchEvent(new Event(TeamAdminPanel.CLOSE_ALL));
         EventManager.dispatchEvent(new TeamEvent(TeamEvent.MODIFY_LOGO));
      }
      
      private function onCreate(event:Event) : void
      {
         trace("modify logo");
         var logoBy:ByteArray = new ByteArray();
         logoBy.writeShort(logoPanel.bgIndex);
         logoBy.writeShort(logoPanel.iconIndex);
         var logoColor:ByteArray = new ByteArray();
         logoColor.writeShort(logoPanel.mcColor);
         logoColor.writeShort(logoPanel.txtColor);
         var logoWord:String = logoPanel.logoText;
         var logoWordBy:ByteArray = new ByteArray();
         logoWordBy.writeUTFBytes(logoWord);
         logoWordBy.length = 4;
         SocketConnection.addCmdListener(CommandID.TEAM_MODIFY_LOGO,onModify);
         SocketConnection.send(CommandID.TEAM_MODIFY_LOGO,logoBy,logoColor,logoWordBy);
      }
      
      public function setup(admin:uint) : void
      {
         this.admin = admin;
         if(admin == TeamController.GUEST)
         {
            listBtn.visible = false;
         }
         else
         {
            listBtn.visible = true;
         }
         desTxt.text = TeamAdminPanel.teamInfo.slogan;
         joinFlag = TeamAdminPanel.teamInfo.joinFlag;
         mc["radioMC_" + TeamAdminPanel.teamInfo.joinFlag].addChild(mc["dotMC"]);
      }
   }
}


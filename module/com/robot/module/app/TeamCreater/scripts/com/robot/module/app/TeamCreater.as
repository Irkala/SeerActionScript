package com.robot.module.app
{
   import com.robot.core.CommandID;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.tream.CreateFristPanel;
   import com.robot.module.app.tream.TeamLogoPanel;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TeamCreater extends Sprite implements IModule
   {
      
      private var rulePanel:MovieClip;
      
      private var infoPanel:CreateFristPanel;
      
      private var logoPanel:TeamLogoPanel;
      
      public function TeamCreater()
      {
         super();
      }
      
      public static function checkStrLength(str:String, len:uint) : Boolean
      {
         var by:ByteArray = new ByteArray();
         by.writeUTFBytes(str);
         if(by.length <= len)
         {
            return true;
         }
         return false;
      }
      
      private function onClose(event:Event) : void
      {
         hide();
         infoPanel.hide();
      }
      
      public function hide() : void
      {
      }
      
      public function show() : void
      {
         DisplayUtil.align(rulePanel,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(rulePanel);
      }
      
      private function nextStep(event:Event) : void
      {
         if(!logoPanel)
         {
            logoPanel = new TeamLogoPanel();
            logoPanel.addEventListener(Event.CLOSE,onClose);
            logoPanel.addEventListener(TeamLogoPanel.PREV_STEP,onPrevStep);
            logoPanel.addEventListener(TeamLogoPanel.CREATE_TEAM,createHandler);
         }
         logoPanel.show();
      }
      
      private function createHandler(event:Event) : void
      {
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
         var slogan:String = infoPanel.teamDes;
         var sloganBy:ByteArray = new ByteArray();
         sloganBy.writeUTFBytes(slogan);
         sloganBy.length = 60;
         var nameBy:ByteArray = new ByteArray();
         nameBy.writeUTFBytes(infoPanel.teamName);
         nameBy.length = 16;
         SocketConnection.addCmdListener(CommandID.TEAM_CREATE,onCreate);
         SocketConnection.send(CommandID.TEAM_CREATE,infoPanel.joinFlag,1,logoBy,logoColor,logoWordBy,nameBy,sloganBy,infoPanel.interest);
         infoPanel.hide();
         logoPanel.hide();
      }
      
      public function setup() : void
      {
         var closeBtn:SimpleButton;
         var okBtn:SimpleButton;
         rulePanel = new ui_rulePanel();
         closeBtn = rulePanel["closeBtn"];
         okBtn = rulePanel["okBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,function(event:MouseEvent):void
         {
            DisplayUtil.removeForParent(rulePanel);
         });
         okBtn.addEventListener(MouseEvent.CLICK,function(event:MouseEvent):void
         {
            DisplayUtil.removeForParent(rulePanel);
            infoPanel.show();
         });
         infoPanel = new CreateFristPanel();
         infoPanel.addEventListener(Event.CLOSE,onClose);
         infoPanel.addEventListener(CreateFristPanel.NEXT_STEP,nextStep);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         SocketConnection.removeCmdListener(CommandID.TEAM_CREATE,onCreate);
         infoPanel.removeEventListener(Event.CLOSE,onClose);
         infoPanel.removeEventListener(CreateFristPanel.NEXT_STEP,nextStep);
         infoPanel.destroy();
         infoPanel = null;
         if(logoPanel)
         {
            logoPanel.removeEventListener(Event.CLOSE,onClose);
            logoPanel.removeEventListener(TeamLogoPanel.PREV_STEP,onPrevStep);
            logoPanel.removeEventListener(TeamLogoPanel.CREATE_TEAM,createHandler);
            logoPanel.destroy();
         }
         logoPanel = null;
      }
      
      private function onCreate(event:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.TEAM_CREATE,onCreate);
         var teamID:uint = ByteArray(event.data).readUnsignedInt();
         MainManager.actorInfo.teamInfo.id = teamID;
         MainManager.actorInfo.teamInfo.priv = 0;
         Alarm.show("恭喜你，战队创建成功！");
      }
      
      private function onPrevStep(event:Event) : void
      {
         infoPanel.show(false);
      }
   }
}


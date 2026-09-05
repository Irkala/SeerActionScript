package com.robot.module.app
{
   import com.robot.app.team.TeamController;
   import com.robot.core.CommandID;
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.teamInstallation.TeamLogo;
   import com.robot.module.app.teamAdmin.HistoryInfoManager;
   import com.robot.module.app.teamAdmin.subPanel.ITeamSubPanel;
   import com.robot.module.app.teamAdmin.subPanel.TeamInfoPanel;
   import com.robot.module.app.teamAdmin.subPanel.TeamModifyPanel;
   import com.robot.module.app.teamAdmin.subPanel.TeamTotalScorePanel;
   import com.robot.module.app.teamAdmin.subPanel.TeamWeekScorePanel;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.DepthManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TeamAdminPanel extends Sprite implements IModule
   {
      
      private static var superBtn:SimpleButton;
      
      public static var teamID:uint;
      
      public static var teamInfo:SimpleTeamInfo;
      
      public static var admin:uint;
      
      public static const CLOSE_ALL:String = "closeAll";
      
      private var closeBtn:SimpleButton;
      
      private var btnContainer:Sprite;
      
      private var _dragBtn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var showIndex:uint = 0;
      
      private var logoBmp:Bitmap;
      
      private var btnArray:Array = [];
      
      private var logo:TeamLogo;
      
      private var panelArray:Array = [];
      
      public function TeamAdminPanel()
      {
         super();
      }
      
      public function destroy() : void
      {
         var i:MovieClip = null;
         var j:ITeamSubPanel = null;
         hide();
         mainUI = null;
         btnContainer = null;
         for each(i in btnArray)
         {
            i.removeEventListener(MouseEvent.CLICK,clickBtn);
         }
         btnArray = [];
         for each(j in panelArray)
         {
            j.removeEventListener(CLOSE_ALL,onCloseAll);
            j.destroy();
         }
         panelArray = [];
         _dragBtn.removeEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.removeEventListener(MouseEvent.MOUSE_UP,onDragUp);
         _dragBtn = null;
         logo = null;
         superBtn = null;
      }
      
      public function hide() : void
      {
         var j:ITeamSubPanel = null;
         for each(j in panelArray)
         {
            j.hide();
         }
         DisplayUtil.removeForParent(mainUI);
         SocketConnection.removeCmdListener(CommandID.TEAM_GET_INFO,onGetInfo);
         showIndex = 0;
         HistoryInfoManager.clear();
      }
      
      private function onCloseAll(event:Event) : void
      {
         hide();
      }
      
      private function onGetInfo(event:SocketEvent) : void
      {
         DisplayUtil.removeForParent(logo);
         DisplayUtil.removeForParent(logoBmp);
         teamInfo = event.data as SimpleTeamInfo;
         logo = new TeamLogo();
         logo.info = teamInfo;
         logo.scaleX = logo.scaleY = 1.5;
         var icon:MovieClip = mainUI["iconMC"];
         DisplayUtil.align(logo,icon.getRect(icon),AlignType.MIDDLE_CENTER);
         icon.addChild(logo);
         var sprite:Sprite = new Sprite();
         var logo2:TeamLogo = new TeamLogo();
         logo2.info = teamInfo;
         logo2.scaleX = logo2.scaleY = 5;
         sprite.addChild(logo2);
         var data:BitmapData = new BitmapData(sprite.width,sprite.height,true,0);
         data.draw(sprite);
         logoBmp = new Bitmap(data,"auto",true);
         var white:MovieClip = mainUI["whiteBg"];
         logoBmp.alpha = 0.1;
         DisplayUtil.align(logoBmp,white.getRect(mainUI),AlignType.MIDDLE_CENTER);
         mainUI.addChildAt(logoBmp,mainUI.getChildIndex(white) + 1);
         if(teamInfo.superCoreNum >= 10)
         {
            superBtn.visible = true;
            superBtn.parent.addChild(superBtn);
         }
      }
      
      public function init(data:Object = null) : void
      {
         teamID = uint(data);
         if(MainManager.actorInfo.teamInfo.id != teamID)
         {
            admin = TeamController.GUEST;
         }
         else if(MainManager.actorInfo.teamInfo.priv == 0)
         {
            admin = TeamController.ADMIN;
         }
         else
         {
            admin = TeamController.MEMBER;
         }
         if(admin != TeamController.ADMIN)
         {
            DisplayUtil.removeForParent(btnArray[1]);
            btnArray.splice(1,1);
         }
      }
      
      private function showSubPanel() : void
      {
         var i:MovieClip = null;
         var j:ITeamSubPanel = null;
         var panel:ITeamSubPanel = null;
         for each(i in btnArray)
         {
            btnContainer.addChild(i);
            i.gotoAndStop(2);
         }
         for each(j in panelArray)
         {
            j.hide();
         }
         panel = panelArray[showIndex];
         if(panel)
         {
            panel.setup(admin);
            mainUI.addChild(Sprite(panel));
         }
         var btn:MovieClip = btnArray[showIndex];
         btn.gotoAndStop(1);
         mainUI.addChild(btn);
         if(showIndex > 1)
         {
            DisplayUtil.removeForParent(mainUI["iconMC"]);
         }
         else
         {
            mainUI.addChild(mainUI["iconMC"]);
         }
      }
      
      public function show() : void
      {
         showSubPanel();
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
         SocketConnection.addCmdListener(CommandID.TEAM_GET_INFO,onGetInfo);
      }
      
      private function onDragUp(e:MouseEvent) : void
      {
         mainUI.stopDrag();
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      private function onDragDown(e:MouseEvent) : void
      {
         DepthManager.bringToTop(mainUI);
         mainUI.startDrag();
      }
      
      private function clickBtn(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         showIndex = btnArray.indexOf(mc);
         showSubPanel();
         if(mc == mainUI["btn_1"])
         {
            superBtn.visible = false;
         }
      }
      
      public function setup() : void
      {
         var j:ITeamSubPanel = null;
         var btn:MovieClip = null;
         mainUI = new ui_teamAdminPanel();
         btnContainer = new Sprite();
         for(var i:uint = 0; i < 4; i++)
         {
            btn = mainUI.getChildByName("btn_" + i) as MovieClip;
            btn.buttonMode = true;
            btn.gotoAndStop(2);
            btnContainer.addChild(btn);
            btn.addEventListener(MouseEvent.CLICK,clickBtn);
            btnArray.push(btn);
         }
         mainUI.addChild(btnContainer);
         mainUI.swapChildren(btnContainer,mainUI["whiteBg"]);
         mainUI.addChild(mainUI["iconMC"]);
         panelArray.push(new TeamInfoPanel(),new TeamModifyPanel(),new TeamWeekScorePanel(),new TeamTotalScorePanel());
         for each(j in panelArray)
         {
            j.addEventListener(CLOSE_ALL,onCloseAll);
         }
         closeBtn = mainUI["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         _dragBtn = mainUI["dragBtn"];
         _dragBtn.addEventListener(MouseEvent.MOUSE_DOWN,onDragDown);
         _dragBtn.addEventListener(MouseEvent.MOUSE_UP,onDragUp);
         superBtn = mainUI["superBtn"];
         superBtn.mouseEnabled = false;
         superBtn.visible = false;
      }
   }
}


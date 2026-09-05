package com.robot.ext
{
   import com.robot.core.CommandID;
   import com.robot.core.event.MapEvent;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.info.team.ArmInfo;
   import com.robot.core.info.team.SimpleTeamInfo;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.map.MapType;
   import com.robot.core.mode.IFunUnit;
   import com.robot.core.net.SocketLoader;
   import com.robot.core.teamInstallation.TeamInfoController;
   import com.robot.core.teamInstallation.TeamLogo;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_8 extends Sprite implements IFunUnit
   {
      
      private var _upBtn:Sprite;
      
      private var _sprite:Sprite;
      
      private var _info:ArmInfo;
      
      private var _sl:SocketLoader;
      
      private var _bodyBtn:SimpleButton;
      
      public function Ext_8()
      {
         super();
      }
      
      public function destroy() : void
      {
         ToolTipManager.remove(_bodyBtn);
         _upBtn.removeEventListener(MouseEvent.CLICK,onUpClick);
         _bodyBtn.removeEventListener(MouseEvent.CLICK,onBodyClick);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
         _info = null;
         _upBtn = null;
         _bodyBtn = null;
         if(_sl)
         {
            _sl.removeEventListener(SocketEvent.COMPLETE,onComplete);
            _sl.destroy();
            _sl = null;
         }
      }
      
      private function goto() : void
      {
         MapManager.changeMap(MainManager.actorInfo.mapID,0,MapType.HEAD);
      }
      
      private function onComplete(e:SocketEvent) : void
      {
         var logo:TeamLogo = null;
         _sl.removeEventListener(SocketEvent.COMPLETE,onComplete);
         var data:SimpleTeamInfo = e.data as SimpleTeamInfo;
         if(data.superCoreNum >= 10)
         {
            logo = new TeamLogo();
            logo.info = data;
            logo.x = _upBtn.x + (_upBtn.width / 2 - logo.width / 2);
            logo.y = _upBtn.y - logo.height;
            _sprite.addChild(logo);
         }
      }
      
      private function onMapDown(e:MapEvent) : void
      {
         MapManager.removeEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.removeEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
      }
      
      private function onBodyClick(e:MouseEvent) : void
      {
         if(_sprite.hitTestPoint(MainManager.actorModel.x,MainManager.actorModel.y))
         {
            goto();
            return;
         }
         MapManager.addEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.addEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
         MainManager.actorModel.walkAction(new Point(e.stageX,e.stageY));
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.buttonMode = false;
         _sprite.mouseEnabled = false;
         _upBtn = _sprite["upBtn"];
         _bodyBtn = _sprite["bodyBtn"];
         _upBtn.addEventListener(MouseEvent.CLICK,onUpClick);
         _bodyBtn.addEventListener(MouseEvent.CLICK,onBodyClick);
         ToolTipManager.add(_bodyBtn,"进入总部");
      }
      
      private function onUpClick(e:MouseEvent) : void
      {
         if(MainManager.actorInfo.teamInfo.id == MainManager.actorInfo.mapID)
         {
            if(_info)
            {
               TeamInfoController.start(_info);
            }
         }
      }
      
      private function onWalkEnter(e:RobotEvent) : void
      {
         if(_sprite.hitTestPoint(MainManager.actorModel.x,MainManager.actorModel.y))
         {
            MainManager.actorModel.stop();
            onMapDown(null);
            goto();
            return;
         }
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as ArmInfo;
         _sl = new SocketLoader(CommandID.TEAM_GET_INFO);
         _sl.addEventListener(SocketEvent.COMPLETE,onComplete);
         _sl.load(MainManager.actorInfo.mapID);
      }
   }
}


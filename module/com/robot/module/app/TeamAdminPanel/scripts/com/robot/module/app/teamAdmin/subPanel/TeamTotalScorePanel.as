package com.robot.module.app.teamAdmin.subPanel
{
   import com.robot.core.info.teamPK.TeamPkHistoryInfo;
   import com.robot.module.app.teamAdmin.HistoryInfoManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import org.taomee.utils.DisplayUtil;
   
   public class TeamTotalScorePanel extends Sprite implements ITeamSubPanel
   {
      
      private var mc:MovieClip;
      
      private var _info:TeamPkHistoryInfo;
      
      public function TeamTotalScorePanel()
      {
         super();
         mc = new ui_teamTotalScore();
         addChild(mc);
      }
      
      public function destroy() : void
      {
         hide();
         mc = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this);
      }
      
      public function setup(admin:uint) : void
      {
         HistoryInfoManager.getHistoryInfo(onGetHistory);
      }
      
      private function onGetHistory(info:TeamPkHistoryInfo) : void
      {
         _info = info;
         var total:uint = info.drawTimes + info.lostTimes + info.winTimes;
         mc["time_txt"].text = total.toString();
         mc["winTxt"].text = info.winTimes.toString();
         mc["winPerTxt"].text = Math.floor(info.winTimes / total * 100).toFixed(1) + "%";
         mc["killPlayerTxt"].text = info.killPlayer.toString();
         mc["killBuildingTxt"].text = info.killBuilding.toString();
         mc["scoreTxt"].text = info.point.toString();
      }
   }
}


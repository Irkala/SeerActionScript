package com.robot.module.app.tream
{
   import com.robot.app.team.TeamController;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.app.TeamCreater;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   public class CreateFristPanel extends Sprite
   {
      
      public static const NEXT_STEP:String = "nextStep";
      
      private var closeBtn:SimpleButton;
      
      private var listPanel:InterestListPanel;
      
      private var mc:MovieClip;
      
      private var interestBtn:SimpleButton;
      
      private var _desTxt:TextField;
      
      private var _nameTxt:TextField;
      
      private var nextBtn:SimpleButton;
      
      public var interest:uint = 0;
      
      private var interestTxt:TextField;
      
      public var joinFlag:uint = 0;
      
      public function CreateFristPanel()
      {
         super();
         mc = new team_panel_0();
         addChild(mc);
         closeBtn = mc["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
         nextBtn = mc["nextBtn"];
         nextBtn.addEventListener(MouseEvent.CLICK,nextHandler);
         _nameTxt = mc["name_txt"];
         _desTxt = mc["des_txt"];
         interestTxt = mc["interest_txt"];
         interestTxt.text = TeamController.TEAM_INTEREST[0];
         interestBtn = mc["interestBtn"];
         interestBtn.addEventListener(MouseEvent.CLICK,showList);
         initJoinPanel();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(this,false);
      }
      
      private function showList(event:MouseEvent) : void
      {
         event.stopImmediatePropagation();
         if(!listPanel)
         {
            listPanel = new InterestListPanel();
            listPanel.addEventListener(Event.SELECT,onSelect);
         }
         listPanel.x = interestBtn.x;
         listPanel.y = interestBtn.y - listPanel.height;
         mc.addChild(listPanel);
         listPanel.show();
      }
      
      public function get teamName() : String
      {
         return _nameTxt.text;
      }
      
      private function initJoinPanel() : void
      {
         var b:MovieClip = null;
         this.mc["dotMC"].mouseEnabled = false;
         this.mc["dotMC"].x = this.mc["dotMC"].y = 0;
         for(var i:uint = 0; i < 3; i++)
         {
            b = mc["radioMC_" + i] as MovieClip;
            if(i == 0)
            {
               b.addChild(this.mc["dotMC"]);
            }
            b.buttonMode = true;
            b.addEventListener(MouseEvent.CLICK,clickRadio);
         }
      }
      
      private function nextHandler(event:MouseEvent) : void
      {
         if(teamName.replace(/ /g,"") == "")
         {
            _nameTxt.text = "";
            Alarm.show("战队名称不能为空");
            return;
         }
         if(teamDes.replace(/ /g,"") == "")
         {
            _desTxt.text = "";
            Alarm.show("战队口号不能为空");
            return;
         }
         if(!TeamCreater.checkStrLength(teamName,15))
         {
            Alarm.show("战队名称过长");
            return;
         }
         if(!TeamCreater.checkStrLength(teamDes,60))
         {
            Alarm.show("战队口号过长");
            return;
         }
         hide();
         dispatchEvent(new Event(NEXT_STEP));
      }
      
      private function clickRadio(event:MouseEvent) : void
      {
         var mc:MovieClip = event.currentTarget as MovieClip;
         mc.addChild(this.mc["dotMC"]);
         joinFlag = uint(mc.name.substr(-1,1));
      }
      
      private function onSelect(event:Event) : void
      {
         interest = listPanel.index;
         interestTxt.text = TeamController.TEAM_INTEREST[interest];
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
         dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function get teamDes() : String
      {
         return _desTxt.text;
      }
      
      public function destroy() : void
      {
         hide();
         interestBtn.removeEventListener(MouseEvent.CLICK,showList);
         interestBtn = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,closeHandler);
         mc = null;
         closeBtn = null;
         nextBtn.removeEventListener(MouseEvent.CLICK,nextHandler);
         nextBtn = null;
         _desTxt = null;
         _nameTxt = null;
         listPanel.removeEventListener(Event.SELECT,onSelect);
         listPanel.destroy();
         listPanel = null;
      }
      
      public function show(isReset:Boolean = true) : void
      {
         if(isReset)
         {
            _nameTxt.text = "";
            _desTxt.text = "";
            interestTxt.text = TeamController.TEAM_INTEREST[0];
         }
         DisplayUtil.align(this,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(this);
      }
   }
}


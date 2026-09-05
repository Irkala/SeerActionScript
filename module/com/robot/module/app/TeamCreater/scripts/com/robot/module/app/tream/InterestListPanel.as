package com.robot.module.app.tream
{
   import com.robot.app.team.TeamController;
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   public class InterestListPanel extends Sprite
   {
      
      public var index:uint;
      
      private var mc:MovieClip;
      
      public function InterestListPanel()
      {
         var btn:SimpleButton = null;
         super();
         mc = new ui_teamInterestPanel();
         mc["txt"].text = TeamController.TEAM_INTEREST.join("\r");
         mc["txt"].mouseEnabled = false;
         addChild(mc);
         for(var i:uint = 0; i < TeamController.TEAM_INTEREST.length; i++)
         {
            btn = new ui_teamInterestBtn();
            btn.x = 3;
            btn.y = 5.5 + (btn.height + 2.8) * i;
            btn.name = i.toString();
            btn.addEventListener(MouseEvent.CLICK,clickBtn);
            mc.addChildAt(btn,1);
         }
      }
      
      private function onClickStage(event:MouseEvent) : void
      {
         if(!this.hitTestPoint(event.stageX,event.stageY,true))
         {
            DisplayUtil.removeForParent(this);
            MainManager.getStage().removeEventListener(MouseEvent.CLICK,onClickStage);
         }
      }
      
      public function destroy() : void
      {
         mc = null;
      }
      
      private function clickBtn(event:MouseEvent) : void
      {
         index = uint((event.currentTarget as SimpleButton).name);
         dispatchEvent(new Event(Event.SELECT));
         DisplayUtil.removeForParent(this);
         MainManager.getStage().removeEventListener(MouseEvent.CLICK,onClickStage);
      }
      
      public function show() : void
      {
         MainManager.getStage().addEventListener(MouseEvent.CLICK,onClickStage);
      }
   }
}


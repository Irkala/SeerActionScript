package com.robot.module.game.petSkate.observer
{
   import com.robot.module.game.petSkate.BaseGameObserver;
   import com.robot.module.game.petSkate.BaseGameSubject;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.events.MouseEvent;
   import org.taomee.utils.DisplayUtil;
   
   public class BgObserver extends BaseGameObserver
   {
      
      private var mc:MovieClip;
      
      private var restartBtn:SimpleButton;
      
      public function BgObserver(s:BaseGameSubject)
      {
         super(s);
         mc = new petSkate_game_bg();
         mc.cacheAsBitmap = true;
         subject.container.addChild(mc);
         restartBtn = mc["restartBtn"];
         restartBtn.addEventListener(MouseEvent.CLICK,restart);
      }
      
      override public function destroy() : void
      {
         super.destroy();
         DisplayUtil.removeForParent(mc);
         mc = null;
      }
      
      private function restart(event:MouseEvent) : void
      {
         subject.next();
      }
   }
}


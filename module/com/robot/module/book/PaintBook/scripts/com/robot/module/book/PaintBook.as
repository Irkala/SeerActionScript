package com.robot.module.book
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PaintBook extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      public function PaintBook()
      {
         super();
      }
      
      public function destroy() : void
      {
         hide();
         mainUI = null;
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI,false);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function closeHandler(event:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         mainUI = new ui_PaintBookMain();
         mainUI.x = (MainManager.getStageWidth() - 805) / 2;
         mainUI.y = (MainManager.getStageHeight() - 482) / 2;
         closeBtn = mainUI["closeBtn"];
         closeBtn.addEventListener(MouseEvent.CLICK,closeHandler);
      }
      
      public function show() : void
      {
         mainUI.gotoAndStop(1);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}


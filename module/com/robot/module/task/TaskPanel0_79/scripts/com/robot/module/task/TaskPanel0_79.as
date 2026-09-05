package com.robot.module.task
{
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_79 extends Sprite implements IModule
   {
      
      private var closeBtn:SimpleButton;
      
      private var mainUI:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      public function TaskPanel0_79()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         mainUI = null;
         closeBtn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         closeBtn = null;
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         _close_btn = null;
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
         destroy();
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI0_79();
         _close_btn = mainUI["close_btn"];
         closeBtn = mainUI["closeBtn"];
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
         closeBtn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}


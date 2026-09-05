package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_74;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_74 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _mc:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      public function TaskPanel0_74()
      {
         super();
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
         _mc.addFrameScript(_mc.totalFrames - 1,null);
         _mc.gotoAndStop(1);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function endMc() : void
      {
         TaskController_74.scanOver();
         _mc.addFrameScript(_mc.totalFrames - 1,null);
         _mc.gotoAndStop(_mc.totalFrames - 1);
         destroy();
      }
      
      public function destroy() : void
      {
         hide();
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         _close_btn = null;
         mainUI = null;
         _mc = null;
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI0_74();
         _close_btn = mainUI["close_btn"];
         _mc = mainUI["mc"];
         _mc = _mc["mc"];
      }
      
      public function show() : void
      {
         _mc.addFrameScript(_mc.totalFrames - 1,endMc);
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
         _mc.gotoAndPlay(2);
      }
   }
}


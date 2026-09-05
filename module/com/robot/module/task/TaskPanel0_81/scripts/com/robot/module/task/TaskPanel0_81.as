package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_81;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_81 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _close_btn:SimpleButton;
      
      public function TaskPanel0_81()
      {
         super();
      }
      
      public function hide() : void
      {
         TaskController_81.pet_btn.visible = true;
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function endDhHandler(e:Event) : void
      {
         mainUI.removeEventListener("enddh",endDhHandler);
         destroy();
         TaskController_81.speek4();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         hide();
         mainUI = null;
         if(!_close_btn)
         {
            return;
         }
         _close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         _close_btn = null;
      }
      
      public function show() : void
      {
         mainUI.addEventListener("enddh",endDhHandler);
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      private function clickCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanel81UI0();
         _close_btn = mainUI["close_btn"];
         _close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_90;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_90 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      public function TaskPanel0_90()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function endDhHandler(e:Event) : void
      {
         mainUI.removeEventListener("enddh",endDhHandler);
         TaskController_90.endLX();
         destroy();
      }
      
      public function setup() : void
      {
         mainUI = new Task90PanelUI0();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         hide();
         mainUI = null;
      }
      
      public function show() : void
      {
         mainUI.addEventListener("enddh",endDhHandler);
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}


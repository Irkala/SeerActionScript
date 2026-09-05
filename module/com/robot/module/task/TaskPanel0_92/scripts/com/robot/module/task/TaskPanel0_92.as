package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_92;
   import com.robot.core.manager.LevelManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_92 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      public function TaskPanel0_92()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function endDhHandler(e:Event) : void
      {
         TaskController_92.showTalk1();
         mainUI.removeEventListener("endpanel",endDhHandler);
         destroy();
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI0_92();
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
         mainUI.addEventListener("endpanel",endDhHandler);
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}


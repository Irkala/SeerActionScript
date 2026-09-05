package com.robot.module.task
{
   import com.robot.app.task.control.TaskController_73;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class TaskPanel0_73 extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var close_btn:SimpleButton;
      
      public function TaskPanel0_73()
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
      }
      
      public function show() : void
      {
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function taskOverHandler(e:Event) : void
      {
         TasksManager.complete(TaskController_73.TASK_ID,1,function(b:Boolean):void
         {
            if(b)
            {
               TaskController_73.showPanel();
               destroy();
               TaskController_73.machPlay();
            }
         });
      }
      
      public function destroy() : void
      {
         hide();
         close_btn.removeEventListener(MouseEvent.CLICK,clickCloseHandler);
         mainUI = null;
         close_btn = null;
      }
      
      public function setup() : void
      {
         mainUI = new TaskPanelUI0_73();
         close_btn = mainUI["close_btn"];
         mainUI.addEventListener("taskover",taskOverHandler);
         close_btn.addEventListener(MouseEvent.CLICK,clickCloseHandler);
      }
   }
}


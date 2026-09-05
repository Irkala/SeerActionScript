package com.robot.module.task.dailyTask.view
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import flash.display.Sprite;
   
   public class DailyTaskView_403 extends BaseDailyTaskView
   {
      
      public function DailyTaskView_403(taskID:uint)
      {
         super(taskID);
      }
      
      override protected function getPanel() : Sprite
      {
         return new dailyTask_panel_403();
      }
   }
}


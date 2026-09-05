package com.robot.module.task.dailyTask.view
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import flash.display.Sprite;
   
   public class DailyTaskView_407 extends BaseDailyTaskView
   {
      
      public function DailyTaskView_407(taskID:uint)
      {
         super(taskID);
      }
      
      override protected function getPanel() : Sprite
      {
         return new dailyTask_panel_407();
      }
   }
}


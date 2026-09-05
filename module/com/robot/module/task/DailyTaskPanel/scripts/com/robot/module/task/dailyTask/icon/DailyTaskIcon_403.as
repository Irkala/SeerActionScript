package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_403;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_403 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_403(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_403(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_403();
      }
      
      override protected function initProperty() : void
      {
         _petID = 1;
         _taskID = 403;
         _des = "小医生布布";
      }
   }
}


package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_405;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_405 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_405(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_405(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_405();
      }
      
      override protected function initProperty() : void
      {
         _petID = 13;
         _taskID = 405;
         _des = "比比鼠的发电能源";
      }
   }
}


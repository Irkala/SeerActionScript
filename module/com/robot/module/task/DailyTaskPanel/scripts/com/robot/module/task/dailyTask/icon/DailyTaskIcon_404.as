package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_404;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_404 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_404(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_404(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_404();
      }
      
      override protected function initProperty() : void
      {
         _petID = 5;
         _taskID = 404;
         _des = "伊优的环保宣言";
      }
   }
}


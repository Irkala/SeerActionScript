package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_402;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_402 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_402(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_402(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_402();
      }
      
      override protected function initProperty() : void
      {
         _petID = 7;
         _taskID = 402;
         _des = "小火猴的武学梦想";
      }
   }
}


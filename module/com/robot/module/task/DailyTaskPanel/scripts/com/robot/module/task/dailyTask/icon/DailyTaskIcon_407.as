package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_407;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_407 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_407(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_407(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_407();
      }
      
      override protected function initProperty() : void
      {
         _petID = 33;
         _taskID = 407;
         _des = "利牙鱼的口腔护理";
      }
   }
}


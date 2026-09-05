package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_406;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_406 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_406(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_406(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_406();
      }
      
      override protected function initProperty() : void
      {
         _petID = 26;
         _taskID = 406;
         _des = "爱捉迷藏的幽浮";
      }
   }
}


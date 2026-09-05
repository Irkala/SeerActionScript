package com.robot.module.task.dailyTask.icon
{
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import com.robot.module.task.dailyTask.view.DailyTaskView_401;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   
   public class DailyTaskIcon_401 extends BaseDailyTaskIcon
   {
      
      public function DailyTaskIcon_401(mainUI:MovieClip)
      {
         super(mainUI);
      }
      
      override protected function getView() : BaseDailyTaskView
      {
         return new DailyTaskView_401(taskID);
      }
      
      override protected function getMC() : SimpleButton
      {
         return new Icon_401();
      }
      
      override protected function initProperty() : void
      {
         _petID = 24;
         _taskID = 401;
         _des = "毛毛的音乐梦想";
      }
   }
}


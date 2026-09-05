package com.robot.module.task.dailyTask
{
   import flash.display.Sprite;
   
   public class BaseDailyTaskView extends Sprite
   {
      
      protected var taskID:uint;
      
      protected var panel:Sprite;
      
      public function BaseDailyTaskView(taskID:uint)
      {
         super();
         this.taskID = taskID;
         panel = getPanel();
         addChild(panel);
      }
      
      public function destroy() : void
      {
         panel = null;
      }
      
      public function quit() : void
      {
      }
      
      public function checkProStatus() : void
      {
      }
      
      public function complete() : void
      {
      }
      
      public function accept() : void
      {
      }
      
      protected function getPanel() : Sprite
      {
         return null;
      }
   }
}


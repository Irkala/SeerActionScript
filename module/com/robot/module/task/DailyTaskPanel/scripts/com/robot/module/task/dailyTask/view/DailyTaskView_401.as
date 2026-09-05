package com.robot.module.task.dailyTask.view
{
   import com.robot.core.config.xml.TasksXMLInfo;
   import com.robot.core.manager.TasksManager;
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import flash.display.Sprite;
   import org.taomee.manager.ToolTipManager;
   
   public class DailyTaskView_401 extends BaseDailyTaskView
   {
      
      public function DailyTaskView_401(taskID:uint)
      {
         super(taskID);
         ToolTipManager.add(panel["pro_0"],TasksXMLInfo.getProName(taskID,0));
         ToolTipManager.add(panel["pro_1"],TasksXMLInfo.getProName(taskID,1));
         ToolTipManager.add(panel["pro_2"],TasksXMLInfo.getProName(taskID,2));
      }
      
      override public function destroy() : void
      {
         ToolTipManager.remove(panel["pro_0"]);
         ToolTipManager.remove(panel["pro_1"]);
      }
      
      override protected function getPanel() : Sprite
      {
         return new dailyTask_panel_401();
      }
      
      override public function checkProStatus() : void
      {
         TasksManager.getProStatus(taskID,0,function(b:Boolean):void
         {
            panel["mc_0"].visible = b;
         });
         TasksManager.getProStatus(taskID,1,function(b:Boolean):void
         {
            panel["mc_1"].visible = b;
         });
         TasksManager.getProStatus(taskID,2,function(b:Boolean):void
         {
            panel["mc_2"].visible = b;
         });
      }
   }
}


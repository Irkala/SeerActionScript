package com.robot.module.task.dailyTask.icon
{
   import com.robot.core.manager.TasksManager;
   import com.robot.module.task.dailyTask.BaseDailyTaskView;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import org.taomee.utils.DisplayUtil;
   
   public class BaseDailyTaskIcon extends Sprite
   {
      
      public static const CHOOSE:String = "choose";
      
      public static var array:Array = [];
      
      protected var mainUI:MovieClip;
      
      protected var completeIcon:Sprite;
      
      protected var _des:String = "";
      
      protected var mc:SimpleButton;
      
      protected var acceptIcon:Sprite;
      
      protected var view:BaseDailyTaskView;
      
      private var status:uint;
      
      protected var _petID:uint;
      
      protected var _taskID:uint;
      
      public function BaseDailyTaskIcon(mainUI:MovieClip)
      {
         super();
         this.mainUI = mainUI;
         this.cacheAsBitmap = true;
         mc = getMC();
         addChild(mc);
         array.push(this);
         addEventListener(MouseEvent.CLICK,clickHandler);
         completeIcon = new dailyTaskCompleteIcon();
         completeIcon.x = this.width - completeIcon.width - 2;
         completeIcon.y = this.height - completeIcon.height - 2;
         acceptIcon = new dailyTaskAcceptIcon();
         acceptIcon.x = this.width - acceptIcon.width - 2;
         acceptIcon.y = this.height - acceptIcon.height - 2;
         initProperty();
         view = getView();
         view.x = 162;
         view.y = 189;
      }
      
      public function destroy() : void
      {
         removeEventListener(MouseEvent.CLICK,clickHandler);
         mainUI = null;
         mc = null;
         view.destroy();
         view = null;
      }
      
      protected function getMC() : SimpleButton
      {
         return null;
      }
      
      protected function initProperty() : void
      {
      }
      
      public function accept() : void
      {
         status = TasksManager.ALR_ACCEPT;
         DisplayUtil.removeForParent(completeIcon);
         addChild(acceptIcon);
         view.accept();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(view,false);
      }
      
      public function quit() : void
      {
         status = TasksManager.UN_ACCEPT;
         DisplayUtil.removeForParent(completeIcon);
         DisplayUtil.removeForParent(acceptIcon);
         view.quit();
      }
      
      public function choose() : void
      {
         clickHandler(null);
      }
      
      public function get des() : String
      {
         return _des;
      }
      
      protected function getView() : BaseDailyTaskView
      {
         return null;
      }
      
      public function get taskID() : uint
      {
         return _taskID;
      }
      
      private function clickHandler(event:MouseEvent) : void
      {
         var i:BaseDailyTaskIcon = null;
         for each(i in array)
         {
            i.filters = [];
         }
         this.filters = [new GlowFilter(16776960,1,10,10,10)];
         dispatchEvent(new Event(CHOOSE));
      }
      
      public function checkStatus() : void
      {
         if(TasksManager.getTaskStatus(taskID) == TasksManager.COMPLETE)
         {
            complete();
         }
         else if(TasksManager.getTaskStatus(taskID) == TasksManager.UN_ACCEPT)
         {
            quit();
         }
         else
         {
            accept();
         }
      }
      
      public function complete() : void
      {
         if(status == TasksManager.ALR_ACCEPT || TasksManager.getTaskStatus(taskID) == TasksManager.COMPLETE)
         {
            status = TasksManager.COMPLETE;
            DisplayUtil.removeForParent(acceptIcon);
            addChild(completeIcon);
            view.complete();
         }
      }
      
      public function get petID() : uint
      {
         return _petID;
      }
      
      public function show() : void
      {
         mainUI.addChild(view);
         view.checkProStatus();
      }
   }
}


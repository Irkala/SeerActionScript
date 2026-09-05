package com.robot.module.task
{
   import com.robot.app.task.collectionExercise.CollectionExercise;
   import com.robot.core.event.ItemEvent;
   import com.robot.core.manager.ItemManager;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Answer;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class CollectionExercisPanel extends Sprite implements IModule
   {
      
      private var mainUI:MovieClip;
      
      private var _giveUp_btn:SimpleButton;
      
      private var _close_btn:SimpleButton;
      
      private var renwu_mc:MovieClip;
      
      private var _goOn_btn:SimpleButton;
      
      private var _txt_mc:MovieClip;
      
      public function CollectionExercisPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(mainUI);
      }
      
      private function giveUp(e:MouseEvent) : void
      {
         Answer.show("你确定要放弃这个任务吗？",function():void
         {
            TasksManager.quit(CollectionExercise.TASK_ID,function(b:Boolean):void
            {
               if(b)
               {
                  Alarm.show("你已经成功放弃了该任务！");
                  hide();
                  CollectionExercise.delIcon();
               }
            });
         });
      }
      
      private function getCollection(e:ItemEvent) : void
      {
         var j:int = 0;
         var str:String = null;
         ItemManager.removeEventListener(ItemEvent.COLLECTION_LIST,getCollection);
         trace(ItemManager.getCollectionIDs());
         if(ItemManager.getCollectionInfo(400001))
         {
            j = int(ItemManager.getCollectionInfo(400001).itemNum);
            trace("j:" + j);
            if(j >= 10)
            {
               renwu_mc.visible = true;
               _txt_mc.visible = true;
               _giveUp_btn.visible = false;
               _goOn_btn.visible = false;
            }
            else
            {
               renwu_mc.visible = false;
            }
         }
         else
         {
            renwu_mc.visible = false;
         }
      }
      
      public function setup() : void
      {
         mainUI = new CaijiPanel_New3();
         _close_btn = mainUI["close_btn"];
         renwu_mc = mainUI["renwu_mc"];
         _goOn_btn = mainUI["goOn_btn"];
         _giveUp_btn = mainUI["giveUp_btn"];
         _txt_mc = mainUI["xixi_txt"];
         renwu_mc.visible = false;
         _txt_mc.visible = false;
         _goOn_btn.addEventListener(MouseEvent.CLICK,closeHandler);
         _close_btn.addEventListener(MouseEvent.CLICK,closeHandler);
         _giveUp_btn.addEventListener(MouseEvent.CLICK,giveUp);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function closeHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function isGetRes() : void
      {
         ItemManager.addEventListener(ItemEvent.COLLECTION_LIST,getCollection);
         ItemManager.getCollection();
      }
      
      public function destroy() : void
      {
         _goOn_btn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _close_btn.removeEventListener(MouseEvent.CLICK,closeHandler);
         _giveUp_btn.removeEventListener(MouseEvent.CLICK,giveUp);
         hide();
         mainUI = null;
         _goOn_btn = null;
         _close_btn = null;
         _giveUp_btn = null;
      }
      
      public function show() : void
      {
         isGetRes();
         DisplayUtil.align(mainUI,null,AlignType.MIDDLE_CENTER);
         LevelManager.appLevel.addChild(mainUI);
      }
   }
}


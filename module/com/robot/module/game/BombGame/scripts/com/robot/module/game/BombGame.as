package com.robot.module.game
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.module.game.bombGame.CubeGame;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class BombGame extends Sprite implements IModule
   {
      
      private var blockMc:CubeGame;
      
      private var mainBgMc:UI_BombBg;
      
      public function BombGame()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         if(blockMc)
         {
            blockMc.destroy();
            blockMc = null;
         }
         DisplayUtil.removeForParent(mainBgMc);
         LevelManager.openMouseEvent();
      }
      
      public function setup() : void
      {
         mainBgMc = new UI_BombBg();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function completeHandler() : void
      {
         if(TasksManager.getTaskStatus(9) == TasksManager.COMPLETE)
         {
            LevelManager.gameLevel.addChild(Alarm.show("你真棒,导弹已经拆除。",destroy));
            return;
         }
         TasksManager.complete(9,1,function(b1:Boolean):void
         {
            if(b1)
            {
               LevelManager.gameLevel.addChild(Alarm.show("导弹已经拆除,送你一个电能锯子。",destroy));
            }
         });
      }
      
      private function removeEvent() : void
      {
         mainBgMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         destroy();
      }
      
      private function addEvent() : void
      {
         mainBgMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseHandler);
      }
      
      public function destroy() : void
      {
         hide();
         mainBgMc = null;
      }
      
      public function show() : void
      {
         if(!mainBgMc)
         {
            setup();
         }
         LevelManager.closeMouseEvent();
         LevelManager.gameLevel.addChild(mainBgMc);
         DisplayUtil.align(mainBgMc,null,AlignType.MIDDLE_CENTER);
         blockMc = new CubeGame();
         blockMc.show(mainBgMc["ccMc"],completeHandler);
         addEvent();
      }
   }
}


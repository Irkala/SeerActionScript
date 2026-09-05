package com.robot.module.task
{
   import com.robot.app.task.newNovice.NewNoviceGuideTaskController;
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class NewNoviceFightPetPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _sureBtn:SimpleButton;
      
      private var _mainUI:NewNoviceFightPet_MC;
      
      public function NewNoviceFightPetPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         DisplayUtil.removeForParent(_mainUI);
         removeEvent();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainUI);
         DisplayUtil.align(_mainUI,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      public function onSureHandler(e:MouseEvent) : void
      {
         hide();
         NewNoviceGuideTaskController.fightBoss();
      }
      
      public function onCloseHandler(e:MouseEvent) : void
      {
         hide();
         NewNoviceGuideTaskController.fightBoss();
      }
      
      public function setup() : void
      {
         _mainUI = new NewNoviceFightPet_MC();
         _closeBtn = _mainUI["closeBtn"];
         _sureBtn = _mainUI["sureBtn"];
      }
      
      public function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         _sureBtn.removeEventListener(MouseEvent.CLICK,onSureHandler);
      }
      
      public function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _sureBtn.addEventListener(MouseEvent.CLICK,onSureHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _mainUI = null;
         _closeBtn = null;
         _sureBtn = null;
      }
      
      public function init(data:Object = null) : void
      {
      }
   }
}


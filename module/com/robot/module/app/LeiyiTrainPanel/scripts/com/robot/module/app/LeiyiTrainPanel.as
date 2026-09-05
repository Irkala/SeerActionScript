package com.robot.module.app
{
   import com.robot.core.manager.LevelManager;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.manager.DragManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class LeiyiTrainPanel extends Sprite implements IModule
   {
      
      private var _closeBtn:SimpleButton;
      
      private var _skillBtn:SimpleButton;
      
      private var _mainMc:Sprite;
      
      private var _energyBtn:SimpleButton;
      
      public function LeiyiTrainPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_mainMc);
      }
      
      private function onSkillHandler(e:MouseEvent) : void
      {
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_mainMc);
         _mainMc.x = 220;
         _mainMc.y = 90;
         addEvent();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onEnergyHandler(e:MouseEvent) : void
      {
         hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      private function removeEvent() : void
      {
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseHandler);
         _energyBtn.removeEventListener(MouseEvent.CLICK,onEnergyHandler);
         _skillBtn.removeEventListener(MouseEvent.CLICK,onSkillHandler);
         DragManager.remove(_mainMc);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseHandler);
         _energyBtn.addEventListener(MouseEvent.CLICK,onEnergyHandler);
         _skillBtn.addEventListener(MouseEvent.CLICK,onSkillHandler);
         DragManager.add(_mainMc["dragMc"],_mainMc);
      }
      
      public function destroy() : void
      {
         hide();
         _mainMc = null;
         _closeBtn = null;
         _energyBtn = null;
         _skillBtn = null;
      }
      
      public function setup() : void
      {
         _mainMc = new LeiyiTrain_Mc();
         _closeBtn = _mainMc["closeBtn"];
         _energyBtn = _mainMc["energyBtn"];
         _skillBtn = _mainMc["skillBtn"];
      }
   }
}


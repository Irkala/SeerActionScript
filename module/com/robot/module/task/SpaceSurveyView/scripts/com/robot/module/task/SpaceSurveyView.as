package com.robot.module.task
{
   import com.robot.app.spacesurvey.SpaceSurveyResultController;
   import com.robot.app.task.control.TaskController_37;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpaceSurveyView extends Sprite implements IModule
   {
      
      private var _fire_mc:MovieClip;
      
      private var _luciou_mc:MovieClip;
      
      private var _Klose_mc:MovieClip;
      
      private var _beta_mc:MovieClip;
      
      private var _Helcar_mc:MovieClip;
      
      private var _seville_mc:MovieClip;
      
      private var _sno_mc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _sea_mc:MovieClip;
      
      private var _cloth_mc:MovieClip;
      
      private var _panelMc:SpaceCurvey_View;
      
      private var _alpha_mc:MovieClip;
      
      public function SpaceSurveyView()
      {
         super();
      }
      
      public function setup() : void
      {
         _panelMc = new SpaceCurvey_View();
         _seville_mc = _panelMc["seville_mc"];
         _seville_mc.buttonMode = true;
         _seville_mc.gotoAndStop(2);
         ToolTipManager.add(_seville_mc,"塞西利亚星");
         _Klose_mc = _panelMc["Klose_mc"];
         _Klose_mc.buttonMode = true;
         _Klose_mc.gotoAndStop(2);
         ToolTipManager.add(_Klose_mc,"克洛斯星");
         _sea_mc = _panelMc["sea_mc"];
         _sea_mc.buttonMode = true;
         _sea_mc.gotoAndStop(2);
         ToolTipManager.add(_sea_mc,"海洋星");
         _fire_mc = _panelMc["fire_mc"];
         _fire_mc.buttonMode = true;
         _fire_mc.gotoAndStop(2);
         ToolTipManager.add(_fire_mc,"火山星");
         _alpha_mc = _panelMc["alpha_mc"];
         _alpha_mc.buttonMode = true;
         _alpha_mc.gotoAndStop(2);
         ToolTipManager.add(_alpha_mc,"双子阿尔法星");
         _beta_mc = _panelMc["beta_mc"];
         _beta_mc.buttonMode = true;
         _beta_mc.gotoAndStop(2);
         ToolTipManager.add(_beta_mc,"双子贝塔星");
         _Helcar_mc = _panelMc["Helcar_mc"];
         _Helcar_mc.buttonMode = true;
         _Helcar_mc.gotoAndStop(2);
         ToolTipManager.add(_Helcar_mc,"赫尔卡星");
         _cloth_mc = _panelMc["cloth_mc"];
         _cloth_mc.buttonMode = true;
         _cloth_mc.gotoAndStop(2);
         ToolTipManager.add(_cloth_mc,"云霄星");
         _closeBtn = _panelMc["close_btn"];
         _sno_mc = _panelMc["sno_mc"];
         _sno_mc.buttonMode = true;
         _sno_mc.gotoAndStop(2);
         ToolTipManager.add(_sno_mc,"斯诺星");
         _luciou_mc = _panelMc["luciou_mc"];
         _luciou_mc.buttonMode = true;
         _luciou_mc.gotoAndStop(2);
         ToolTipManager.add(_luciou_mc,"露希欧星");
      }
      
      private function removeEvent() : void
      {
         _seville_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _Klose_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _sea_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _fire_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _alpha_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _Helcar_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _cloth_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         _beta_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _sno_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         _luciou_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panelMc);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function destroy() : void
      {
         hide();
         _seville_mc = null;
         _Klose_mc = null;
         _sea_mc = null;
         _fire_mc = null;
         _alpha_mc = null;
         _Helcar_mc = null;
         _cloth_mc = null;
         _beta_mc = null;
         _sno_mc = null;
         _luciou_mc = null;
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_panelMc))
         {
            LevelManager.appLevel.addChild(_panelMc);
            DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         }
         addEvent();
         if(TasksManager.getTaskStatus(TaskController_37.TASK_ID) == TasksManager.COMPLETE)
         {
            _Klose_mc.gotoAndStop(1);
            _Klose_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _fire_mc.gotoAndStop(1);
            _fire_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _sea_mc.gotoAndStop(1);
            _sea_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _cloth_mc.gotoAndStop(1);
            _cloth_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _Helcar_mc.gotoAndStop(1);
            _Helcar_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _seville_mc.gotoAndStop(1);
            _seville_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _alpha_mc.gotoAndStop(1);
            _alpha_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _beta_mc.gotoAndStop(1);
            _beta_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _sno_mc.gotoAndStop(1);
            _sno_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            _luciou_mc.gotoAndStop(1);
            _luciou_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            return;
         }
         checkTaskState();
      }
      
      private function checkTaskState() : void
      {
         TasksManager.getProStatusList(TaskController_37.TASK_ID,function(arr:Array):void
         {
            if(arr[0])
            {
               _Klose_mc.gotoAndStop(1);
               _Klose_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[1])
            {
               _fire_mc.gotoAndStop(1);
               _fire_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[2])
            {
               _sea_mc.gotoAndStop(1);
               _sea_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[3])
            {
               _cloth_mc.gotoAndStop(1);
               _cloth_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[4])
            {
               _Helcar_mc.gotoAndStop(1);
               _Helcar_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[5])
            {
               _seville_mc.gotoAndStop(1);
               _seville_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[6])
            {
               _alpha_mc.gotoAndStop(1);
               _alpha_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[7])
            {
               _beta_mc.gotoAndStop(1);
               _beta_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[8])
            {
               _sno_mc.gotoAndStop(1);
               _sno_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
            if(arr[9])
            {
               _luciou_mc.gotoAndStop(1);
               _luciou_mc.addEventListener(MouseEvent.CLICK,onMCClickHandler);
            }
         });
      }
      
      private function onMCClickHandler(e:MouseEvent) : void
      {
         switch(e.currentTarget.name)
         {
            case "seville_mc":
               SpaceSurveyResultController.show("塞西利亚星");
               break;
            case "Klose_mc":
               SpaceSurveyResultController.show("克洛斯星");
               break;
            case "sea_mc":
               SpaceSurveyResultController.show("海洋星");
               break;
            case "fire_mc":
               SpaceSurveyResultController.show("火山星");
               break;
            case "alpha_mc":
               SpaceSurveyResultController.show("双子阿尔法星");
               break;
            case "beta_mc":
               SpaceSurveyResultController.show("双子贝塔星");
               break;
            case "Helcar_mc":
               SpaceSurveyResultController.show("赫尔卡星");
               break;
            case "cloth_mc":
               SpaceSurveyResultController.show("云宵星");
               break;
            case "sno_mc":
               SpaceSurveyResultController.show("斯诺星");
               break;
            case "luciou_mc":
               SpaceSurveyResultController.show("露希欧星");
         }
      }
      
      private function addEvent() : void
      {
         _closeBtn.addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
   }
}


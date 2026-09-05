package com.robot.module.task
{
   import com.robot.app.spacesurvey.SpaceSurveyResultController;
   import com.robot.app.task.control.TaskController_37;
   import com.robot.core.event.NonoEvent;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.SimpleButton;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import org.taomee.manager.ToolTipManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class SpaceSurveyTask extends Sprite implements IModule
   {
      
      private var _fire_mc:MovieClip;
      
      private var _beta_mc:MovieClip;
      
      private var _iconMc:Sprite;
      
      private var _Helcar_mc:MovieClip;
      
      private var _seville_mc:MovieClip;
      
      private var _closeBtn:SimpleButton;
      
      private var _sea_mc:MovieClip;
      
      private var _txt:TextField;
      
      private var _Klose_mc:MovieClip;
      
      private var _luciou_mc:MovieClip;
      
      private var _cloth_mc:MovieClip;
      
      private var _icon:MovieClip;
      
      private var _sno_mc:MovieClip;
      
      private var _tipA:Array = ["星球测绘芯片配方：玄冰+甲烷燃气+大型模板","帕诺星系图，去资料室查看吧！"];
      
      private var _classA:Array = [chipTask,vurveyTask];
      
      private var _alpha_mc:MovieClip;
      
      private var _panelMc:BG_mc;
      
      public function SpaceSurveyTask()
      {
         super();
      }
      
      private function comHandler(num:uint) : void
      {
         _icon = new (_classA[num] as Class)() as MovieClip;
         _icon.x = 20;
         _iconMc.addChild(_icon);
         ToolTipManager.add(_icon,_tipA[num]);
         _icon["finish_mc"].visible = false;
         _iconMc.x = (_panelMc.width - _iconMc.width) / 2 - 20;
         if(num == 1)
         {
            _seville_mc = _icon["seville_mc"];
            _seville_mc.buttonMode = true;
            _seville_mc.gotoAndStop(2);
            ToolTipManager.add(_seville_mc,"塞西利亚星");
            _Klose_mc = _icon["Klose_mc"];
            _Klose_mc.buttonMode = true;
            _Klose_mc.gotoAndStop(2);
            ToolTipManager.add(_Klose_mc,"克洛斯星");
            _sea_mc = _icon["sea_mc"];
            _sea_mc.buttonMode = true;
            _sea_mc.gotoAndStop(2);
            ToolTipManager.add(_sea_mc,"海洋星");
            _fire_mc = _icon["fire_mc"];
            _fire_mc.buttonMode = true;
            _fire_mc.gotoAndStop(2);
            ToolTipManager.add(_fire_mc,"火山星");
            _alpha_mc = _icon["alpha_mc"];
            _alpha_mc.buttonMode = true;
            _alpha_mc.gotoAndStop(2);
            ToolTipManager.add(_alpha_mc,"双子阿尔法星");
            _beta_mc = _icon["beta_mc"];
            _beta_mc.buttonMode = true;
            _beta_mc.gotoAndStop(2);
            ToolTipManager.add(_beta_mc,"双子贝塔星");
            _Helcar_mc = _icon["Helcar_mc"];
            _Helcar_mc.buttonMode = true;
            _Helcar_mc.gotoAndStop(2);
            ToolTipManager.add(_Helcar_mc,"赫尔卡星");
            _cloth_mc = _icon["cloth_mc"];
            _cloth_mc.buttonMode = true;
            _cloth_mc.gotoAndStop(2);
            ToolTipManager.add(_cloth_mc,"云宵星");
            _sno_mc = _icon["sno_mc"];
            _sno_mc.buttonMode = true;
            _sno_mc.gotoAndStop(2);
            ToolTipManager.add(_sno_mc,"斯诺星");
            _luciou_mc = _icon["luciou_mc"];
            _luciou_mc.buttonMode = true;
            _luciou_mc.gotoAndStop(2);
            ToolTipManager.add(_luciou_mc,"露希欧星");
         }
         TasksManager.getProStatusList(TaskController_37.TASK_ID,function(arr:Array):void
         {
            var str:String = null;
            if(Boolean(arr[0]) && Boolean(arr[1]) && Boolean(arr[2]) && Boolean(arr[3]) && Boolean(arr[4]) && Boolean(arr[5]) && Boolean(arr[6]) && Boolean(arr[7]) && Boolean(arr[8]) && Boolean(arr[9]) && !arr[10])
            {
               str = "    你完美得完成了帕诺星系所有星球的测绘，非常好，去<font color=\'#ff0000\'>船长室</font>领取你应得的奖励吧！";
               _txt.htmlText = str;
               _icon.mouseEnabled = false;
               ToolTipManager.remove(_icon);
            }
         });
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function removeEvent() : void
      {
         if(_beta_mc)
         {
            _beta_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_seville_mc)
         {
            _seville_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_Klose_mc)
         {
            _Klose_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_sea_mc)
         {
            _sea_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_fire_mc)
         {
            _fire_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_alpha_mc)
         {
            _alpha_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_Helcar_mc)
         {
            _Helcar_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_cloth_mc)
         {
            _cloth_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_sno_mc)
         {
            _sno_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         if(_luciou_mc)
         {
            _luciou_mc.removeEventListener(MouseEvent.CLICK,onMCClickHandler);
         }
         _closeBtn.removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
      }
      
      private function removeIcon() : void
      {
         ToolTipManager.remove(_icon);
         DisplayUtil.removeAllChild(_iconMc);
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_panelMc))
         {
            LevelManager.appLevel.addChild(_panelMc);
            _panelMc.addChild(_iconMc);
            _iconMc.x = 20;
            _iconMc.y = 120;
            DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         }
         removeIcon();
         addIcon();
         addEvent();
         checkTaskState();
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function addIcon() : void
      {
         NonoManager.addEventListener(NonoEvent.GET_INFO,function():void
         {
            var str2:String = null;
            var str1:String = null;
            NonoManager.removeEventListener(NonoEvent.GET_INFO,arguments.callee);
            if(!NonoManager.info.func[7])
            {
               str2 = "    在帕诺星系航行了三个月的赛尔号开始制作星系地图啦，小赛尔们，准备好了吗？帮自己的 NoNo 装上<font color=\'#ff0000\'>星球测绘芯片</font>，开始星球测绘吧！";
               _txt.htmlText = str2;
               comHandler(0);
            }
            else
            {
               str1 = "    现在，带着装好测绘芯片的NoNo到每个星球上，点击测绘标杆开始测绘吧！完成测绘后，你可以在<font color=\'#ff0000\'>资料室</font>看到一张制作完成的帕诺星系图！";
               _txt.htmlText = str1;
               comHandler(1);
            }
         });
         NonoManager.getInfo();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panelMc);
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
      
      public function destroy() : void
      {
         hide();
         _panelMc = null;
         _iconMc = null;
         _closeBtn = null;
         _tipA = null;
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
      }
      
      public function setup() : void
      {
         _panelMc = new BG_mc();
         _iconMc = new Sprite();
         _closeBtn = _panelMc["close_btn"];
         _txt = _panelMc["txt"];
      }
   }
}


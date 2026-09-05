package com.robot.module.app
{
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.PetListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import com.robot.core.utils.TextFormatUtil;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetExerciseListPanel extends Sprite implements IModule
   {
      
      private var tt:uint;
      
      private var remove:uint;
      
      private var _info:PetListInfo;
      
      private var _point:Point;
      
      private var type:uint;
      
      private var mc:PetExerciseInterim_MC;
      
      private var _panelMc:PetExerciseList_MC;
      
      public function PetExerciseListPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panelMc);
      }
      
      private function onComHandler(e:PetEvent) : void
      {
         PetManager.removeEventListener(PetEvent.START_EXE_PET,onComHandler);
         if(NonoManager.info)
         {
            NonoManager.info.power -= remove;
         }
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      public function init(data:Object = null) : void
      {
         _info = data as PetListInfo;
      }
      
      private function showMsg() : void
      {
         if(MainManager.actorInfo.superNono == 1)
         {
            if(PetManager.exePetListMap.length == 0)
            {
               Alarm.show("使用" + TextFormatUtil.getRedTxt("其它训练") + "还可以再训练一只精灵。",startExe);
            }
            else
            {
               startExe();
            }
         }
         else
         {
            if(NonoManager.info.power < remove)
            {
               Alarm.show("你的NoNo能量不够,不能进行你选择的训练！");
               return;
            }
            startExe();
         }
      }
      
      private function onCloseBtnClickHandler(e:MouseEvent) : void
      {
         hide();
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         addEvent();
      }
      
      private function startExe() : void
      {
         for(var i1:int = 1; i1 <= 4; i1++)
         {
            _panelMc["btn" + i1].mouseEnabled = false;
         }
         PetManager.addEventListener(PetEvent.START_EXE_PET,onComHandler);
         PetManager.startExePet(_info.catchTime,type);
      }
      
      private function onListClickHandller(e:MouseEvent) : void
      {
         type = 0;
         switch(e.currentTarget)
         {
            case _panelMc["btn1"]:
               type = 1;
               break;
            case _panelMc["btn2"]:
               type = 3;
               break;
            case _panelMc["btn3"]:
               type = 5;
               break;
            case _panelMc["btn4"]:
               type = 7;
         }
         remove = type * 10;
         Alert.show("该课程需要消耗你的NoNo" + TextFormatUtil.getRedTxt(String(remove)) + "能量值\n如果" + TextFormatUtil.getRedTxt("停止训练") + "将不会得到任何经验值！",showMsg);
      }
      
      private function onDownHandler(e:MouseEvent) : void
      {
         _panelMc.startDrag();
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUphandler);
      }
      
      private function onUphandler(e:MouseEvent) : void
      {
         _panelMc.stopDrag();
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUphandler);
      }
      
      private function removeEvent() : void
      {
         _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         for(var i1:int = 1; i1 <= 4; i1++)
         {
            _panelMc["btn" + i1].removeEventListener(MouseEvent.CLICK,onListClickHandller);
         }
         _panelMc["dragMc"].removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
      }
      
      private function addEvent() : void
      {
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseBtnClickHandler);
         for(var i1:int = 1; i1 <= 4; i1++)
         {
            _panelMc["btn" + i1].addEventListener(MouseEvent.CLICK,onListClickHandller);
         }
         _panelMc["dragMc"].addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _panelMc = null;
         _point = null;
      }
      
      public function setup() : void
      {
         _panelMc = new PetExerciseList_MC();
      }
   }
}


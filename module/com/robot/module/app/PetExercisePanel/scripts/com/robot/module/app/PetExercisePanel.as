package com.robot.module.app
{
   import com.robot.app.petUpdate.PetUpdatePropController;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.config.xml.NatureXMLInfo;
   import com.robot.core.config.xml.PetXMLInfo;
   import com.robot.core.event.PetEvent;
   import com.robot.core.info.pet.ExeingPetInfo;
   import com.robot.core.info.pet.PetInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.NonoManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alert;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.ds.HashMap;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.ResourceManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class PetExercisePanel extends Sprite implements IModule
   {
      
      private var _curObj:ExeingPetInfo;
      
      private var _allInfoMap:HashMap;
      
      private var _curPet:DisplayObject;
      
      private var _curEndPet:PetInfo;
      
      private var _curPage:uint;
      
      private var _totalPage:uint;
      
      private var _panelMc:PetExercise_MC;
      
      public function PetExercisePanel()
      {
         super();
      }
      
      private static function onUpdateProp(e:SocketEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.NOTE_UPDATE_PROP,onUpdateProp);
         PetUpdatePropController.owner.show(true,false);
      }
      
      private function onStopExeHandler(e:PetEvent) : void
      {
         SocketConnection.removeCmdListener(CommandID.NOTE_UPDATE_PROP,onUpdateProp);
         hide();
      }
      
      public function hide() : void
      {
         removeEvent();
         DisplayUtil.removeForParent(_panelMc);
      }
      
      public function setup() : void
      {
         _panelMc = new PetExercise_MC();
         _panelMc["dragMc"].buttonMode = true;
      }
      
      private function check() : void
      {
         if(_curObj._flag == 0)
         {
            _panelMc["exeingMc"].visible = true;
            _panelMc["exeingMc"].gotoAndPlay(1);
            _panelMc["exeComMc"].visible = false;
            _panelMc["comBtn"].visible = false;
            _panelMc["stopExeBtn"].visible = true;
         }
         else
         {
            _panelMc["exeingMc"].gotoAndStop(1);
            _panelMc["exeingMc"].visible = false;
            _panelMc["exeComMc"].visible = true;
            _panelMc["comBtn"].visible = true;
            _panelMc["stopExeBtn"].visible = false;
         }
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(_panelMc);
         DisplayUtil.align(_panelMc,null,AlignType.MIDDLE_CENTER);
         if(_curObj)
         {
            getPet();
            getInfo();
            check();
            setPage();
            remainDate(String(_curObj._remainDay));
         }
         addEvent();
      }
      
      private function removeEvent() : void
      {
         SocketConnection.removeCmdListener(CommandID.NOTE_UPDATE_PROP,onUpdateProp);
         SocketConnection.removeCmdListener(CommandID.GET_PET_INFO,onGetSucHandler);
         if(_panelMc)
         {
            _panelMc["closeBtn"].removeEventListener(MouseEvent.CLICK,onCloseHandler);
            _panelMc["leftBtn"].removeEventListener(MouseEvent.CLICK,onLeftHandler);
            _panelMc["rightBtn"].removeEventListener(MouseEvent.CLICK,onReightHandler);
            _panelMc["dragMc"].removeEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
            _panelMc["otherBtn"].removeEventListener(MouseEvent.CLICK,onOtherBtnHandler);
            _panelMc["stopExeBtn"].removeEventListener(MouseEvent.CLICK,onStopHandler);
            _panelMc["comBtn"].removeEventListener(MouseEvent.CLICK,onComHandler);
         }
      }
      
      private function onComHandler(e:MouseEvent) : void
      {
         Alert.show("你确定要现在完成训练吗？",function():void
         {
            stopExe();
         });
      }
      
      public function init(data:Object = null) : void
      {
         _allInfoMap = data as HashMap;
         if(_allInfoMap.length <= 1)
         {
            _panelMc["leftBtn"].visible = false;
            _panelMc["rightBtn"].visible = false;
         }
         else
         {
            _panelMc["leftBtn"].visible = true;
            _panelMc["rightBtn"].visible = true;
         }
         _curPage = 1;
         _totalPage = _allInfoMap.length;
         _curObj = _allInfoMap.getValues()[0];
         if(MainManager.actorInfo.superNono != 1)
         {
            _panelMc["otherBtn"].visible = false;
         }
         else if(NonoManager.info.superLevel >= 5)
         {
            if(_allInfoMap.length < 3)
            {
               _panelMc["otherBtn"].visible = true;
            }
            else
            {
               _panelMc["otherBtn"].visible = false;
            }
         }
         else if(_allInfoMap.length < 2)
         {
            _panelMc["otherBtn"].visible = true;
         }
         else
         {
            _panelMc["otherBtn"].visible = false;
         }
      }
      
      private function setPage() : void
      {
         if(MainManager.actorInfo.superNono == 1)
         {
            if(NonoManager.info.superLevel >= 5)
            {
               _panelMc["pageTxt"].text = String(_allInfoMap.length) + "/3";
            }
            else
            {
               _panelMc["pageTxt"].text = String(_allInfoMap.length) + "/2";
            }
         }
         else
         {
            _panelMc["pageTxt"].text = "1/1";
         }
      }
      
      private function remainDate(s1:String) : void
      {
         _panelMc["timeTxt"].text = s1;
      }
      
      private function onReightHandler(e:MouseEvent) : void
      {
         if(_curPage < _totalPage)
         {
            _panelMc["leftBtn"].mouseEnabled = false;
            _panelMc["rightBtn"].mouseEnabled = false;
            ++_curPage;
            _curObj = _allInfoMap.getValues()[_curPage - 1];
            check();
            getPet();
            getInfo();
            remainDate(String(_curObj._remainDay));
         }
      }
      
      private function onUpHandler(e:MouseEvent) : void
      {
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_UP,onUpHandler);
         _panelMc.stopDrag();
      }
      
      private function onStopHandler(e:MouseEvent) : void
      {
         Alert.show("你确定要现在停止训练吗？如果停止将无法获得任何经验。",function():void
         {
            stopExe();
         });
      }
      
      private function getInfo() : void
      {
         SocketConnection.addCmdListener(CommandID.GET_PET_INFO,onGetSucHandler);
         SocketConnection.send(CommandID.GET_PET_INFO,_curObj._capTm);
      }
      
      private function onOtherBtnHandler(e:MouseEvent) : void
      {
         loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      private function onGetSucHandler(e:SocketEvent) : void
      {
         _panelMc["leftBtn"].mouseEnabled = true;
         _panelMc["rightBtn"].mouseEnabled = true;
         SocketConnection.removeCmdListener(CommandID.GET_PET_INFO,onGetSucHandler);
         _curEndPet = e.data as PetInfo;
         setPetInfo(_curEndPet);
      }
      
      private function getPet() : void
      {
         var url:String = ClientConfig.getPetSwfPath(_curObj._petId);
         ResourceManager.getResource(url,addPet,"pet");
      }
      
      private function onLeftHandler(e:MouseEvent) : void
      {
         if(_curPage > 1)
         {
            _panelMc["leftBtn"].mouseEnabled = false;
            _panelMc["rightBtn"].mouseEnabled = false;
            --_curPage;
            _curObj = _allInfoMap.getValues()[_curPage - 1];
            check();
            getPet();
            getInfo();
            remainDate(String(_curObj._remainDay));
         }
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.CLOSE));
      }
      
      private function setPetInfo(info:PetInfo) : void
      {
         _panelMc["numTxt"].text = info.id.toString();
         _panelMc["nameTxt"].text = PetXMLInfo.getName(info.id);
         _panelMc["levTxt"].text = info.level.toString();
         _panelMc["natureTxt"].text = NatureXMLInfo.getName(info.nature);
         _panelMc["hitTxt"].text = info.attack.toString();
         _panelMc["defenseTxt"].text = info.defence.toString();
         _panelMc["sphitTxt"].text = info.s_a.toString();
         _panelMc["spdefenseTxt"].text = info.s_d.toString();
         _panelMc["speedTxt"].text = info.speed.toString();
         _panelMc["powerTxt"].text = info.hp.toString();
      }
      
      private function stopExe() : void
      {
         PetManager.curEndPetInfo = _curEndPet;
         SocketConnection.addCmdListener(CommandID.NOTE_UPDATE_PROP,onUpdateProp);
         PetManager.addEventListener(PetEvent.STOP_EXE_PET,onStopExeHandler);
         PetManager.stopExePet(_curObj._petId,_curObj._capTm);
      }
      
      private function onDownHandler(e:MouseEvent) : void
      {
         LevelManager.stage.addEventListener(MouseEvent.MOUSE_UP,onUpHandler);
         _panelMc.startDrag();
      }
      
      private function addEvent() : void
      {
         _panelMc["closeBtn"].addEventListener(MouseEvent.CLICK,onCloseHandler);
         _panelMc["leftBtn"].addEventListener(MouseEvent.CLICK,onLeftHandler);
         _panelMc["rightBtn"].addEventListener(MouseEvent.CLICK,onReightHandler);
         _panelMc["dragMc"].addEventListener(MouseEvent.MOUSE_DOWN,onDownHandler);
         _panelMc["otherBtn"].addEventListener(MouseEvent.CLICK,onOtherBtnHandler);
         _panelMc["stopExeBtn"].addEventListener(MouseEvent.CLICK,onStopHandler);
         _panelMc["comBtn"].addEventListener(MouseEvent.CLICK,onComHandler);
      }
      
      public function destroy() : void
      {
         hide();
         _panelMc = null;
         _curPet = null;
         _curObj = null;
      }
      
      private function addPet(mc:DisplayObject) : void
      {
         if(_curPet)
         {
            _panelMc["petMc"].y -= _panelMc["petMc"].height / 2;
            DisplayUtil.removeForParent(_curPet);
            _curPet = null;
         }
         _curPet = mc;
         if(_curPet)
         {
            _panelMc["petMc"].addChild(_curPet);
            _panelMc["petMc"].y += _panelMc["petMc"].height / 2;
            _panelMc["petMc"].scaleX = 2.5;
            _panelMc["petMc"].scaleY = 2.5;
         }
      }
   }
}


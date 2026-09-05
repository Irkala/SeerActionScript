package com.robot.module.app
{
   import com.robot.app.sptStar.LeiyiTrainController;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.TasksManager;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import org.taomee.effect.ColorFilter;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class LeiyiSkillTrainPanel extends Sprite implements IModule
   {
      
      private var _mainMc:MovieClip;
      
      private var _tipMc:MovieClip;
      
      private var _curMapID:uint;
      
      private var _curTaskID:uint;
      
      private const _taskIdA:Array = [121,122,122,122,122];
      
      private const _mapIdA:Array = [17,27,49,40,32];
      
      public function LeiyiSkillTrainPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._mainMc = new SkillTrain_Mc();
         this._tipMc = new SkillTip_Mc();
      }
      
      public function init(data:Object = null) : void
      {
         var isShow:Boolean = data as Boolean;
         this._mainMc["returnBtn"].visible = isShow;
      }
      
      public function show() : void
      {
         LevelManager.appLevel.addChild(this._mainMc);
         this.addEvent();
      }
      
      private function addEvent() : void
      {
         var i:uint;
         this._mainMc["inBtn"].addEventListener(MouseEvent.MOUSE_OVER,this.onInOverHandler);
         this._mainMc["inBtn"].addEventListener(MouseEvent.MOUSE_OUT,this.onInOutHandler);
         this._mainMc["closeBtn"].addEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this._mainMc["returnBtn"].addEventListener(MouseEvent.CLICK,this.onReturnHandler);
         this._tipMc["goBtn"].addEventListener(MouseEvent.CLICK,this.onGoHandler);
         this._tipMc["closeBtn"].addEventListener(MouseEvent.CLICK,this.onCloseTipHandler);
         this._mainMc["inMc"].gotoAndStop(1);
         this._mainMc["pet_4"].visible = false;
         this._mainMc["finalBg"].visible = false;
         for(i = 0; i < 5; i++)
         {
            this._mainMc["pet_" + i].buttonMode = true;
            this._mainMc["pet_" + i].mouseEnabled = false;
            this._mainMc["pet_" + i].mouseChildren = false;
            this._mainMc["pet_" + i].filters = [ColorFilter.setGrayscale()];
            this._mainMc["pet_" + i].addEventListener(MouseEvent.CLICK,this.onPetClick);
            this._mainMc["pet_" + i]["mc"].visible = false;
         }
         if(TasksManager.getTaskStatus(121) == TasksManager.COMPLETE)
         {
            this._mainMc["pet_0"].filters = [];
            this._mainMc["pet_0"]["mc"].visible = true;
            if(TasksManager.getTaskStatus(122) == TasksManager.UN_ACCEPT)
            {
               this._mainMc["pet_1"].mouseEnabled = true;
               this._mainMc["pet_1"].mouseChildren = true;
            }
            else if(TasksManager.getTaskStatus(122) == TasksManager.ALR_ACCEPT)
            {
               TasksManager.getProStatusList(122,function(a:Array):void
               {
                  for(var j:uint = 1; j < 5; j++)
                  {
                     if(!Boolean(a[j - 1]))
                     {
                        if(j == 4)
                        {
                           _mainMc["pet_4"].visible = true;
                           _mainMc["finalBg"].visible = true;
                        }
                        _mainMc["pet_" + j].filters = [];
                        _mainMc["pet_" + j].mouseEnabled = true;
                        _mainMc["pet_" + j].mouseChildren = true;
                        return;
                     }
                     _mainMc["pet_" + j].filters = [];
                     _mainMc["pet_" + j]["mc"].visible = true;
                  }
               });
            }
            else if(TasksManager.getTaskStatus(122) == TasksManager.COMPLETE)
            {
               this._mainMc["pet_4"].visible = true;
               this._mainMc["pet_4"].filters = [];
               this._mainMc["pet_4"].mouseEnabled = true;
               this._mainMc["pet_4"].mouseChildren = true;
               this._mainMc["finalBg"].visible = true;
            }
         }
         else
         {
            this._mainMc["pet_0"].filters = [];
            this._mainMc["pet_0"].mouseEnabled = true;
            this._mainMc["pet_0"].mouseChildren = true;
         }
      }
      
      private function onPetClick(e:MouseEvent) : void
      {
         var name:String = e.currentTarget.name;
         if(name == "pet_4")
         {
            this.hide();
            LeiyiTrainController.fightJiaLeiyi();
            return;
         }
         var index:uint = uint(name.split("_")[1]);
         this._curTaskID = this._taskIdA[index];
         this._curMapID = this._mapIdA[index];
         this._mainMc.addChild(this._tipMc);
         this._tipMc.gotoAndStop(index + 1);
      }
      
      private function onInOverHandler(e:MouseEvent) : void
      {
         this._mainMc["inMc"].gotoAndPlay(2);
      }
      
      private function onInOutHandler(e:MouseEvent) : void
      {
         this._mainMc["inMc"].gotoAndStop(1);
      }
      
      private function onCloseHandler(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function onReturnHandler(e:MouseEvent) : void
      {
         this.hide();
         this.loaderInfo.sharedEvents.dispatchEvent(new Event(Event.OPEN));
      }
      
      private function onGoHandler(e:MouseEvent) : void
      {
         if(TasksManager.getTaskStatus(this._curTaskID) == TasksManager.UN_ACCEPT)
         {
            TasksManager.accept(this._curTaskID,function(b:Boolean):void
            {
               if(b)
               {
                  hide();
                  MapManager.changeMap(_curMapID);
               }
            });
         }
         else
         {
            this.hide();
            MapManager.changeMap(this._curMapID);
         }
      }
      
      private function onCloseTipHandler(e:MouseEvent) : void
      {
         DisplayUtil.removeForParent(this._tipMc);
      }
      
      public function hide() : void
      {
         this._mainMc["inBtn"].removeEventListener(MouseEvent.MOUSE_OVER,this.onInOverHandler);
         this._mainMc["inBtn"].removeEventListener(MouseEvent.MOUSE_OUT,this.onInOutHandler);
         this._mainMc["closeBtn"].removeEventListener(MouseEvent.CLICK,this.onCloseHandler);
         this._mainMc["returnBtn"].removeEventListener(MouseEvent.CLICK,this.onReturnHandler);
         this._tipMc["goBtn"].removeEventListener(MouseEvent.CLICK,this.onGoHandler);
         this._tipMc["closeBtn"].removeEventListener(MouseEvent.CLICK,this.onCloseTipHandler);
         for(var i:uint = 0; i < 5; i++)
         {
            this._mainMc["pet_" + i].removeEventListener(MouseEvent.CLICK,this.onPetClick);
         }
         DisplayUtil.removeForParent(this._mainMc);
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         this._mainMc = null;
         this._tipMc = null;
      }
   }
}


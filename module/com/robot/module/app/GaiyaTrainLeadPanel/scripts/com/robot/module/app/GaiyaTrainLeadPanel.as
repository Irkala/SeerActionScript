package com.robot.module.app
{
   import com.robot.app.info.GaiyaEffectInfo;
   import com.robot.app.sptStar.GaiyaEvent;
   import com.robot.core.CommandID;
   import com.robot.core.config.ClientConfig;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.ModuleManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.mode.AppModel;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.getDefinitionByName;
   import org.taomee.events.SocketEvent;
   import org.taomee.manager.EventManager;
   import org.taomee.module.IModule;
   import org.taomee.utils.AlignType;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#ffffff", frameRate="24")]
   public class GaiyaTrainLeadPanel extends Sprite implements IModule
   {
      
      private var _ui:MovieClip;
      
      private var _haveSkillArr:Array = [];
      
      public function GaiyaTrainLeadPanel()
      {
         super();
      }
      
      public function setup() : void
      {
         this._ui = new GaiyaTrainLeadPanel_UI();
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function show() : void
      {
         if(this._ui == null)
         {
            this._ui = new GaiyaTrainLeadPanel_UI();
         }
         LevelManager.closeMouseEvent();
         DisplayUtil.align(this._ui,null,AlignType.MIDDLE_CENTER);
         this.addEvent();
         LevelManager.appLevel.addChild(this._ui);
      }
      
      private function addEvent() : void
      {
         this._ui["close"].addEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["check"].visible = false;
         this._ui["check"].addEventListener(MouseEvent.CLICK,this.onCheck);
         this._ui["reset"].addEventListener(MouseEvent.CLICK,this.onReset);
         this._ui["start_1"].addEventListener(MouseEvent.CLICK,this.onShiXue);
         this._ui["start_2"].addEventListener(MouseEvent.CLICK,this.onXieQi);
         this._ui["start_3"].addEventListener(MouseEvent.CLICK,this.onShiPo);
         SocketConnection.addCmdListener(CommandID.M_2149,this.onGaiyaEffect);
         SocketConnection.send(CommandID.M_2149);
      }
      
      private function onGaiyaEffect(e:SocketEvent) : void
      {
         var info:GaiyaEffectInfo;
         var i:uint;
         var bytes:Object;
         var defOrCount:uint;
         var count:uint;
         SocketConnection.removeCmdListener(CommandID.M_2149,this.onGaiyaEffect);
         info = e.data as GaiyaEffectInfo;
         i = 1;
         if(info == null)
         {
            try
            {
               bytes = e.data;
               if(bytes && "readUnsignedInt" in bytes && "bytesAvailable" in bytes)
               {
                  bytes.position = 0;
                  if(bytes.bytesAvailable >= 8)
                  {
                     bytes.readUnsignedInt();
                     defOrCount = uint(bytes.readUnsignedInt());
                     count = 0;
                     if(bytes.bytesAvailable >= 4)
                     {
                        count = uint(bytes.readUnsignedInt());
                     }
                     else
                     {
                        count = defOrCount;
                     }
                     info = new GaiyaEffectInfo();
                     info.effects = [];
                     i = 0;
                     while(i < count && bytes.bytesAvailable >= 4)
                     {
                        info.effects.push(bytes.readUnsignedInt());
                        i++;
                     }
                  }
               }
            }
            catch(error:*)
            {
               info = null;
            }
         }
         if(info == null || info.effects == null)
         {
            this._haveSkillArr = [0,0,0];
            return;
         }
         i = 1;
         while(i <= 3)
         {
            if(info.effects.indexOf(i) == -1)
            {
               this._haveSkillArr[i - 1] = 0;
            }
            else
            {
               this._haveSkillArr[i - 1] = 1;
            }
            i++;
         }
      }
      
      private function onCheck(e:MouseEvent) : void
      {
         this.hide();
         ModuleManager.showModule(ClientConfig.getAppModule("GaiyaTrainPanel"),"正在加载盖亚魂印重组面板...",true);
      }
      
      private function onReset(e:MouseEvent) : void
      {
         this.hide();
         var app:AppModel = new AppModel(ClientConfig.getAppModule("GaiyaFetchSetPanel"),"正在加载盖亚魂印重组面板...");
         app.setup();
         app.show();
      }
      
      private function onShiXue(e:MouseEvent) : void
      {
         if(Boolean(this._haveSkillArr[0]))
         {
            Alarm.show("你已经领悟到技能“嗜血之力”了！");
            return;
         }
         this.hide();
         if(MapManager.currentMap.id == 65)
         {
            getDefinitionByName("com.robot.app2.mapProcess.control.activityControl.AresUnionChallengeController").fightWithGaiya(1);
         }
         else
         {
            TasksManager.accept(622);
            EventManager.dispatchEvent(new GaiyaEvent(GaiyaEvent.INTENSIFY_TRAIN,1));
         }
      }
      
      private function onXieQi(e:MouseEvent) : void
      {
         if(Boolean(this._haveSkillArr[1]))
         {
            Alarm.show("你已经领悟到技能“邪气凛然”了！");
            return;
         }
         if(this._haveSkillArr[0] == 0)
         {
            Alarm.show("必须先完成“嗜血之力”的特训！");
            return;
         }
         this.hide();
         if(MapManager.currentMap.id == 65)
         {
            getDefinitionByName("com.robot.app2.mapProcess.control.activityControl.AresUnionChallengeController").fightWithGaiya(2);
         }
         else
         {
            TasksManager.accept(627);
            EventManager.dispatchEvent(new GaiyaEvent(GaiyaEvent.INTENSIFY_TRAIN,2));
         }
      }
      
      private function onShiPo(e:MouseEvent) : void
      {
         if(Boolean(this._haveSkillArr[2]))
         {
            Alarm.show("你已经领悟到技能“石破天惊”了！");
            return;
         }
         if(this._haveSkillArr[0] == 0 || this._haveSkillArr[1] == 0)
         {
            Alarm.show("必须先完成“嗜血之力”和“邪气凛然”的特训！");
            return;
         }
         this.hide();
         if(MapManager.currentMap.id == 65)
         {
            getDefinitionByName("com.robot.app2.mapProcess.control.activityControl.AresUnionChallengeController").fightWithGaiya(3);
         }
         else
         {
            TasksManager.accept(634);
            EventManager.dispatchEvent(new GaiyaEvent(GaiyaEvent.INTENSIFY_TRAIN,3));
         }
      }
      
      private function onClose(e:MouseEvent) : void
      {
         this.hide();
      }
      
      private function removeEvent() : void
      {
         this._ui["close"].removeEventListener(MouseEvent.CLICK,this.onClose);
         this._ui["check"].removeEventListener(MouseEvent.CLICK,this.onCheck);
         this._ui["reset"].removeEventListener(MouseEvent.CLICK,this.onReset);
         this._ui["start_1"].removeEventListener(MouseEvent.CLICK,this.onShiXue);
         this._ui["start_2"].removeEventListener(MouseEvent.CLICK,this.onXieQi);
         this._ui["start_3"].removeEventListener(MouseEvent.CLICK,this.onShiPo);
      }
      
      public function hide() : void
      {
         LevelManager.openMouseEvent();
         this.removeEvent();
         DisplayUtil.removeForParent(this._ui);
         ModuleManager.destroyForInstance(this);
      }
      
      public function destroy() : void
      {
         this.hide();
         this._ui = null;
      }
   }
}


package com.robot.module.app
{
   import com.robot.app.fight.FightManager;
   import com.robot.core.CommandID;
   import com.robot.core.dispatcher.FightDispatcher;
   import com.robot.core.event.PetFightEvent;
   import com.robot.core.info.pet.PetListInfo;
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.manager.TasksManager;
   import com.robot.core.net.SocketConnection;
   import com.robot.core.npc.NPC;
   import com.robot.core.npc.NpcDialog;
   import com.robot.core.ui.alert.Alarm;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.utils.ByteArray;
   import org.taomee.events.SocketEvent;
   import org.taomee.module.IModule;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class YiNengBossPanel extends Sprite implements IModule
   {
      
      private var _mainUI:YiNengBossPanel_UI;
      
      public function YiNengBossPanel()
      {
         super();
      }
      
      public function hide() : void
      {
         if(DisplayUtil.hasParent(_mainUI))
         {
            _mainUI["close"].removeEventListener(MouseEvent.CLICK,onCloseClick);
            DisplayUtil.removeForParent(_mainUI);
         }
      }
      
      public function show() : void
      {
         if(!DisplayUtil.hasParent(_mainUI))
         {
            LevelManager.appLevel.addChild(_mainUI);
            _mainUI.x = 158;
            _mainUI.y = 66;
            _mainUI["close"].addEventListener(MouseEvent.CLICK,onCloseClick);
            initRound();
         }
         if(TasksManager.getTaskStatus(758) == TasksManager.COMPLETE && TasksManager.getTaskStatus(759) == TasksManager.COMPLETE && TasksManager.getTaskStatus(760) == TasksManager.COMPLETE && TasksManager.getTaskStatus(761) == TasksManager.COMPLETE && TasksManager.getTaskStatus(762) == TasksManager.COMPLETE && TasksManager.getTaskStatus(763) == TasksManager.COMPLETE)
         {
            _mainUI["finalBtn"].addEventListener(MouseEvent.CLICK,onFinal);
         }
         else
         {
            DisplayUtil.removeForParent(_mainUI["finalBtn"]);
         }
      }
      
      private function onFightClick(evt:MouseEvent) : void
      {
         var str:String = null;
         var results:Array = null;
         var region:uint = 0;
         if(!checkPetLevel())
         {
            NpcDialog.show(NPC.GUANMING_YINENGWANG,["这股能量不是你可以阻挡的，你需要寻找精灵伙伴的帮助，当你拥有6只100级的精灵才能挑战六重试炼！"],["哦，我知道了！"]);
            hide();
         }
         else
         {
            str = evt.target.name;
            results = str.split("_");
            region = uint(results[1]) - 1;
            FightManager.fightWithBoss("光明异能王",region);
         }
      }
      
      private function checkPetLevel() : Boolean
      {
         var i:int = 0;
         var valid:Boolean = true;
         var array:Array = PetManager.getBagMap();
         if(array.length == 6)
         {
            for(i = 0; i < array.length; i++)
            {
               if(PetManager.getPetInfo((array[i] as PetListInfo).catchTime).level < 100)
               {
                  valid = false;
                  break;
               }
            }
         }
         else
         {
            valid = false;
         }
         return valid;
      }
      
      private function onFinal(evt:MouseEvent) : void
      {
         SocketConnection.addCmdListener(CommandID.FUCK_SHINEHOO_TIMES,function(e:SocketEvent):void
         {
            var b:ByteArray;
            var i:int;
            SocketConnection.removeCmdListener(CommandID.FUCK_SHINEHOO_TIMES,arguments.callee);
            b = e.data as ByteArray;
            i = int(b.readUnsignedInt());
            if(i)
            {
               Alarm.show("每天只能挑战一次，明天再来！");
            }
            else
            {
               FightManager.fightWithBoss("最终异能王",6);
               FightDispatcher.addEventListener(PetFightEvent.ALARM_CLICK,function():void
               {
                  FightDispatcher.removeEventListener(PetFightEvent.ALARM_CLICK,arguments.callee);
                  SocketConnection.send(9288);
               });
            }
         });
         SocketConnection.send(CommandID.FUCK_SHINEHOO_TIMES,10022);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup() : void
      {
         _mainUI = new YiNengBossPanel_UI();
      }
      
      private function onCloseClick(evt:MouseEvent) : void
      {
         hide();
      }
      
      public function destroy() : void
      {
         for(var i:uint = 1; i <= 6; i++)
         {
            _mainUI["round_" + i].removeEventListener(MouseEvent.CLICK,onFightClick);
         }
         _mainUI["close"].removeEventListener(MouseEvent.CLICK,onCloseClick);
         _mainUI["finalBtn"].removeEventListener(MouseEvent.CLICK,onFinal);
         hide();
         _mainUI = null;
      }
      
      private function initRound() : void
      {
         var round:uint = 6;
         for(var i:uint = 1; i <= round; i++)
         {
            _mainUI["round_" + i].addEventListener(MouseEvent.CLICK,onFightClick);
         }
      }
   }
}


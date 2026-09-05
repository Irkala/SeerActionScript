package com.robot.ext
{
   import com.robot.core.event.MapEvent;
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.manager.MapManager;
   import com.robot.core.manager.PetManager;
   import com.robot.core.mode.IFunUnit;
   import com.robot.core.ui.alert.Alarm;
   import com.robot.core.ui.alert.Alert;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_2 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var isWalk:Boolean = false;
      
      public function Ext_2()
      {
         super();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         onMapDown(null);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         if(!_sprite.transform.pixelBounds.intersection(MainManager.actorModel.hitRect).isEmpty())
         {
            fillBlood();
            return;
         }
         isWalk = true;
         MapManager.addEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.addEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
         MainManager.actorModel.walkAction(new Point(e.stageX,e.stageY));
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
      }
      
      private function onMapDown(e:MapEvent) : void
      {
         MapManager.removeEventListener(MapEvent.MAP_MOUSE_DOWN,onMapDown);
         MainManager.actorModel.removeEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function fillBlood() : void
      {
         if(PetManager.length == 0)
         {
            Alarm.show("       你精灵背包里没有精灵。这台机器可以帮助你恢复所有精灵的体力。");
            return;
         }
         if(MainManager.actorInfo.vip)
         {
            PetManager.cureAll();
         }
         else
         {
            Alert.show("恢复体力需要花费50赛尔豆，你确定要为你的精灵们恢复体力吗？",function():void
            {
               PetManager.cureAll();
            });
         }
      }
      
      private function onWalkEnter(e:RobotEvent) : void
      {
         if(!isWalk)
         {
            return;
         }
         if(!_sprite.transform.pixelBounds.intersection(MainManager.actorModel.hitRect).isEmpty())
         {
            trace("治疗精灵");
            isWalk = false;
            MainManager.actorModel.stop();
            onMapDown(null);
            fillBlood();
            return;
         }
      }
   }
}


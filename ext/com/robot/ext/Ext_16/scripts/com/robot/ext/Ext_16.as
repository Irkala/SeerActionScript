package com.robot.ext
{
   import com.robot.core.event.RobotEvent;
   import com.robot.core.manager.MainManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import org.taomee.manager.DepthManager;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_16 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _visw:Boolean = true;
      
      public function Ext_16()
      {
         super();
      }
      
      public function destroy() : void
      {
         _sprite.removeEventListener(MouseEvent.CLICK,onClick);
         MainManager.actorModel.removeEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
         DisplayUtil.removeForParent(_sprite);
         _sprite = null;
      }
      
      private function onClick(e:MouseEvent) : void
      {
         MainManager.actorModel.addEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
         MainManager.actorModel.walkAction(new Point(e.stageX,e.stageY + 10));
         exeaction();
      }
      
      private function exeaction() : void
      {
         if(_sprite.hitTestPoint(MainManager.actorModel.x,MainManager.actorModel.y))
         {
            if(!_visw)
            {
               _visw = true;
               MainManager.actorModel.removeEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
               MainManager.actorModel.stop();
               MainManager.actorModel.pos = _sprite.localToGlobal(new Point());
               DepthManager.bringToTop(MainManager.actorModel);
            }
         }
         else if(_visw)
         {
            _visw = false;
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      public function setup(ui:Sprite) : void
      {
         _sprite = ui;
         _sprite.mouseChildren = false;
         _sprite.addEventListener(MouseEvent.CLICK,onClick);
         MainManager.actorModel.addEventListener(RobotEvent.WALK_ENTER_FRAME,onWalkEnter);
      }
      
      private function onWalkEnter(e:RobotEvent) : void
      {
         exeaction();
      }
   }
}


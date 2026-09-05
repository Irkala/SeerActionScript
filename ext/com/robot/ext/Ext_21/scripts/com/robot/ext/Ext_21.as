package com.robot.ext
{
   import com.robot.core.manager.LevelManager;
   import com.robot.core.manager.TaskIconManager;
   import com.robot.core.mode.IFunUnit;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.ui.Mouse;
   import org.taomee.utils.DisplayUtil;
   
   [SWF(width="500", height="375", backgroundColor="#869ca7", frameRate="24")]
   public class Ext_21 extends Sprite implements IFunUnit
   {
      
      private var _sprite:Sprite;
      
      private var _point:Point;
      
      private var _humMc:MovieClip;
      
      public function Ext_21()
      {
         super();
      }
      
      private function onClickHandler(e:MouseEvent) : void
      {
         _point = _sprite.globalToLocal(new Point(_sprite.mouseX,_sprite.mouseY));
         if(MovieClip(_sprite["mc"]).currentFrame == 1)
         {
            MovieClip(_sprite["mc"]).gotoAndStop(2);
            Mouse.hide();
            _humMc = TaskIconManager.getIcon("HammerMc") as MovieClip;
            _humMc.gotoAndStop(1);
            LevelManager.topLevel.addChild(_humMc);
            _humMc.x = _point.x;
            _humMc.y = _point.y;
            _humMc.addEventListener(MouseEvent.CLICK,onHumClickHandler);
            LevelManager.stage.addEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
         }
         else
         {
            onHumClickHandler(null);
         }
      }
      
      private function onHumClickHandler(e:MouseEvent) : void
      {
         _humMc.gotoAndPlay(2);
         if(_humMc.hitTestObject(_sprite) == false)
         {
            MovieClip(_sprite["mc"]).gotoAndStop(1);
            Mouse.show();
            _humMc.removeEventListener(MouseEvent.CLICK,onHumClickHandler);
            DisplayUtil.removeForParent(_humMc);
            _humMc = null;
            LevelManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
            _sprite.addEventListener(MouseEvent.CLICK,onClickHandler);
         }
         else
         {
            check();
         }
      }
      
      public function destroy() : void
      {
         LevelManager.stage.removeEventListener(MouseEvent.MOUSE_MOVE,onMouseMoveHandler);
         if(_humMc)
         {
            _humMc.removeEventListener(MouseEvent.CLICK,onHumClickHandler);
            DisplayUtil.removeForParent(_humMc);
            _humMc = null;
         }
         Mouse.show();
      }
      
      public function setup(sp:Sprite) : void
      {
         _sprite = sp;
         MovieClip(_sprite["mc"]).gotoAndStop(1);
         _sprite.addEventListener(MouseEvent.CLICK,onClickHandler);
      }
      
      private function check() : void
      {
         for(var i1:int = 0; i1 < 7; i1++)
         {
            if(_humMc.hitTestObject(MovieClip(_sprite["mc"]["mm"]["mc" + i1])))
            {
               MovieClip(_sprite["mc"]["mm"]["mc" + i1]).gotoAndPlay(2);
               return;
            }
         }
      }
      
      public function init(data:Object = null) : void
      {
      }
      
      private function onMouseMoveHandler(e:MouseEvent) : void
      {
         if(_humMc)
         {
            _humMc.gotoAndStop(1);
            _humMc.x = LevelManager.stage.mouseX;
            _humMc.y = LevelManager.stage.mouseY;
         }
      }
   }
}


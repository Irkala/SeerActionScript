package com.robot.module.app.cutBmp.cutWithChat.drawAction
{
   import com.robot.core.manager.MainManager;
   import com.robot.module.app.CutBmp;
   import com.robot.module.app.cutBmp.IDrawAction;
   import com.robot.module.app.cutBmp.cutWithChat.LineSprite;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   
   public class RectDrawAction implements IDrawAction
   {
      
      protected var sprite:Sprite;
      
      protected var bg:Sprite;
      
      protected var _startPoint:Point;
      
      protected var _endPoint:Point;
      
      protected var isDown:Boolean = false;
      
      public function RectDrawAction(bg:Sprite)
      {
         super();
         this.bg = bg;
         addEvent();
      }
      
      private function addEvent() : void
      {
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_DOWN,downHandler);
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_UP,upHandler);
         MainManager.getStage().addEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
      }
      
      public function destroy() : void
      {
         removeEvent();
         sprite = null;
      }
      
      protected function drawPic() : void
      {
         sprite.graphics.clear();
         sprite.graphics.lineStyle(1);
         sprite.graphics.drawRect(0,0,_endPoint.x - _startPoint.x,_endPoint.y - _startPoint.y);
      }
      
      private function downHandler(event:MouseEvent) : void
      {
         if(bg.hitTestPoint(event.stageX,event.stageY))
         {
            isDown = true;
            startPoint = new Point(event.stageX,event.stageY);
         }
      }
      
      private function moveHandler(event:MouseEvent) : void
      {
         if(isDown && bg.hitTestPoint(event.stageX,event.stageY))
         {
            endPoit = new Point(event.stageX,event.stageY);
         }
      }
      
      private function removeEvent() : void
      {
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_DOWN,downHandler);
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_UP,upHandler);
         MainManager.getStage().removeEventListener(MouseEvent.MOUSE_MOVE,moveHandler);
      }
      
      public function set endPoit(p:Point) : void
      {
         _endPoint = p;
         drawPic();
      }
      
      public function set startPoint(p:Point) : void
      {
         _startPoint = p;
         sprite = new Sprite();
         sprite.x = _startPoint.x;
         sprite.y = _startPoint.y;
         CutBmp.bmpLevel.addChild(sprite);
         LineSprite.picArray.push(sprite);
      }
      
      private function upHandler(event:MouseEvent) : void
      {
         isDown = false;
      }
   }
}


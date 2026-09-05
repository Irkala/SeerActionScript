package com.robot.module.app.cutBmp.cutWithChat
{
   import flash.display.Sprite;
   import flash.geom.Point;
   import org.taomee.utils.DisplayUtil;
   
   public class CutWithChatPanel extends Sprite
   {
      
      private var _startPoint:Point;
      
      private var _rectSprite:LineSprite;
      
      private var _endPoint:Point;
      
      public function CutWithChatPanel()
      {
         super();
         _rectSprite = new LineSprite(this);
         addChild(_rectSprite);
      }
      
      public function mouseUp() : void
      {
         _rectSprite.addEvent();
      }
      
      public function set endPoint(p:Point) : void
      {
         _endPoint = p;
         showRect();
      }
      
      public function get startPoint() : Point
      {
         return _startPoint;
      }
      
      public function get endPoint() : Point
      {
         return _endPoint;
      }
      
      public function showRect() : void
      {
         _rectSprite.drawRect(_startPoint,_endPoint);
      }
      
      public function destroy() : void
      {
         _rectSprite.destroy();
         DisplayUtil.removeForParent(_rectSprite);
         _rectSprite = null;
      }
      
      public function set startPoint(p:Point) : void
      {
         _startPoint = p;
         if(!_endPoint)
         {
            endPoint = new Point(p.x + 1,p.y + 1);
         }
      }
   }
}


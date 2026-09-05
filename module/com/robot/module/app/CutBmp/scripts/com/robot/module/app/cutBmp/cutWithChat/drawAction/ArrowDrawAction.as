package com.robot.module.app.cutBmp.cutWithChat.drawAction
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Point;
   
   public class ArrowDrawAction extends RectDrawAction
   {
      
      private var arraowMC:MovieClip;
      
      public function ArrowDrawAction(bg:Sprite)
      {
         super(bg);
      }
      
      override protected function drawPic() : void
      {
         sprite.graphics.clear();
         sprite.graphics.lineStyle(1);
         sprite.graphics.lineTo(_endPoint.x - _startPoint.x,_endPoint.y - _startPoint.y);
         arraowMC.x = _endPoint.x - _startPoint.x;
         arraowMC.y = _endPoint.y - _startPoint.y;
         var l:Number = Math.atan2(_endPoint.y - _startPoint.y,_endPoint.x - _startPoint.x);
         var r:Number = l / (Math.PI / 180);
         arraowMC.rotation = r;
      }
      
      override public function destroy() : void
      {
         super.destroy();
         arraowMC = null;
      }
      
      override public function set startPoint(p:Point) : void
      {
         super.startPoint = p;
         arraowMC = new ui_cutBmpArrowMC();
         sprite.addChild(arraowMC);
      }
   }
}


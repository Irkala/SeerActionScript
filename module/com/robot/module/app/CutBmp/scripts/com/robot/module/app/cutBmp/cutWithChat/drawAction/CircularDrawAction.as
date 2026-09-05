package com.robot.module.app.cutBmp.cutWithChat.drawAction
{
   import flash.display.Sprite;
   
   public class CircularDrawAction extends RectDrawAction
   {
      
      public function CircularDrawAction(bg:Sprite)
      {
         super(bg);
      }
      
      override protected function drawPic() : void
      {
         sprite.graphics.clear();
         sprite.graphics.lineStyle(1);
         sprite.graphics.drawEllipse(0,0,_endPoint.x - _startPoint.x,_endPoint.y - _startPoint.y);
      }
   }
}


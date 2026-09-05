package com.robot.module.app.cutBmp.cutWithChat
{
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.geom.Rectangle;
   
   public dynamic class DragDot extends Sprite
   {
      
      public var dotRotation:Number;
      
      private var mc:MovieClip;
      
      private var _dragRect:Rectangle;
      
      public var isPress:Boolean;
      
      public function DragDot()
      {
         super();
         this.mouseChildren = false;
         mc = new ui_cutBmpDotMC();
         addChild(mc);
      }
      
      public function set dragRect(rect:Rectangle) : void
      {
         _dragRect = rect;
      }
      
      public function get dragRect() : Rectangle
      {
         return _dragRect;
      }
      
      public function destroy() : void
      {
         mc = null;
      }
   }
}


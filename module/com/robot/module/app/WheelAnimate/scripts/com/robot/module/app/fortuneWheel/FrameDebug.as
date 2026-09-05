package com.robot.module.app.fortuneWheel
{
   import flash.display.MovieClip;
   
   public class FrameDebug
   {
      
      private static var _frame:int;
      
      private static var _mc:MovieClip;
      
      public function FrameDebug()
      {
         super();
      }
      
      public static function debug(mc:MovieClip, frames:Array = null) : void
      {
         if(_mc != mc)
         {
            _mc = mc;
            _frame = mc.currentFrame;
         }
         else if(_frame == mc.currentFrame)
         {
            if(Boolean(frames))
            {
               if(frames.indexOf(mc.currentFrame) == -1)
               {
                  mc.gotoAndPlay(mc.currentFrame + 1);
               }
            }
            else
            {
               mc.gotoAndPlay(mc.currentFrame + 1);
            }
         }
         else
         {
            _frame = mc.currentFrame;
         }
      }
   }
}


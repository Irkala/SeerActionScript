package _10013_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol218")]
   public dynamic class Timeline_71 extends MovieClip
   {
      
      public function Timeline_71()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         mouseChildren = false;
         addEventListener(MouseEvent.MOUSE_OVER,function(param1:MouseEvent):void
         {
            if(currentFrame == 1)
            {
               gotoAndPlay(1);
            }
         });
      }
   }
}


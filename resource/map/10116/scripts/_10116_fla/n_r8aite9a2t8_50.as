package _10116_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol339")]
   public dynamic class n_r8aite9a2t8_50 extends MovieClip
   {
      
      public function n_r8aite9a2t8_50()
      {
         super();
         addFrameScript(0,this.frame1);
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


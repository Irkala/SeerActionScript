package _362_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol213")]
   public dynamic class n_1b8s86a0dnq0_42 extends MovieClip
   {
      
      public function n_1b8s86a0dnq0_42()
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


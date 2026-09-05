package _10014_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol145")]
   public dynamic class n_eqba9msvpto_51 extends MovieClip
   {
      
      public function n_eqba9msvpto_51()
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


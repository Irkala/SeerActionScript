package §323_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol137")]
   public dynamic class caocong4pp_42 extends MovieClip
   {
      
      public function caocong4pp_42()
      {
         super();
         addFrameScript(0,frame1,77,frame78);
      }
      
      public function clickHandler(param1:MouseEvent) : void
      {
         play();
      }
      
      internal function frame1() : *
      {
         stop();
         buttonMode = true;
         addEventListener(MouseEvent.MOUSE_OVER,clickHandler);
      }
      
      internal function frame78() : *
      {
      }
   }
}


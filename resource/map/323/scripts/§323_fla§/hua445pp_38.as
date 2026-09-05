package §323_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol132")]
   public dynamic class hua445pp_38 extends MovieClip
   {
      
      public function hua445pp_38()
      {
         super();
         addFrameScript(0,frame1);
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
   }
}


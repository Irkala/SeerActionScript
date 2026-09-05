package §27_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol515")]
   public dynamic class maomaomc00_155 extends MovieClip
   {
      
      public function maomaomc00_155()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.addEventListener(MouseEvent.MOUSE_DOWN,onMouseDowm);
      }
      
      public function onMouseDowm(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
   }
}


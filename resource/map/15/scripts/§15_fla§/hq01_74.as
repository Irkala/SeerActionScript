package §15_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol267")]
   public dynamic class hq01_74 extends MovieClip
   {
      
      public function hq01_74()
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


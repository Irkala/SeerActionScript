package §33_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class sj03_8 extends MovieClip
   {
      
      public function sj03_8()
      {
         super();
         addFrameScript(0,frame1,1,frame2);
      }
      
      public function onMouseOut(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
      
      public function onMouseOver(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      internal function frame1() : *
      {
         stop();
         this.addEventListener(MouseEvent.MOUSE_OVER,onMouseOver);
         this.addEventListener(MouseEvent.MOUSE_OUT,onMouseOut);
      }
      
      internal function frame2() : *
      {
         stop();
      }
   }
}


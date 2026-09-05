package §105_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol160")]
   public dynamic class tiaodongmc_28 extends MovieClip
   {
      
      public function tiaodongmc_28()
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


package _10018_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1454")]
   public dynamic class random14658_49936_36 extends MovieClip
   {
      
      public function random14658_49936_36()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      public function onOver(param1:MouseEvent) : void
      {
         gotoAndStop(2);
      }
      
      public function onOut(param1:MouseEvent) : void
      {
         gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         stop();
         mouseChildren = false;
         addEventListener(MouseEvent.MOUSE_OVER,this.onOver);
         addEventListener(MouseEvent.MOUSE_OUT,this.onOut);
      }
   }
}


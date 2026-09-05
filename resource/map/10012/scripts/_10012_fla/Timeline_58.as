package _10012_fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol188")]
   public dynamic class Timeline_58 extends MovieClip
   {
      
      public function Timeline_58()
      {
         super();
         addFrameScript(0,frame1);
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
         addEventListener(MouseEvent.MOUSE_OVER,onOver);
         addEventListener(MouseEvent.MOUSE_OUT,onOut);
      }
   }
}


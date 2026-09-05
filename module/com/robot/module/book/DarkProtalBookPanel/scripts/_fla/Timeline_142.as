package _fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol412")]
   public dynamic class Timeline_142 extends MovieClip
   {
      
      public var mm:MovieClip;
      
      public function Timeline_142()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         mm.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         mm.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         mm.gotoAndStop(2);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         mm.gotoAndStop(1);
      }
   }
}


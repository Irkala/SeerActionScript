package _fla
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol584")]
   public dynamic class Timeline_262 extends MovieClip
   {
      
      public var mm1:MovieClip;
      
      public function Timeline_262()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         mm1.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler1);
         mm1.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler1);
      }
      
      public function onOutHandler1(param1:MouseEvent) : void
      {
         mm1.gotoAndStop(1);
      }
      
      public function onOverHandler1(param1:MouseEvent) : void
      {
         mm1.gotoAndStop(2);
      }
   }
}


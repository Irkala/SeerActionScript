package §500014_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var comp_0:MovieClip;
      
      public var door_0:MovieClip;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         door_0.addEventListener(MouseEvent.MOUSE_OVER,onOverHandler);
         door_0.addEventListener(MouseEvent.MOUSE_OUT,onOutHandler);
      }
      
      public function onOverHandler(param1:MouseEvent) : void
      {
         door_0.gotoAndStop(2);
      }
      
      public function onOutHandler(param1:MouseEvent) : void
      {
         door_0.gotoAndStop(1);
      }
   }
}


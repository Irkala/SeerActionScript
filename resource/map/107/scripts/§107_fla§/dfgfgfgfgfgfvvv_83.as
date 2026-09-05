package §107_fla§
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol319")]
   public dynamic class dfgfgfgfgfgfvvv_83 extends MovieClip
   {
      
      public var nonoMC:MovieClip;
      
      public var nonoStage:MovieClip;
      
      public function dfgfgfgfgfgfvvv_83()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      public function onMouseOverHandler(param1:MouseEvent) : void
      {
         this.gotoAndStop(2);
      }
      
      public function onMouseOutHandler(param1:MouseEvent) : void
      {
         this.gotoAndStop(1);
      }
      
      internal function frame1() : *
      {
         stop();
         this.addEventListener(MouseEvent.MOUSE_OVER,onMouseOverHandler);
         this.addEventListener(MouseEvent.MOUSE_OUT,onMouseOutHandler);
      }
   }
}


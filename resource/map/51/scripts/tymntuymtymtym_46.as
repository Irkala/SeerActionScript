package
{
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol647")]
   public dynamic class tymntuymtymtym_46 extends MovieClip
   {
      
      public var milu:ghmtymtymtym_57;
      
      public function tymntuymtymtym_46()
      {
         super();
         addFrameScript(8,this.frame9);
         this.stop();
         this.addEventListener(MouseEvent.CLICK,this.onMouseClickHandler);
      }
      
      private function onMouseClickHandler(param1:MouseEvent) : void
      {
         this.gotoAndPlay(1);
         this.removeEventListener(MouseEvent.CLICK,this.onMouseClickHandler);
      }
      
      internal function frame9() : *
      {
         stop();
      }
   }
}


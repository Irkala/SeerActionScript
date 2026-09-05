package _fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol887")]
   public dynamic class Timeline_279 extends MovieClip
   {
      
      public var wudou_mc:MovieClip;
      
      public function Timeline_279()
      {
         super();
         addFrameScript(0,this.frame1);
      }
      
      internal function frame1() : *
      {
         this.wudou_mc.addEventListener(MouseEvent.CLICK,this.wudouClickHandler);
         this.wudou_mc.buttonMode = true;
      }
      
      public function wudouClickHandler(param1:MouseEvent) : void
      {
         MovieClip(this.parent.parent).dispatchEvent(new Event("changewudou"));
      }
   }
}


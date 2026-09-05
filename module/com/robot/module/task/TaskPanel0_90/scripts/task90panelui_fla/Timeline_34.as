package task90panelui_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class Timeline_34 extends MovieClip
   {
      
      public function Timeline_34()
      {
         super();
         addFrameScript(63,frame64);
      }
      
      internal function frame64() : *
      {
         MovieClip(this.parent).dispatchEvent(new Event("enddh"));
         stop();
      }
   }
}


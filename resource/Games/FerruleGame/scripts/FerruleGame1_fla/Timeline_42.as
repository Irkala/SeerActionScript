package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol142")]
   public dynamic class Timeline_42 extends MovieClip
   {
      
      public function Timeline_42()
      {
         super();
         addFrameScript(31,frame32);
      }
      
      internal function frame32() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


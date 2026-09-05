package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol9")]
   public dynamic class Timeline_71 extends MovieClip
   {
      
      public function Timeline_71()
      {
         super();
         addFrameScript(23,frame24);
      }
      
      internal function frame24() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


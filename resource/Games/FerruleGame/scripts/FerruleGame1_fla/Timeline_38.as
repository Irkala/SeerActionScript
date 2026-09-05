package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol133")]
   public dynamic class Timeline_38 extends MovieClip
   {
      
      public function Timeline_38()
      {
         super();
         addFrameScript(29,frame30);
      }
      
      internal function frame30() : *
      {
         this.parent.dispatchEvent(new Event("EffectEnd"));
         stop();
      }
   }
}


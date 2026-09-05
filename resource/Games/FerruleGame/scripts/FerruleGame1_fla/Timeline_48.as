package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol228")]
   public dynamic class Timeline_48 extends MovieClip
   {
      
      public function Timeline_48()
      {
         super();
         addFrameScript(30,frame31);
      }
      
      internal function frame31() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


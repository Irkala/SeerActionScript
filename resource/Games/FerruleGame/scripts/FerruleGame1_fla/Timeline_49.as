package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol242")]
   public dynamic class Timeline_49 extends MovieClip
   {
      
      public function Timeline_49()
      {
         super();
         addFrameScript(38,frame39);
      }
      
      internal function frame39() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


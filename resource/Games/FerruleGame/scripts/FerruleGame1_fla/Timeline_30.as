package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol109")]
   public dynamic class Timeline_30 extends MovieClip
   {
      
      public function Timeline_30()
      {
         super();
         addFrameScript(48,frame49);
      }
      
      internal function frame49() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


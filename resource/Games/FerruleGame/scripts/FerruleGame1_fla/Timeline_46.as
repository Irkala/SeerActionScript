package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol200")]
   public dynamic class Timeline_46 extends MovieClip
   {
      
      public function Timeline_46()
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


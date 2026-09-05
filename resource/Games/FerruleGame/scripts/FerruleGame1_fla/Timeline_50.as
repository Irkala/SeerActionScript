package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol255")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public function Timeline_50()
      {
         super();
         addFrameScript(35,frame36);
      }
      
      internal function frame36() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


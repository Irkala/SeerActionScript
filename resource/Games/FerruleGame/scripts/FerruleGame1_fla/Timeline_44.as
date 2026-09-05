package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol172")]
   public dynamic class Timeline_44 extends MovieClip
   {
      
      public function Timeline_44()
      {
         super();
         addFrameScript(40,frame41);
      }
      
      internal function frame41() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


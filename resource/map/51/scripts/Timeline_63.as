package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol627")]
   public dynamic class Timeline_63 extends MovieClip
   {
      
      public var cup_mc:MovieClip;
      
      public function Timeline_63()
      {
         super();
         addFrameScript(232,this.frame233);
      }
      
      internal function frame233() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol340")]
   public dynamic class qwe65_190 extends MovieClip
   {
      
      public function qwe65_190()
      {
         super();
         addFrameScript(139,this.frame140);
      }
      
      internal function frame140() : *
      {
         stop();
         this.parent.dispatchEvent(new Event("EffectEnd"));
      }
   }
}


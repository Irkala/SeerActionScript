package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol449")]
   public dynamic class qwe65_172 extends MovieClip
   {
      
      public function qwe65_172()
      {
         super();
         addFrameScript(239,this.frame240);
      }
      
      internal function frame240() : *
      {
         stop();
         trace(this.parent.name);
         this.parent.dispatchEvent(new Event("EFFECTEND"));
      }
   }
}


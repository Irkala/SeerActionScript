package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol71")]
   public dynamic class fireworks1 extends MovieClip
   {
      
      public function fireworks1()
      {
         super();
         addFrameScript(70,frame71);
      }
      
      internal function frame71() : *
      {
         stop();
         this.dispatchEvent(new Event("play_end"));
      }
   }
}


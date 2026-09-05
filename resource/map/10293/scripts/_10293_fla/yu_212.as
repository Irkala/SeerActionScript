package _10293_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol585")]
   public dynamic class yu_212 extends MovieClip
   {
      
      public function yu_212()
      {
         super();
         addFrameScript(23,frame24);
      }
      
      internal function frame24() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


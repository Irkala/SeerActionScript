package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1298")]
   public dynamic class houbxx_367 extends MovieClip
   {
      
      public function houbxx_367()
      {
         super();
         addFrameScript(31,frame32);
      }
      
      internal function frame32() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


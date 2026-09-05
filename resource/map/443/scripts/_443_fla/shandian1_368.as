package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1304")]
   public dynamic class shandian1_368 extends MovieClip
   {
      
      public function shandian1_368()
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


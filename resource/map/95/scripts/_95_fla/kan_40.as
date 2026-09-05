package _95_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol205")]
   public dynamic class kan_40 extends MovieClip
   {
      
      public function kan_40()
      {
         super();
         addFrameScript(14,frame15);
      }
      
      internal function frame15() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


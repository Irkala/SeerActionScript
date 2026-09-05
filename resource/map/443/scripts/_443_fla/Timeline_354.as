package _443_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol1195")]
   public dynamic class Timeline_354 extends MovieClip
   {
      
      public function Timeline_354()
      {
         super();
         addFrameScript(22,frame23);
      }
      
      internal function frame23() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


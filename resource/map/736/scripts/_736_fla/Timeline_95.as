package _736_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol362")]
   public dynamic class Timeline_95 extends MovieClip
   {
      
      public function Timeline_95()
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


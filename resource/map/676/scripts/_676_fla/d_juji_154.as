package _676_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol571")]
   public dynamic class d_juji_154 extends MovieClip
   {
      
      public function d_juji_154()
      {
         super();
         addFrameScript(21,frame22);
      }
      
      internal function frame22() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


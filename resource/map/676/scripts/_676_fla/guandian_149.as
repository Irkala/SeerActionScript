package _676_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol511")]
   public dynamic class guandian_149 extends MovieClip
   {
      
      public function guandian_149()
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


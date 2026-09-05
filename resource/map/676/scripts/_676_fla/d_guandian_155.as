package _676_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol552")]
   public dynamic class d_guandian_155 extends MovieClip
   {
      
      public function d_guandian_155()
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


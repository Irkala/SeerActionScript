package _773_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol330")]
   public dynamic class houa_122 extends MovieClip
   {
      
      public function houa_122()
      {
         super();
         addFrameScript(25,frame26);
      }
      
      internal function frame26() : *
      {
         stop();
         this.dispatchEvent(new Event("playComplete",true));
      }
   }
}


package §421_fla§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol378")]
   public dynamic class houb_105 extends MovieClip
   {
      
      public function houb_105()
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


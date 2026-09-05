package §13_fla§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol234")]
   public dynamic class kjhkjl_58 extends MovieClip
   {
      
      public function kjhkjl_58()
      {
         super();
         addFrameScript(114,frame115);
      }
      
      internal function frame115() : *
      {
         stop();
         this.parent.parent.dispatchEvent(new Event(Event.CLOSE));
      }
   }
}


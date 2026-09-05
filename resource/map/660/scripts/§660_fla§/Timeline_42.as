package §660_fla§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol104")]
   public dynamic class Timeline_42 extends MovieClip
   {
      
      public function Timeline_42()
      {
         super();
         addFrameScript(0,frame1,16,frame17,59,frame60);
      }
      
      internal function frame17() : *
      {
         stop();
         dispatchEvent(new Event("TalkEvent"));
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame60() : *
      {
         stop();
      }
   }
}


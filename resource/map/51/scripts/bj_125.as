package
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol503")]
   public dynamic class bj_125 extends MovieClip
   {
      
      public function bj_125()
      {
         super();
         addFrameScript(0,this.frame1,149,this.frame150);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame150() : *
      {
         stop();
         dispatchEvent(new Event("CanClickHandler"));
      }
   }
}


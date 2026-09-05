package FerruleGame1_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol278")]
   public dynamic class Timeline_59 extends MovieClip
   {
      
      public function Timeline_59()
      {
         super();
         addFrameScript(7,frame8,17,frame18);
      }
      
      internal function frame8() : *
      {
         trace(this.parent.name);
         this.parent.dispatchEvent(new Event("ShowCircleNow"));
      }
      
      internal function frame18() : *
      {
         stop();
      }
   }
}


package _449_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol499")]
   public dynamic class Timeline_187 extends MovieClip
   {
      
      public function Timeline_187()
      {
         super();
         addFrameScript(19,frame20);
      }
      
      internal function frame20() : *
      {
         this.parent.dispatchEvent(new Event("fire"));
      }
   }
}


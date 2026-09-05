package _449_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol480")]
   public dynamic class Timeline_178 extends MovieClip
   {
      
      public function Timeline_178()
      {
         super();
         addFrameScript(39,frame40);
      }
      
      internal function frame40() : *
      {
         this.parent.dispatchEvent(new Event("fire"));
      }
   }
}


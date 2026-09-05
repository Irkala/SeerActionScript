package _449_fla
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol497")]
   public dynamic class Timeline_185 extends MovieClip
   {
      
      public function Timeline_185()
      {
         super();
         addFrameScript(10,frame11);
      }
      
      internal function frame11() : *
      {
         this.parent.dispatchEvent(new Event("fire"));
      }
   }
}


package §52_fla§
{
   import flash.display.MovieClip;
   import flash.events.Event;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol332")]
   public dynamic class Timeline_53 extends MovieClip
   {
      
      public var nono_mc:MovieClip;
      
      public function Timeline_53()
      {
         super();
         addFrameScript(0,frame1);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      public function sendQm() : void
      {
         this.dispatchEvent(new Event("sendqingmidu"));
      }
   }
}


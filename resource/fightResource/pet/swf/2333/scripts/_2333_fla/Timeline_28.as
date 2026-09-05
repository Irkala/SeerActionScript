package _2333_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class Timeline_28 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_28()
      {
         super();
         addFrameScript(0,frame1,15,frame16,46,frame47);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame47() : *
      {
         stop();
      }
   }
}


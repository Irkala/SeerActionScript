package _1377_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol24")]
   public dynamic class Timeline_15 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_15()
      {
         super();
         addFrameScript(0,frame1,22,frame23,59,frame60);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
      
      internal function frame60() : *
      {
         stop();
      }
   }
}


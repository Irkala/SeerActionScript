package _4149_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol112")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_50()
      {
         super();
         addFrameScript(0,frame1,60,frame61,92,frame93);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         hit = 1;
      }
      
      internal function frame93() : *
      {
         stop();
      }
   }
}


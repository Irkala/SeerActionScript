package _1529_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol600")]
   public dynamic class Timeline_221 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_221()
      {
         super();
         addFrameScript(0,frame1,60,frame61,112,frame113);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         hit = 1;
      }
      
      internal function frame113() : *
      {
         stop();
      }
   }
}


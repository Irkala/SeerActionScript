package _2048_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol33")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1,20,frame21,56,frame57);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame57() : *
      {
         stop();
      }
   }
}


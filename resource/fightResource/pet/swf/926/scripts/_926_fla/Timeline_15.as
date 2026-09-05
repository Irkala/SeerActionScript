package _926_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public dynamic class Timeline_15 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_15()
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


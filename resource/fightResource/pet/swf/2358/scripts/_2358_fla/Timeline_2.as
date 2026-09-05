package _2358_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol65")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,56,frame57,77,frame78);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame57() : *
      {
         hit = 1;
      }
      
      internal function frame78() : *
      {
         stop();
      }
   }
}


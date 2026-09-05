package _1143_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol21")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,56,frame57,99,frame100);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame57() : *
      {
         hit = 1;
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}


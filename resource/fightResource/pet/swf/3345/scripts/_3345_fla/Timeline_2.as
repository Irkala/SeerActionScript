package _3345_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol228")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,79,frame80,100,frame101);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame80() : *
      {
         hit = 1;
      }
      
      internal function frame101() : *
      {
         stop();
      }
   }
}


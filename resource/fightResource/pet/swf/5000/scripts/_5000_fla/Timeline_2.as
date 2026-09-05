package _5000_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol511")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,138,frame139,172,frame173);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame139() : *
      {
         hit = 1;
      }
      
      internal function frame173() : *
      {
         stop();
      }
   }
}


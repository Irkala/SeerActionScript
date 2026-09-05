package _553_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,22,frame23,62,frame63);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
      
      internal function frame63() : *
      {
         stop();
      }
   }
}


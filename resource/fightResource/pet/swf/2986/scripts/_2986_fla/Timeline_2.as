package _2986_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol294")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,62,frame63,86,frame87);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame63() : *
      {
         hit = 1;
      }
      
      internal function frame87() : *
      {
         stop();
      }
   }
}


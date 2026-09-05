package _462_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol85")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,70,frame71,127,frame128);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame71() : *
      {
         hit = 1;
      }
      
      internal function frame128() : *
      {
         stop();
      }
   }
}


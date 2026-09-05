package _440_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol27")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,44,frame45,81,frame82);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         hit = 1;
      }
      
      internal function frame82() : *
      {
         stop();
      }
   }
}


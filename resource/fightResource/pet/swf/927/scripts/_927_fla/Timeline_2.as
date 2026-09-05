package _927_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol30")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,44,frame45,89,frame90);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         hit = 1;
      }
      
      internal function frame90() : *
      {
         stop();
      }
   }
}


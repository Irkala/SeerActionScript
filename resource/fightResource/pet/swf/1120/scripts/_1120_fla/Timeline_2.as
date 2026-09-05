package _1120_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,44,frame45,84,frame85);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         hit = 1;
      }
      
      internal function frame85() : *
      {
         stop();
      }
   }
}


package _4134_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol220")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,134,frame135,163,frame164);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame135() : *
      {
         hit = 1;
      }
      
      internal function frame164() : *
      {
         stop();
      }
   }
}


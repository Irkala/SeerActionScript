package _2586_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol111")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,85,frame86,113,frame114);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame86() : *
      {
         hit = 1;
      }
      
      internal function frame114() : *
      {
         stop();
      }
   }
}


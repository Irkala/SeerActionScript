package _1451_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,35,frame36,81,frame82);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame36() : *
      {
         hit = 1;
      }
      
      internal function frame82() : *
      {
         stop();
      }
   }
}


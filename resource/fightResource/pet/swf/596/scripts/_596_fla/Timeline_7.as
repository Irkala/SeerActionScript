package _596_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol9")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,23,frame24,58,frame59);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         hit = 1;
      }
      
      internal function frame59() : *
      {
         stop();
      }
   }
}


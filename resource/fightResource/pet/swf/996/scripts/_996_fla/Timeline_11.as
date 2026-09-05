package _996_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol24")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,frame1,14,frame15,52,frame53);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         hit = 1;
      }
      
      internal function frame53() : *
      {
         stop();
      }
   }
}


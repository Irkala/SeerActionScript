package _1304_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,27,frame28,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame28() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}


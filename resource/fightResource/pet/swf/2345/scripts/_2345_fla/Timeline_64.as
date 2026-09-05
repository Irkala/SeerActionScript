package _2345_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol155")]
   public dynamic class Timeline_64 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_64()
      {
         super();
         addFrameScript(0,frame1,22,frame23,51,frame52);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
      
      internal function frame52() : *
      {
         stop();
      }
   }
}


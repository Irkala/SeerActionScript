package _439_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol20")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,22,frame23,77,frame78);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
      
      internal function frame78() : *
      {
         stop();
      }
   }
}


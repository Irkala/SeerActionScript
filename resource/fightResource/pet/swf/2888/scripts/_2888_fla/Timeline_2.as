package _2888_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol203")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,59,frame60,99,frame100);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame60() : *
      {
         hit = 1;
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}


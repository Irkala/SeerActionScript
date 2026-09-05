package _1121_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol39")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,51,frame52,80,frame81);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame52() : *
      {
         hit = 1;
      }
      
      internal function frame81() : *
      {
         stop();
      }
   }
}


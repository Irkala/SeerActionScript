package _3990_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol961")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,121,frame122,150,frame151);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame122() : *
      {
         hit = 1;
      }
      
      internal function frame151() : *
      {
         stop();
      }
   }
}


package _4001_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol752")]
   public dynamic class Timeline_80 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_80()
      {
         super();
         addFrameScript(0,frame1,128,frame129,150,frame151);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame129() : *
      {
         hit = 1;
      }
      
      internal function frame151() : *
      {
         stop();
      }
   }
}


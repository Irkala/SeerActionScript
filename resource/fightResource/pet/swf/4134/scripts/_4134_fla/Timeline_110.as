package _4134_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol321")]
   public dynamic class Timeline_110 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_110()
      {
         super();
         addFrameScript(0,frame1,44,frame45,88,frame89);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame45() : *
      {
         hit = 1;
      }
      
      internal function frame89() : *
      {
         stop();
      }
   }
}


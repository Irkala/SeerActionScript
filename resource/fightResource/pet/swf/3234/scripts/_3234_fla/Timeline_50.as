package _3234_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol124")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_50()
      {
         super();
         addFrameScript(0,frame1,31,frame32,63,frame64);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         hit = 1;
      }
      
      internal function frame64() : *
      {
         stop();
      }
   }
}


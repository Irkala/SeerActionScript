package _718_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol28")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,27,frame28,54,frame55);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame28() : *
      {
         hit = 1;
      }
      
      internal function frame55() : *
      {
         stop();
      }
   }
}


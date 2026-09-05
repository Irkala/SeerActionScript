package _560_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class Timeline_8 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_8()
      {
         super();
         addFrameScript(0,frame1,25,frame26,60,frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         hit = 1;
      }
      
      internal function frame61() : *
      {
         stop();
      }
   }
}


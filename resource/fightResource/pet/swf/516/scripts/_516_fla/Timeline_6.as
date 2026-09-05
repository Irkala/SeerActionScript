package _516_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,31,frame32,70,frame71);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         hit = 1;
      }
      
      internal function frame71() : *
      {
         stop();
      }
   }
}


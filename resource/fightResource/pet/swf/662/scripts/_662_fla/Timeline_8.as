package _662_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_8 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_8()
      {
         super();
         addFrameScript(0,frame1,9,frame10,44,frame45);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame10() : *
      {
         hit = 1;
      }
      
      internal function frame45() : *
      {
         stop();
      }
   }
}


package _009_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol33")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,14,frame15,57,frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}


package _389_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol80")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,51,frame52,90,frame91);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame52() : *
      {
         hit = 1;
      }
      
      internal function frame91() : *
      {
         stop();
      }
   }
}


package _954_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1,22,frame23,57,frame58);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
      
      internal function frame58() : *
      {
         stop();
      }
   }
}


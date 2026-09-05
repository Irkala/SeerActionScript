package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,22,frame23,72,frame73);
      }
      
      internal function frame73() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame23() : *
      {
         hit = 1;
      }
   }
}


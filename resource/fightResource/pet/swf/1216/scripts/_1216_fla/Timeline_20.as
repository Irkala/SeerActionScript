package _1216_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol41")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1,30,frame31,69,frame70);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame70() : *
      {
         stop();
      }
   }
}


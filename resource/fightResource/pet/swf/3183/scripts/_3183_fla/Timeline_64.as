package _3183_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol274")]
   public dynamic class Timeline_64 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_64()
      {
         super();
         addFrameScript(0,frame1,30,frame31,66,frame67);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame67() : *
      {
         stop();
      }
   }
}


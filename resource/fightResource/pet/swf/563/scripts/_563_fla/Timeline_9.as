package _563_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol18")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,frame1,25,frame26,66,frame67);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         hit = 1;
      }
      
      internal function frame67() : *
      {
         stop();
      }
   }
}


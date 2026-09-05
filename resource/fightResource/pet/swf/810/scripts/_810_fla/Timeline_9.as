package _810_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,frame1,41,frame42,54,frame55);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame42() : *
      {
         hit = 1;
      }
      
      internal function frame55() : *
      {
         stop();
      }
   }
}


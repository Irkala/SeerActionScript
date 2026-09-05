package _593_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol45")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1,35,frame36,80,frame81);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame36() : *
      {
         hit = 1;
      }
      
      internal function frame81() : *
      {
         stop();
      }
   }
}


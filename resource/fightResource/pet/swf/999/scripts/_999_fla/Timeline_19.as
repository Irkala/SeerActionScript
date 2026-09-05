package _999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_19 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_19()
      {
         super();
         addFrameScript(0,frame1,29,frame30,63,frame64);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         hit = 1;
      }
      
      internal function frame64() : *
      {
         stop();
      }
   }
}


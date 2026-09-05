package _637_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_16 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_16()
      {
         super();
         addFrameScript(0,frame1,24,frame25,59,frame60);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame60() : *
      {
         stop();
      }
   }
}


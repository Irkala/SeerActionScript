package _2100_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol106")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,68,frame69,107,frame108);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame69() : *
      {
         hit = 1;
      }
      
      internal function frame108() : *
      {
         stop();
      }
   }
}


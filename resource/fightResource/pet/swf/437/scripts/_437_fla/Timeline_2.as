package _437_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,66,frame67,148,frame149);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame67() : *
      {
         hit = 1;
      }
      
      internal function frame149() : *
      {
         stop();
      }
   }
}


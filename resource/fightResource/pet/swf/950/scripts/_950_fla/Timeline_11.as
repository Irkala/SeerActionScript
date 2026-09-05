package _950_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_11 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_11()
      {
         super();
         addFrameScript(0,frame1,19,frame20,70,frame71);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         hit = 1;
      }
      
      internal function frame71() : *
      {
         stop();
      }
   }
}


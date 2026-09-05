package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,60,frame61,116,frame117);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame117() : *
      {
         stop();
      }
      
      internal function frame61() : *
      {
         hit = 1;
      }
   }
}


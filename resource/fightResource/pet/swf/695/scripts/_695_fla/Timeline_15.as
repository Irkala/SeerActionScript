package _695_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_15 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_15()
      {
         super();
         addFrameScript(0,frame1,19,frame20,60,frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         hit = 1;
      }
      
      internal function frame61() : *
      {
         stop();
      }
   }
}


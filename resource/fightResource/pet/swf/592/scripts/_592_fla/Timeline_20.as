package _592_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol40")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1,24,frame25,60,frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame61() : *
      {
         stop();
      }
   }
}


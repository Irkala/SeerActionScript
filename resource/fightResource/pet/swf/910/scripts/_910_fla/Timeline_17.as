package _910_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol53")]
   public dynamic class Timeline_17 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_17()
      {
         super();
         addFrameScript(0,frame1,21,frame22,60,frame61);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame22() : *
      {
         hit = 1;
      }
      
      internal function frame61() : *
      {
         stop();
      }
   }
}


package _2999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol250")]
   public dynamic class Timeline_43 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_43()
      {
         super();
         addFrameScript(0,frame1,58,frame59,97,frame98);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame59() : *
      {
         hit = 1;
      }
      
      internal function frame98() : *
      {
         stop();
      }
   }
}


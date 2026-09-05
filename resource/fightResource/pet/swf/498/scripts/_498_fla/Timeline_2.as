package _498_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol83")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,50,frame51,97,frame98);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame51() : *
      {
         hit = 1;
      }
      
      internal function frame98() : *
      {
         stop();
      }
   }
}


package _1167_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol41")]
   public dynamic class Timeline_20 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_20()
      {
         super();
         addFrameScript(0,frame1,20,frame21,59,frame60);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame60() : *
      {
         stop();
      }
   }
}


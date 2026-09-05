package _481_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol25")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,74,frame75,165,frame166);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame75() : *
      {
         hit = 1;
      }
      
      internal function frame166() : *
      {
         stop();
      }
   }
}


package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,74,frame75,143,frame144);
      }
      
      internal function frame144() : *
      {
         stop();
      }
      
      internal function frame75() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}


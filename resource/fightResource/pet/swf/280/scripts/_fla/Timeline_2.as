package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,62,frame63,124,frame125);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame125() : *
      {
         stop();
      }
      
      internal function frame63() : *
      {
         hit = 1;
      }
   }
}


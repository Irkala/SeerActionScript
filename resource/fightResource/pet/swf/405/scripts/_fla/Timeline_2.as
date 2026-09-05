package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,172,frame173,267,frame268);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame173() : *
      {
         hit = 1;
      }
      
      internal function frame268() : *
      {
         stop();
      }
   }
}


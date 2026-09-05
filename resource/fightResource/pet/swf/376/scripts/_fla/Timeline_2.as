package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,122,frame123,181,frame182);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame182() : *
      {
         stop();
      }
      
      internal function frame123() : *
      {
         hit = 1;
      }
   }
}


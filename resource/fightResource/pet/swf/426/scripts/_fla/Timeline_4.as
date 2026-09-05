package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol85")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,80,frame81,100,frame101);
      }
      
      internal function frame81() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame101() : *
      {
         stop();
      }
   }
}


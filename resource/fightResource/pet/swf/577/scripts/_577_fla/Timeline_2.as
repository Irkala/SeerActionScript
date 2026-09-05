package _577_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,46,frame47,80,frame81);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame47() : *
      {
         hit = 1;
      }
      
      internal function frame81() : *
      {
         stop();
      }
   }
}


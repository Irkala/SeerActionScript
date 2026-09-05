package _640_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol10")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,14,frame15,46,frame47);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         hit = 1;
      }
      
      internal function frame47() : *
      {
         stop();
      }
   }
}


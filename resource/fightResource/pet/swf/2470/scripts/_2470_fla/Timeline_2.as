package _2470_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol64")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,46,frame47,82,frame83);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame47() : *
      {
         hit = 1;
      }
      
      internal function frame83() : *
      {
         stop();
      }
   }
}


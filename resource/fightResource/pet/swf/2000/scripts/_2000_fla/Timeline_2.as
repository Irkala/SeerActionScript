package _2000_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol188")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,92,frame93,134,frame135);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame93() : *
      {
         hit = 1;
      }
      
      internal function frame135() : *
      {
         stop();
      }
   }
}


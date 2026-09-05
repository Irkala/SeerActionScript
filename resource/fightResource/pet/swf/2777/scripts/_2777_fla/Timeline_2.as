package _2777_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol290")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,134,frame135,168,frame169);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame135() : *
      {
         hit = 1;
      }
      
      internal function frame169() : *
      {
         stop();
      }
   }
}


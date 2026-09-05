package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol14")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,100,frame101,191,frame192);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame192() : *
      {
         stop();
      }
      
      internal function frame101() : *
      {
         hit = 1;
      }
   }
}


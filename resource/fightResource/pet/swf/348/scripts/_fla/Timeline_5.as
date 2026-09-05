package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol130")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,15,frame16,107,frame108);
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame108() : *
      {
         stop();
      }
   }
}


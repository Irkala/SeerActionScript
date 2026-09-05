package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol8")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,31,frame32,67,frame68);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame32() : *
      {
         hit = 1;
      }
      
      internal function frame68() : *
      {
         stop();
      }
   }
}


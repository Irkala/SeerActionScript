package _999_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public dynamic class Timeline_22 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_22()
      {
         super();
         addFrameScript(0,frame1,19,frame20,54,frame55);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame20() : *
      {
         hit = 1;
      }
      
      internal function frame55() : *
      {
         stop();
      }
   }
}


package _3544_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol393")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,89,frame90,115,frame116);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame90() : *
      {
         hit = 1;
      }
      
      internal function frame116() : *
      {
         stop();
      }
   }
}


package _3055_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol130")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,68,frame69,89,frame90);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame69() : *
      {
         hit = 1;
      }
      
      internal function frame90() : *
      {
         stop();
      }
   }
}


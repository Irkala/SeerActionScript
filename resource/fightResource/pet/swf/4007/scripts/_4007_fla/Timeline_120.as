package _4007_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol385")]
   public dynamic class Timeline_120 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_120()
      {
         super();
         addFrameScript(0,frame1,99,frame100,135,frame136);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame100() : *
      {
         hit = 1;
      }
      
      internal function frame136() : *
      {
         stop();
      }
   }
}


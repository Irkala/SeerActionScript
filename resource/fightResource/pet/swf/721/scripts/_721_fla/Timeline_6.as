package _721_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,30,frame31,67,frame68);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame31() : *
      {
         hit = 1;
      }
      
      internal function frame68() : *
      {
         stop();
      }
   }
}


package _186_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol33")]
   public dynamic class Timeline_7 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_7()
      {
         super();
         addFrameScript(0,frame1,42,frame43,74,frame75);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame43() : *
      {
         hit = 1;
      }
      
      internal function frame75() : *
      {
         stop();
      }
   }
}


package _453_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,42,frame43,84,frame85);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame43() : *
      {
         hit = 1;
      }
      
      internal function frame85() : *
      {
         stop();
      }
   }
}


package _452_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol35")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,23,frame24,75,frame76);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame24() : *
      {
         hit = 1;
      }
      
      internal function frame76() : *
      {
         stop();
      }
   }
}


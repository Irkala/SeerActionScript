package _4100_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol109")]
   public dynamic class Timeline_50 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_50()
      {
         super();
         addFrameScript(0,frame1,75,frame76,117,frame118);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame76() : *
      {
         hit = 1;
      }
      
      internal function frame118() : *
      {
         stop();
      }
   }
}


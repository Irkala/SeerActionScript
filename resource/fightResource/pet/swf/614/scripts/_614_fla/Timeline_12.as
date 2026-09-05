package _614_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol50")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,25,frame26,76,frame77);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame26() : *
      {
         hit = 1;
      }
      
      internal function frame77() : *
      {
         stop();
      }
   }
}


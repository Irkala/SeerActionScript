package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol101")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,27,frame28,110,frame111);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame111() : *
      {
         stop();
      }
      
      internal function frame28() : *
      {
         hit = 1;
      }
   }
}


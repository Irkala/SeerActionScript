package _581_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol7")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,17,frame18,54,frame55);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         hit = 1;
      }
      
      internal function frame55() : *
      {
         stop();
      }
   }
}


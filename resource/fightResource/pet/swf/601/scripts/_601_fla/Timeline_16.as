package _601_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol36")]
   public dynamic class Timeline_16 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_16()
      {
         super();
         addFrameScript(0,frame1,29,frame30,69,frame70);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame30() : *
      {
         hit = 1;
      }
      
      internal function frame70() : *
      {
         stop();
      }
   }
}


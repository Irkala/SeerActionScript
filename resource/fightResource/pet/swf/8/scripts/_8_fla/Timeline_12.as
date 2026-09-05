package _8_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,17,frame18,50,frame51);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame18() : *
      {
         hit = 1;
      }
      
      internal function frame51() : *
      {
         stop();
      }
   }
}


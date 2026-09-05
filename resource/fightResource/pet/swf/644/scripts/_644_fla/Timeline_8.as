package _644_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_8 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_8()
      {
         super();
         addFrameScript(0,frame1,15,frame16,52,frame53);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame53() : *
      {
         stop();
      }
   }
}


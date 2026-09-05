package _652_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol26")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,15,frame16,55,frame56);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame16() : *
      {
         hit = 1;
      }
      
      internal function frame56() : *
      {
         stop();
      }
   }
}


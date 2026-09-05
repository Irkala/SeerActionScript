package _1990_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class Timeline_12 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_12()
      {
         super();
         addFrameScript(0,frame1,12,frame13,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame13() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}


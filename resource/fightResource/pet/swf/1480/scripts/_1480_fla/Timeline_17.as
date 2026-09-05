package _1480_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol32")]
   public dynamic class Timeline_17 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_17()
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


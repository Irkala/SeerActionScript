package _1016_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol50")]
   public dynamic class Timeline_14 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_14()
      {
         super();
         addFrameScript(0,frame1,14,frame15,49,frame50);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame15() : *
      {
         hit = 1;
      }
      
      internal function frame50() : *
      {
         stop();
      }
   }
}


package _743_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol47")]
   public dynamic class Timeline_21 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_21()
      {
         super();
         addFrameScript(0,frame1,24,frame25,74,frame75);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame75() : *
      {
         stop();
      }
   }
}


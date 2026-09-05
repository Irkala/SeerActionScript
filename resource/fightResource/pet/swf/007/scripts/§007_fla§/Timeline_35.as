package §007_fla§
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol86")]
   public dynamic class Timeline_35 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_35()
      {
         super();
         addFrameScript(0,frame1,24,frame25,124,frame125);
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame125() : *
      {
         stop();
      }
   }
}


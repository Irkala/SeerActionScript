package _617_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol42")]
   public dynamic class Timeline_15 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_15()
      {
         super();
         addFrameScript(0,frame1,24,frame25,65,frame66);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame66() : *
      {
         stop();
      }
   }
}


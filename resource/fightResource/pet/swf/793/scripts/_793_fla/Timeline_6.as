package _793_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol19")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,24,frame25,51,frame52);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame52() : *
      {
         stop();
      }
   }
}


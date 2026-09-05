package _2230_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol161")]
   public dynamic class Timeline_61 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_61()
      {
         super();
         addFrameScript(0,frame1,24,frame25,69,frame70);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame70() : *
      {
         stop();
      }
   }
}


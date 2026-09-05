package _1311_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol15")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,frame1,24,frame25,56,frame57);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame25() : *
      {
         hit = 1;
      }
      
      internal function frame57() : *
      {
         stop();
      }
   }
}


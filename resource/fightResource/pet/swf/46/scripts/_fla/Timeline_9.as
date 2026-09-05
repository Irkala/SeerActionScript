package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol85")]
   public dynamic class Timeline_9 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_9()
      {
         super();
         addFrameScript(0,frame1,39,frame40,74,frame75);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame40() : *
      {
         hit = 1;
      }
      
      internal function frame75() : *
      {
         stop();
      }
   }
}


package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol50")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,39,frame40,76,frame77);
      }
      
      internal function frame77() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame40() : *
      {
         hit = 1;
      }
   }
}


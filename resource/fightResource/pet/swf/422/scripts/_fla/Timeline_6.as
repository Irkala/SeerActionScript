package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol111")]
   public dynamic class Timeline_6 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_6()
      {
         super();
         addFrameScript(0,frame1,16,frame17,71,frame72);
      }
      
      internal function frame72() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame17() : *
      {
         hit = 1;
      }
   }
}


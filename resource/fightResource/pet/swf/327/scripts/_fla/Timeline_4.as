package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol24")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,16,frame17,74,frame75);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame17() : *
      {
         hit = 1;
      }
      
      internal function frame75() : *
      {
         stop();
      }
   }
}


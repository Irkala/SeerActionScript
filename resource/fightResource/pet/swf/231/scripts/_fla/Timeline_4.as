package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol14")]
   public dynamic class Timeline_4 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_4()
      {
         super();
         addFrameScript(0,frame1,20,frame21,74,frame75);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame75() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
   }
}


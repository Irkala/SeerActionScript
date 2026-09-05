package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol14")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,63,frame64,96,frame97);
      }
      
      internal function frame64() : *
      {
         hit = 1;
      }
      
      internal function frame97() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
   }
}


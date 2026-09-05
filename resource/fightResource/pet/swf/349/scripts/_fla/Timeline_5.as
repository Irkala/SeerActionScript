package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol21")]
   public dynamic class Timeline_5 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_5()
      {
         super();
         addFrameScript(0,frame1,49,frame50,88,frame89);
      }
      
      internal function frame89() : *
      {
         stop();
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame50() : *
      {
         hit = 1;
      }
   }
}


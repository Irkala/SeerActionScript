package _3745_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol440")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,88,frame89,126,frame127);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame89() : *
      {
         hit = 1;
      }
      
      internal function frame127() : *
      {
         stop();
      }
   }
}


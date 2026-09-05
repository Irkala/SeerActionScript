package _4193_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol255")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,126,frame127,153,frame154);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame127() : *
      {
         hit = 1;
      }
      
      internal function frame154() : *
      {
         stop();
      }
   }
}


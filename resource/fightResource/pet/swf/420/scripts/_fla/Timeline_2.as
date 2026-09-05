package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol23")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,174,frame175,241,frame242);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame175() : *
      {
         hit = 1;
      }
      
      internal function frame242() : *
      {
         stop();
      }
   }
}


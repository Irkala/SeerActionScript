package _4325_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol270")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,125,frame126,149,frame150);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame126() : *
      {
         hit = 1;
      }
      
      internal function frame150() : *
      {
         stop();
      }
   }
}


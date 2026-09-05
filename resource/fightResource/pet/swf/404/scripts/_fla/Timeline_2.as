package _fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol17")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,55,frame56,103,frame104);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame104() : *
      {
         stop();
      }
      
      internal function frame56() : *
      {
         hit = 1;
      }
   }
}


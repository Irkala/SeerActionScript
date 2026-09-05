package _1900_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol13")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,33,frame34,58,frame59);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame34() : *
      {
         hit = 1;
      }
      
      internal function frame59() : *
      {
         stop();
      }
   }
}


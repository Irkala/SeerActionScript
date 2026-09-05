package _627_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol8")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,53,frame54,99,frame100);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame54() : *
      {
         hit = 1;
      }
      
      internal function frame100() : *
      {
         stop();
      }
   }
}


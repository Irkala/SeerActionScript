package _4345_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol245")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,130,frame131,156,frame157);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame131() : *
      {
         hit = 1;
      }
      
      internal function frame157() : *
      {
         stop();
      }
   }
}


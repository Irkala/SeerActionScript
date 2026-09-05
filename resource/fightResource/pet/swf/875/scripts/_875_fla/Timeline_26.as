package _875_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol70")]
   public dynamic class Timeline_26 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_26()
      {
         super();
         addFrameScript(0,frame1,20,frame21,64,frame65);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame21() : *
      {
         hit = 1;
      }
      
      internal function frame65() : *
      {
         stop();
      }
   }
}


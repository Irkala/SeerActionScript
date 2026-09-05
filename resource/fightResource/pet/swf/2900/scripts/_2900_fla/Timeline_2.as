package _2900_fla
{
   import flash.display.MovieClip;
   
   [Embed(source="/_assets/assets.swf", symbol="symbol229")]
   public dynamic class Timeline_2 extends MovieClip
   {
      
      public var hit:*;
      
      public function Timeline_2()
      {
         super();
         addFrameScript(0,frame1,145,frame146,177,frame178);
      }
      
      internal function frame1() : *
      {
         stop();
      }
      
      internal function frame146() : *
      {
         hit = 1;
      }
      
      internal function frame178() : *
      {
         stop();
      }
   }
}

